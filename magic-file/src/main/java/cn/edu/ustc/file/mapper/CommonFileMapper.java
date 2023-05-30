package cn.edu.ustc.file.mapper;

import cn.edu.ustc.file.domain.CommonFile;
import cn.edu.ustc.file.vo.commonfile.CommonFileListVo;
import cn.edu.ustc.file.vo.commonfile.CommonFileUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommonFileMapper extends BaseMapper<CommonFile> {
    List<CommonFileUser> selectCommonFileUser(@Param("userId") String userId);
    List<CommonFileListVo> selectCommonFileByUser(@Param("userId") String userId, @Param("sessionUserId") String sessionUserId);

}
