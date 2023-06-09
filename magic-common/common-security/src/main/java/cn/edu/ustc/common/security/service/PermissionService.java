package cn.edu.ustc.common.security.service;

import cn.edu.ustc.common.security.util.SecurityUtils;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.PatternMatchUtils;

import java.util.Set;

/**
 * Spring Security 自定义权限校验
 *
 */
@Service("pms")
@RequiredArgsConstructor
public class PermissionService {

    private final RedisTemplate redisTemplate;

    public boolean hasPermission(String perm) {

        if (StrUtil.isBlank(perm)) {
            return false;
        }

        if (SecurityUtils.isRoot()) {
            return true;
        }

        Long userId = SecurityUtils.getUserId();

        Set<String> perms = (Set<String>) redisTemplate.opsForValue().get("AUTH:USER_PERMS:" + userId);

        if (CollectionUtil.isEmpty(perms)) {
            return false;
        }
        return perms.stream().anyMatch(item -> PatternMatchUtils.simpleMatch(perm, item));
    }
}
