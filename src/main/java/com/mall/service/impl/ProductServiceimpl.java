package com.mall.service.impl;

import com.mall.bean.Mall_product;
import com.mall.mapper.productMapper;
import com.mall.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName ProductServiceimpl
 * @Description TODO
 * @Author Administrator
 * @Date 2018\11\23 002322:53
 * @Version 1.0
 **/
@Service
public class ProductServiceimpl implements ProductService {

    @Autowired
    private productMapper productMapper;

    @Override
    public void saveProduct(List<String> list_image, Mall_product product) {
        //插入product信息,返回生成的主键
        product.setShp_tp(list_image.get(0));
       productMapper.insert_product(product);
    //根据product主键批量插入image数据
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("list_image",list_image);
        map.put("shp_id",product.getId());
        productMapper.insertImages(map);
    }

    @Override
    public List<Mall_product> get_spu(int pp_id, int flbh2) {
        return productMapper.get_spu(pp_id,flbh2);
    }

    @Override
    public List<Mall_product> get_product() {
        return productMapper.get_product();
    }
}
