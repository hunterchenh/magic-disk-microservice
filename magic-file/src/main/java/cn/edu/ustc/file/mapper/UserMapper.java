package cn.edu.ustc.file.mapper;

import cn.edu.ustc.file.domain.user.Role;
import cn.edu.ustc.file.domain.user.UserBean;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper extends BaseMapper<UserBean> {
    int insertUser(UserBean userBean);

    int insertUserRole(@Param("userId") String userId, @Param("roleId") long roleId);

    List<Role>  selectRoleListByUserId(@Param("userId") String userId);

    String selectSaltByTelephone(@Param("telephone") String telephone);

    UserBean selectUserByTelephoneAndPassword(@Param("telephone") String telephone, @Param("password") String password);

}
