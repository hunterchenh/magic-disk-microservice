package cn.edu.ustc.file.api;

import cn.edu.ustc.file.domain.RecoveryFile;
import cn.edu.ustc.file.vo.file.RecoveryFileListVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface IRecoveryFileService extends IService<RecoveryFile> {
    void deleteUserFileByDeleteBatchNum(String deleteBatchNum);
    void restorefile(String deleteBatchNum, String filePath, String sessionUserId);
    List<RecoveryFileListVo> selectRecoveryFileList(String userId);
}
