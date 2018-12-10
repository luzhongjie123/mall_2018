package com.mall.controller;

import com.mall.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.mall.bean.T_MALL_PRODUCT;
import com.mall.bean.T_MALL_SKU;
import com.mall.bean.T_MALL_SKU_ATTR_VALUE;
import com.mall.service.SkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class SkuController {
    @Autowired
    private SkuService skuService;

    @RequestMapping("/goto_sku")
    public String goto_sku(){

        return "sku";
    }
    @RequestMapping("save_sku")
    public ModelAndView save_sku(MODEL_T_MALL_SKU_ATTR_VALUE list_attr, T_MALL_PRODUCT spu, T_MALL_SKU sku){
        ModelAndView mv=new ModelAndView("redirect:/goto_sku.do");
        skuService.save_sku(list_attr.getList_attr(),spu,sku);
        return mv;
    }
}
