package cn.edu.ustc.file.controller;

import cn.edu.ustc.file.api.IShareFileService;
import cn.edu.ustc.file.api.IShareService;
import cn.edu.ustc.file.api.IUserFileService;
import cn.edu.ustc.file.component.FileDealComp;
import cn.edu.ustc.file.domain.Share;
import cn.edu.ustc.file.domain.ShareFile;
import cn.edu.ustc.file.domain.UserFile;
import cn.edu.ustc.file.dto.sharefile.*;
import cn.edu.ustc.file.io.QiwenFile;
import cn.edu.ustc.file.vo.share.ShareFileListVO;
import cn.edu.ustc.file.vo.share.ShareFileVO;
import cn.edu.ustc.file.vo.share.ShareListVO;
import cn.edu.ustc.file.vo.share.ShareTypeVO;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.RandomUtil;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.qiwenshare.common.anno.MyLog;
import com.qiwenshare.common.result.RestResult;
import com.qiwenshare.common.util.DateUtil;
import com.qiwenshare.common.util.security.JwtUser;
import com.qiwenshare.common.util.security.SessionUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Tag(name = "share", description = "该接口为文件分享接口")
@RestController
@Slf4j
@RequestMapping("/share")
public class ShareController {

    public static final String CURRENT_MODULE = "文件分享";

    @Resource
    IShareFileService shareFileService;
    @Resource
    IShareService shareService;
    @Resource
    IUserFileService userFileService;
    @Resource
    FileDealComp fileDealComp;

    @Operation(summary = "分享文件", description = "分享文件统一接口", tags = {"share"})
    @PostMapping(value = "/sharefile")
    @MyLog(operation = "分享文件", module = CURRENT_MODULE)
    @ResponseBody
    public RestResult<ShareFileVO> shareFile(@RequestBody ShareFileDTO shareSecretDTO) {
        ShareFileVO shareSecretVO = new ShareFileVO();
        JwtUser sessionUserBean = SessionUtil.getSession();

        String uuid = UUID.randomUUID().toString().replace("-", "");
        Share share = new Share();
        BeanUtil.copyProperties(shareSecretDTO, share);
        share.setShareTime(DateUtil.getCurrentTime());
        share.setUserId(sessionUserBean.getUserId());
        share.setShareStatus(0);
        if (shareSecretDTO.getShareType() == 1) {
            String extractionCode = RandomUtil.randomNumbers(6);
            share.setExtractionCode(extractionCode);
            shareSecretVO.setExtractionCode(share.getExtractionCode());
        }

        share.setShareBatchNum(uuid);
        shareService.save(share);

        List<ShareFile> fileList = JSON.parseArray(shareSecretDTO.getFiles(), ShareFile.class);
        List<ShareFile> saveFileList = new ArrayList<>();
        for (ShareFile shareFile : fileList) {
            UserFile userFile = userFileService.getById(shareFile.getUserFileId());
            if (userFile.getUserId().compareTo(sessionUserBean.getUserId()) != 0) {
                return RestResult.fail().message("您只能分享自己的文件");
            }
            if (userFile.getIsDir() == 1) {
                QiwenFile qiwenFile = new QiwenFile(userFile.getFilePath(), userFile.getFileName(), true);
                List<UserFile> userfileList = userFileService.selectUserFileByLikeRightFilePath(qiwenFile.getPath(), sessionUserBean.getUserId());
                for (UserFile userFile1 : userfileList) {
                    ShareFile shareFile1 = new ShareFile();
                    shareFile1.setUserFileId(userFile1.getUserFileId());
                    shareFile1.setShareBatchNum(uuid);
                    shareFile1.setShareFilePath(userFile1.getFilePath().replaceFirst(userFile.getFilePath().equals("/") ? "" : userFile.getFilePath(), ""));
                    saveFileList.add(shareFile1);
                }
            }
            shareFile.setShareFilePath("/");
            shareFile.setShareBatchNum(uuid);
            saveFileList.add(shareFile);


        }
        shareFileService.batchInsertShareFile(saveFileList);
        shareSecretVO.setShareBatchNum(uuid);

        return RestResult.success().data(shareSecretVO);
    }

    @Operation(summary = "保存分享文件", description = "用来将别人分享的文件保存到自己的网盘中", tags = {"share"})
    @PostMapping(value = "/savesharefile")
    @MyLog(operation = "保存分享文件", module = CURRENT_MODULE)
    @Transactional(rollbackFor=Exception.class)
    @ResponseBody
    public RestResult saveShareFile(@RequestBody SaveShareFileDTO saveShareFileDTO) {

        JwtUser sessionUserBean = SessionUtil.getSession();
        List<ShareFile> fileList = JSON.parseArray(saveShareFileDTO.getFiles(), ShareFile.class);
        String savefilePath = saveShareFileDTO.getFilePath();
        String userId = sessionUserBean.getUserId();

        List<UserFile> saveUserFileList = new ArrayList<>();
        for (ShareFile shareFile : fileList) {
            UserFile userFile = userFileService.getById(shareFile.getUserFileId());
            String fileName = userFile.getFileName();
            String savefileName = fileDealComp.getRepeatFileName(userFile, savefilePath);

            if (userFile.getIsDir() == 1) {
                List<UserFile> userfileList = userFileService.selectUserFileByLikeRightFilePath(new QiwenFile(userFile.getFilePath(), userFile.getFileName(), true).getPath(), userFile.getUserId());
                log.info("查询文件列表：" + JSON.toJSONString(userfileList));
                String filePath = userFile.getFilePath();
                userfileList.forEach(p->{
                    p.setUserFileId(IdUtil.getSnowflakeNextIdStr());
                    p.setUserId(userId);
                    p.setFilePath(p.getFilePath().replaceFirst(filePath + "/" + fileName, savefilePath + "/" + savefileName));
                    saveUserFileList.add(p);
                    log.info("当前文件：" + JSON.toJSONString(p));

                });
            }
            userFile.setUserFileId(IdUtil.getSnowflakeNextIdStr());
            userFile.setUserId(userId);
            userFile.setFilePath(savefilePath);
            userFile.setFileName(savefileName);
            saveUserFileList.add(userFile);

        }
        log.info("----------" + JSON.toJSONString(saveUserFileList));
        userFileService.saveBatch(saveUserFileList);

        return RestResult.success();
    }

    @Operation(summary = "查看已分享列表", description = "查看已分享列表", tags = {"share"})
    @GetMapping(value = "/shareList")
    @ResponseBody
    public RestResult<ShareListVO> shareList(ShareListDTO shareListDTO) {
        JwtUser sessionUserBean = SessionUtil.getSession();
        List<ShareListVO> shareList = shareService.selectShareList(shareListDTO, sessionUserBean.getUserId());

        int total = shareService.selectShareListTotalCount(shareListDTO, sessionUserBean.getUserId());

        return RestResult.success().dataList(shareList, total);
    }


    @Operation(summary = "分享文件列表", description = "分享列表", tags = {"share"})
    @GetMapping(value = "/sharefileList")
    @ResponseBody
    public RestResult<ShareFileListVO> shareFileList(ShareFileListDTO shareFileListBySecretDTO) {
        String shareBatchNum = shareFileListBySecretDTO.getShareBatchNum();
        String shareFilePath = shareFileListBySecretDTO.getShareFilePath();
        List<ShareFileListVO> list = shareFileService.selectShareFileList(shareBatchNum, shareFilePath);
        for (ShareFileListVO shareFileListVO : list) {
            shareFileListVO.setShareFilePath(shareFilePath);
        }
        return RestResult.success().dataList(list, list.size());
    }

    @Operation(summary = "分享类型", description = "可用此接口判断是否需要提取码", tags = {"share"})
    @GetMapping(value = "/sharetype")
    @ResponseBody
    public RestResult<ShareTypeVO> shareType(ShareTypeDTO shareTypeDTO) {
        LambdaQueryWrapper<Share> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Share::getShareBatchNum, shareTypeDTO.getShareBatchNum());
        Share share = shareService.getOne(lambdaQueryWrapper);
        ShareTypeVO shareTypeVO = new ShareTypeVO();
        shareTypeVO.setShareType(share.getShareType());
        return RestResult.success().data(shareTypeVO);
    }

    @Operation(summary = "校验提取码", description = "校验提取码", tags = {"share"})
    @GetMapping(value = "/checkextractioncode")
    @ResponseBody
    public RestResult<String> checkExtractionCode(CheckExtractionCodeDTO checkExtractionCodeDTO) {
        LambdaQueryWrapper<Share> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Share::getShareBatchNum, checkExtractionCodeDTO.getShareBatchNum())
                .eq(Share::getExtractionCode, checkExtractionCodeDTO.getExtractionCode());
        List<Share> list = shareService.list(lambdaQueryWrapper);
        if (list.isEmpty()) {
            return RestResult.fail().message("校验失败");
        } else {
            return RestResult.success();
        }
    }

    @Operation(summary = "校验过期时间", description = "校验过期时间", tags = {"share"})
    @GetMapping(value = "/checkendtime")
    @ResponseBody
    public RestResult<String> checkEndTime(CheckEndTimeDTO checkEndTimeDTO) {
        LambdaQueryWrapper<Share> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Share::getShareBatchNum, checkEndTimeDTO.getShareBatchNum());
        Share share = shareService.getOne(lambdaQueryWrapper);
        if (share == null) {
            return RestResult.fail().message("文件不存在！");
        }
        String endTime = share.getEndTime();
        Date endTimeDate = null;
        try {
            endTimeDate = DateUtil.getDateByFormatString(endTime, "yyyy-MM-dd HH:mm:ss");
        } catch (ParseException e) {
            log.error("日期解析失败：{}" , e);
        }
        if (new Date().after(endTimeDate))  {
            return RestResult.fail().message("分享已过期");
        } else {
            return RestResult.success();
        }
    }
}
