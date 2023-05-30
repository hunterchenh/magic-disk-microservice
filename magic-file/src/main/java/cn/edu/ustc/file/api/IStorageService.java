package cn.edu.ustc.file.api;

import cn.edu.ustc.file.domain.StorageBean;
import com.baomidou.mybatisplus.extension.service.IService;

public interface IStorageService extends IService<StorageBean> {
    Long getTotalStorageSize(String userId);
    boolean checkStorage(String userId, Long fileSize);
}
