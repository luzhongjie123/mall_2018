package com.mall.service.impl;

import com.mall.bean.T_MALL_PRODUCT;
import com.mall.bean.T_MALL_SKU;
import com.mall.bean.T_MALL_SKU_ATTR_VALUE;
import com.mall.mapper.skuMapper;
import com.mall.service.SkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SkuServiceimpl implements SkuService {
@Autowired
private skuMapper skuMapper;

    @Override
    public void save_sku(List<T_MALL_SKU_ATTR_VALUE> list_attr, T_MALL_PRODUCT spu, T_MALL_SKU sku) {
    //新增sku表

        skuMapper.insert_sku(sku);

        //新增sku_attr_value表
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("list_attr",list_attr);
        map.put("shp_id",spu.getId());
        map.put("sku_id",sku.getId());
        skuMapper.insert_attr_value(map);
    }
}
