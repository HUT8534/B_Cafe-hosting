package com.web.cafe.admin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface AdminFileService {

   public static final String IMAGE_REPO="C:\\B_Spring\\img_repo";

   public String getMessage(HttpServletRequest request, String msg, String url);
   
   public String saveFile(MultipartFile file);

   public void deleteImage(String originalFileName);

}
