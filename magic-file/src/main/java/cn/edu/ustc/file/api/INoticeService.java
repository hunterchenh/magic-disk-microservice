package cn.edu.ustc.file.api;

import cn.edu.ustc.file.domain.Notice;
import cn.edu.ustc.file.dto.notice.NoticeListDTO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

public interface INoticeService extends IService<Notice> {


    IPage<Notice> selectUserPage(NoticeListDTO noticeListDTO);

}
