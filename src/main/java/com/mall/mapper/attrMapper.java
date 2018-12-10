package com.mall.mapper;

import com.mall.bean.Mall_product;
import com.mall.bean.OBJECT_T_MALL_ATTR;
import com.mall.bean.T_MALL_VALUE;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface attrMapper {
    void insert_attr(@Param("flbh2") int flbh2,@Param("attr") OBJECT_T_MALL_ATTR attr);

    void insert_value(@Param("attr_id") int attr_id,@Param("t_mall_value") List<T_MALL_VALUE> t_mall_value);

    List<OBJECT_T_MALL_ATTR>  get_attr_list(int flbh2);


}
