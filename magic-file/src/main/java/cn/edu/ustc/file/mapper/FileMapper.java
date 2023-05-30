package cn.edu.ustc.file.mapper;


import cn.edu.ustc.file.domain.FileBean;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface FileMapper extends BaseMapper<FileBean> {


    void batchInsertFile(List<FileBean> fileBeanList);



}
