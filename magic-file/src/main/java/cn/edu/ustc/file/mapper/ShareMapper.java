package cn.edu.ustc.file.mapper;

import cn.edu.ustc.file.domain.Share;
import cn.edu.ustc.file.vo.share.ShareListVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface ShareMapper  extends BaseMapper<Share> {

    List<ShareListVO> selectShareList(String shareFilePath, String shareBatchNum, Long beginCount, Long pageCount, String userId);
    int selectShareListTotalCount(String shareFilePath,String shareBatchNum, String userId);
}
