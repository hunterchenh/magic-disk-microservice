package cn.edu.ustc.file.api;

import cn.edu.ustc.file.domain.Share;
import cn.edu.ustc.file.dto.sharefile.ShareListDTO;
import cn.edu.ustc.file.vo.share.ShareListVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface IShareService  extends IService<Share> {
    List<ShareListVO> selectShareList(ShareListDTO shareListDTO, String userId);
    int selectShareListTotalCount(ShareListDTO shareListDTO, String userId);
}
