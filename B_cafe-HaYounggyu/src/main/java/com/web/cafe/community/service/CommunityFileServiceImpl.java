



package com.web.cafe.community.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;



@Service
public class CommunityFileServiceImpl implements CommunityFileService {
	

	@Override
	public String getMessage(HttpServletRequest request, String msg, String url) {

		String message = null;
		String path = request.getContextPath();
		message = "<script>alert('" + msg + "');";
		message += "location.href='" + path + url + "';</script>";
		return message;

	}


	
	
}
























