package cn.edu.ustc.common.web.constraint;

import lombok.Data;

@Data
public class CityEntity {
    private String value;
    private String name;
    private String parent;
}
