package com.mall.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName MyFileUpload
 * @Description TODO
 * @Author Administrator
 * @Date 2018\11\23 002322:50
 * @Version 1.0
 **/
public class MyFileUpload {
    public static List<String> upload_image(MultipartFile[] files) {

        String path = MypropertyUtis.getProperty("myUpload.properties", "windows_path");
        List<String> list_image=new ArrayList<String>();
        for (int i = 0; i < files.length; i++) {
            if (!files[i].isEmpty()) {

            String originalFilename = files[i].getOriginalFilename();
            String name = System.currentTimeMillis() + originalFilename;
            String upload_name = path + "/" + name;

            try {
                files[i].transferTo(new File(upload_name));
                list_image.add(name);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
        return list_image;
    }
}
