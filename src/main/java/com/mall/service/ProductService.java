package com.mall.service;

import com.mall.bean.Mall_product;

import java.util.List; /**
 * @ClassName ProductService
 * @Description TODO
 * @Author Administrator
 * @Date 2018\11\23 002322:52
 * @Version 1.0
 **/
public interface ProductService {
    //新增商品
    public void saveProduct(List<String> list_image, Mall_product spu);

    List<Mall_product> get_spu(int pp_id, int flbh2);

    List<Mall_product> get_product();
}
