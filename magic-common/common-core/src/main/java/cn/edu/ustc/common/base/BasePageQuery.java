package cn.edu.ustc.common.base;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @desc 基础分页请求对象
 */
@Data
@ApiModel
public class BasePageQuery {

    @ApiModelProperty(value = "页码", example = "1")
    private int pageNum = 1;

    @ApiModelProperty(value = "每页记录数", example = "10")
    private int pageSize = 10;
}
