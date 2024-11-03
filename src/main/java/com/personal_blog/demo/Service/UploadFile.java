package com.personal_blog.demo.Service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadFile {
    @Autowired
    public ServletContext servletContext;

    public String handleSaveFile(MultipartFile file) {
        String nameFile = "";

        try {
            byte[] bytes = file.getBytes();

            // get rootPath
            String rootPath = this.servletContext.getRealPath("/resources/images");

            // create name file
            nameFile = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File myImage = new File(rootPath + File.separator + nameFile);

            // create stream write data into myImage
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(myImage));
            stream.write(bytes);
            stream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return nameFile;
    }
}
