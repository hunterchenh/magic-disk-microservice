package cn.edu.ustc.file.api;

import cn.edu.ustc.file.domain.FileBean;
import cn.edu.ustc.file.vo.file.FileDetailVO;
import com.baomidou.mybatisplus.extension.service.IService;

public interface IFileService  extends IService<FileBean> {

    Long getFilePointCount(String fileId);
    void unzipFile(String userFileId, int unzipMode, String filePath);

    void updateFileDetail(String userFileId, String identifier, long fileSize);

    FileDetailVO getFileDetail(String userFileId);

}
