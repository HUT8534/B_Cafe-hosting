package com.web.cafe.gongji.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class GongjiFileServiceImpl implements GongjiFileService{

	@Override
	public String getMessage(HttpServletRequest request, String msg, String url) {
		String message = null;
		String path = request.getContextPath();
		message = "<script>alert('"+msg+"');";
		message += "location.href='"+ path + url + "';</script>";
		return message;
	}

	@Override
	public String saveFile(MultipartFile file) {
		// TODO Auto-generated method stub
		if(file.getSize() != 0) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HH-mm-ss");
			Calendar calendar = Calendar.getInstance();
			String sysFileName = sdf.format(calendar.getTime());
			sysFileName += file.getOriginalFilename();
			
			File saveFile = new File(IMAGE_REPO+"/"+sysFileName);
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return sysFileName;
		}
		return "nan";
	}

	@Override
	public void deleteImage(String originalFileName) {
		// TODO Auto-generated method stub
		File file = new File(IMAGE_REPO+"/"+originalFileName);
		file.delete();
	}
	
}
