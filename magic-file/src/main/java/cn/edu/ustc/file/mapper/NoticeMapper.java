package cn.edu.ustc.file.mapper;

import cn.edu.ustc.file.domain.Notice;
import cn.edu.ustc.file.dto.notice.NoticeListDTO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

/**
 * @author: xxxg
 * @date: 2021/11/18 11:25
 */
public interface NoticeMapper extends BaseMapper<Notice> {

    IPage<Notice> selectPageVo(Page<?> page, @Param("noticeListDTO") NoticeListDTO noticeListDTO);

}
