package com.sky.controller.user;

import com.sky.result.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

@RestController("userShopController")
@RequestMapping("/user/shop")
@Api(tags = "店铺相关接口")
@Slf4j
public class ShopController {

    public static final String KEY = "SHOP_STATUS";
    private static final Integer DEFAULT_STATUS = 1;
    private static volatile Integer currentStatus = DEFAULT_STATUS;

    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 获取店铺的营业状态
     * @return
     */
    @GetMapping("/status")
    @ApiOperation("获取店铺的营业状态")
    public Result<Integer> getStatus(){
        Integer status = currentStatus;
        try {
            Object value = redisTemplate.opsForValue().get(KEY);
            if (value instanceof Integer) {
                status = (Integer) value;
            }
            if (status == null) {
                status = DEFAULT_STATUS;
            }
            currentStatus = status;
            redisTemplate.opsForValue().set(KEY, status);
        } catch (Exception e) {
            log.warn("Redis读取店铺状态失败，已使用内存状态兜底：{}", e.getMessage());
        }
        log.info("获取到店铺的营业状态为：{}",status == 1 ? "营业中" : "打烊中");
        return Result.success(status);
    }
}
