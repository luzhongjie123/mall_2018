package com.mall.mapper;

import com.mall.bean.Mall_product;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface productMapper {
    void insert_product(Mall_product product);

    void insertImages(Map<String, Object> map);

    List<Mall_product> get_spu(@Param("pp_id") int pp_id,@Param("flbh2") int flbh2);

    List<Mall_product> get_product();
}
