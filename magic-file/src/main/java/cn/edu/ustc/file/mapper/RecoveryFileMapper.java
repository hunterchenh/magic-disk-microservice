package cn.edu.ustc.file.mapper;

import cn.edu.ustc.file.domain.RecoveryFile;
import cn.edu.ustc.file.vo.file.RecoveryFileListVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface RecoveryFileMapper extends BaseMapper<RecoveryFile> {
    List<RecoveryFileListVo> selectRecoveryFileList(@Param("userId") String userId);
}
