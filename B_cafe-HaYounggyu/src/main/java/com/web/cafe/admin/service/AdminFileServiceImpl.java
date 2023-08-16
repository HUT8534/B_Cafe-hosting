package com.web.cafe.admin.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class AdminFileServiceImpl implements AdminFileService {

   @Override
   public String getMessage(HttpServletRequest request, String msg, String url) {
      String message =null;
      String path =request.getContextPath();
      message ="<script>alert('" +msg+"');"+"location.href='"+path+url+ "';</script>";
      return message;
   }

   @Override
   public String saveFile(MultipartFile file) {
      
      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
      Calendar calendar = Calendar.getInstance();
      String sysFileName =sdf.format(calendar.getTime());
      sysFileName +=file.getOriginalFilename();
      File saveFile = new File(IMAGE_REPO+"/"+sysFileName);
      
      try {
         file.transferTo(saveFile);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return sysFileName;
   }

   @Override
   public void deleteImage(String originalFileName) {
      File file = new File(IMAGE_REPO+"/"+originalFileName);
      file.delete();
   }



   
   
   

   
}
