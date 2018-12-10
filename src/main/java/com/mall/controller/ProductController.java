package com.mall.controller;

import com.mall.bean.Mall_product;
import com.mall.bean.Model_T_MALL_ATTR;
import com.mall.bean.OBJECT_T_MALL_ATTR;
import com.mall.service.AttrService;
import com.mall.service.ProductService;
import com.mall.util.MyFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @ClassName SupController
 * @Description TODO
 * @Author Administrator
 * @Date 2018\11\23 002321:38
 * @Version 1.0
 **/
@Controller
public class ProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private AttrService attrService;


    @RequestMapping("/goto_product")
    public String goto_product(Map map){
       List<Mall_product> products= productService.get_product();
       map.put("products",products);
        return "product";
    }

    @RequestMapping("/goto_attr")
    public String goto_attr(){
        return "product_attr";
    }



    @RequestMapping("/product_add")
    public ModelAndView product_add(@RequestParam("files") MultipartFile[] files, Mall_product spu){
        //文件上传
        List<String> list_image= MyFileUpload.upload_image(files);
//        list_image.remove(list_image.size()-1);
        //保存商品信息
        productService.saveProduct(list_image,spu);
        ModelAndView mv=new ModelAndView("redirect:/goto_product.do");
        return mv;
    }


    @RequestMapping("/attr_add")
    public String attr_add(int attr_flbh2, Model_T_MALL_ATTR list_attr){
        attrService.saveAttr(attr_flbh2,list_attr.getList_attr());
        return "redirect:/goto_attr.do";
    }

    @RequestMapping("/get_attr_list")
    public String get_attr_list(int flbh2, Map map){
        List<OBJECT_T_MALL_ATTR> list_attr=new ArrayList<OBJECT_T_MALL_ATTR>();
        list_attr=attrService.get_attr_list(flbh2);
        map.put("list_attr",list_attr);
        map.put("flbh2",flbh2);
        return "attrListHtml";
    }

    @RequestMapping("/get_attr_list_ajax")
    @ResponseBody
    public List<OBJECT_T_MALL_ATTR> get_attr_list_ajax(int flbh2, Map map){
        List<OBJECT_T_MALL_ATTR> list_attr=new ArrayList<OBJECT_T_MALL_ATTR>();
        list_attr=attrService.get_attr_list(flbh2);
        map.put("list_attr",list_attr);
        map.put("flbh2",flbh2);
        return list_attr;
    }


    @RequestMapping("/get_spu")
    @ResponseBody
    public List<Mall_product> get_spu(int pp_id,int flbh2){
        System.out.println("1");
        List<Mall_product> spu_list=productService.get_spu(pp_id,flbh2);
        return spu_list;
    }

}
