package cn.edu.ustc.file.api;

import cn.edu.ustc.file.domain.ShareFile;
import cn.edu.ustc.file.vo.share.ShareFileListVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface IShareFileService extends IService<ShareFile> {
    void batchInsertShareFile(List<ShareFile> shareFiles);
    List<ShareFileListVO> selectShareFileList(String shareBatchNum, String filePath);
}
