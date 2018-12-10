package com.mall.mapper;

import com.mall.bean.T_MALL_SKU;

import java.util.Map;

public interface skuMapper {
    public void insert_sku(T_MALL_SKU sku);


    public void insert_attr_value(Map<String, Object> map);

}
