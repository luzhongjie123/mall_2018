package com.mall.util;

import java.io.InputStream;
import java.util.Properties;

/**
 * @ClassName MypropertyUtis
 * @Description TODO
 * @Author Administrator
 * @Date 2018\11\23 002323:02
 * @Version 1.0
 **/
public class MypropertyUtis {
    public static String getProperty(String pro, String windows_path) {
        Properties properties=new Properties();
        InputStream resourceAsStream= MypropertyUtis.class.getClassLoader().getResourceAsStream(pro);

        try {
            properties.load(resourceAsStream);
        }catch (Exception e){
            e.printStackTrace();
        }
        String property=properties.getProperty(windows_path);
        return property;
    }
}
