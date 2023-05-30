package cn.edu.ustc.file.mapper;

import cn.edu.ustc.file.domain.UploadTaskDetail;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface UploadTaskDetailMapper extends BaseMapper<UploadTaskDetail> {
    List<Integer> selectUploadedChunkNumList(String identifier);
}
