

package com.web.cafe.community.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.cafe.community.dto.CommunityRepDTO;


public interface CommunityService {

	public void communityAllList(Model model, int num);
	
	public void communityRepList(Model model, int communityNum);
	
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);	
	
	public void contentView(int communityNum,Model model);

	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request);

	public String communityDelete(int communityNum, HttpServletRequest request);
	
	public void addReply(CommunityRepDTO dto);

	public List<CommunityRepDTO> getRepList(int replyNum);

	public void searchList(Model model, String type, String search, int num);
	



	
	
	
	

}
















