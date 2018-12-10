package com.mall.service;

import com.mall.bean.T_MALL_PRODUCT;
import com.mall.bean.T_MALL_SKU;
import com.mall.bean.T_MALL_SKU_ATTR_VALUE;

import java.util.List;

public interface SkuService {

    //新增sku数据
    void save_sku(List<T_MALL_SKU_ATTR_VALUE> list_attr, T_MALL_PRODUCT spu, T_MALL_SKU sku);


}
