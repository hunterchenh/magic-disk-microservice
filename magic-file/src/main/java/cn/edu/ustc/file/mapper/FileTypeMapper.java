package cn.edu.ustc.file.mapper;


import cn.edu.ustc.file.constant.FileType;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FileTypeMapper extends BaseMapper<FileType> {
    List<String> selectExtendNameByFileType(@Param("fileTypeId") Integer fileTypeId);

}
