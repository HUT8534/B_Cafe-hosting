package com.web.cafe.mybatis.member;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.web.cafe.member.dto.MemberDTO;

@Repository
public interface MemberMapper {

	public MemberDTO userCheck(String parameter);

	public MemberDTO getMember(String id);

	public int register(MemberDTO member);

	public int idCheck(String userId);
	
	public int phoneCheck(String userPhone);

	public MemberDTO memberInfo(String id);

	/* public int modifySave(MemberDTO dto); */
	
	public String find_id(String userPhone);

	public String findUserId(String userName, String userEmail);

	public String findUserPw(String userName, String userEmail);

	public String findUserId(Map<String, Object> params);

	public String findUserPw(Map<String, Object> params);

	public int countById(String userId);

	public void deleteMember(String userId);

	public void updateUser(MemberDTO member);


}
