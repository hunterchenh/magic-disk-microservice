package cn.edu.ustc.file.mapper;

import cn.edu.ustc.file.domain.ShareFile;
import cn.edu.ustc.file.vo.share.ShareFileListVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShareFileMapper extends BaseMapper<ShareFile> {
    void batchInsertShareFile(List<ShareFile> shareFiles);
    List<ShareFileListVO> selectShareFileList(@Param("shareBatchNum") String shareBatchNum, @Param("shareFilePath") String filePath);
}
