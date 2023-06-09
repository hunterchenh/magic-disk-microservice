package cn.edu.ustc.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.youlai.system.pojo.entity.SysDictItem;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysDictItemMapper extends BaseMapper<SysDictItem> {

    List<SysDictItem> list(Page<SysDictItem> page, SysDictItem dictItem);
}
