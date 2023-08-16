package com.web.cafe.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.web.cafe.member.dto.MemberDTO;

public interface MemberService {

	public int userCheck(HttpServletRequest request);

	public int register(MemberDTO member);

	public int idCheck(String userId);

	public MemberDTO memberInfo(String id);

	public void myInfoModify(String id, Model model);

	public void modifyUser(MemberDTO dto);
	
	public String findUserId(String userName, String userEmail);

	public String findUserPw(String userName, String userEmail);

	public void withdraw(String userId);

	public int phoneCheck(String userPhone);


}