package com.web.cafe.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.web.cafe.member.dto.MemberDTO;
import com.web.cafe.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private PasswordEncoder pwEncoder;

	// 회원 가입
	@Override
	public int register(MemberDTO member) {
		try {
			System.out.println("서비스임플의DTO넘어왔구");
			System.out.println(member);
			return mapper.register(member);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int idCheck(String userId) {
		int cnt = mapper.idCheck(userId);
		System.out.println("cnt: " + cnt);
		return cnt;
	}

	@Override
	public int phoneCheck(String userPhone) {
		int cnt = mapper.phoneCheck(userPhone);
		System.out.println("cnt: " + cnt);
		return cnt;
	}
	
	@Override
	public int userCheck(HttpServletRequest request) {
		// TODO Auto-generated method stub
		MemberDTO dto = mapper.userCheck(request.getParameter("id"));
		if (dto != null) {
			if (request.getParameter("pw").equals(dto.getUserPw())) {
				return 0;
			}
		}
		return 1;
	}

	// 마이페이지(회원 정보)
	@Override
	public MemberDTO memberInfo(String id) {
		MemberDTO dto = null;
		try {
			dto = mapper.memberInfo(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void myInfoModify(String id, Model model) {
		model.addAttribute("modifyInfo", mapper.memberInfo(id));
	}
	
	@Override
	  public void modifyUser(MemberDTO member) {
	    mapper.updateUser(member);
	  }
	
	/*
	 * @Override public int modifySave(MemberDTO dto) { String modifyPwd =
	 * pwEncoder.encode(dto.getUserPw()); dto.setUserPw(modifyPwd);
	 * 
	 * int result = 0; try { result = mapper.modifySave(dto); } catch (Exception e)
	 * { e.printStackTrace(); } return result; }
	 */


	@Override
	public String findUserId(String userName, String userEmail) {
		Map<String, Object> params = new HashMap<>();
		params.put("userName", userName);
		params.put("userEmail", userEmail);
		return mapper.findUserId(params);
	}

	@Override
	public String findUserPw(String userName, String userEmail) {
		Map<String, Object> params = new HashMap<>();
		params.put("userName", userName);
		params.put("userEmail", userEmail);
		return mapper.findUserPw(params);
	}

	@Override
    public void withdraw(String userId) {
        mapper.deleteMember(userId);
    }






}