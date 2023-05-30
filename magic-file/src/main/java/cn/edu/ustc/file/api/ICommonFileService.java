package cn.edu.ustc.file.api;

import cn.edu.ustc.file.domain.CommonFile;
import cn.edu.ustc.file.vo.commonfile.CommonFileListVo;
import cn.edu.ustc.file.vo.commonfile.CommonFileUser;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface ICommonFileService extends IService<CommonFile> {
    List<CommonFileUser> selectCommonFileUser(String userId);
    List<CommonFileListVo> selectCommonFileByUser(String userId, String sessionUserId);
}