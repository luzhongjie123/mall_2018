package com.mall.service;

import com.mall.bean.Mall_product;
import com.mall.bean.OBJECT_T_MALL_ATTR;

import java.util.List;

public interface AttrService {
    //新增商品属性
    public void saveAttr(int flbh2, List<OBJECT_T_MALL_ATTR> list_value);

    List<OBJECT_T_MALL_ATTR> get_attr_list(int flbh2);


}
