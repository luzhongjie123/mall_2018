package com.mall.service.impl;

import com.mall.bean.Mall_product;
import com.mall.bean.OBJECT_T_MALL_ATTR;
import com.mall.mapper.attrMapper;
import com.mall.service.AttrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttrServiceimpl implements AttrService {
    @Autowired
    private attrMapper attrMapper;
    @Override
    public void saveAttr(int flbh2, List<OBJECT_T_MALL_ATTR> attrs) {
        for(int i=0;i<attrs.size();i++){
            //新增商品
            OBJECT_T_MALL_ATTR attr=attrs.get(0);
            attrMapper.insert_attr(flbh2,attr);

            //新增商品属性
            attrMapper.insert_value(attr.getId(),attr.getList_value());
        }



    }

    @Override
    public List<OBJECT_T_MALL_ATTR> get_attr_list(int flbh2) {
        return attrMapper.get_attr_list(flbh2);
    }


}
