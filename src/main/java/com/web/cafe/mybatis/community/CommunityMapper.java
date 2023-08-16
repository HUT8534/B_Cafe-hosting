package com.web.cafe.mybatis.community;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.cafe.community.dto.CommunityDTO;
import com.web.cafe.community.dto.CommunityRepDTO;


public interface CommunityMapper {

	public int selectBoardCount();
	
	// 커뮤니티 검색 목록수
	public int selectSearchCount();
			
	public List<CommunityDTO> communityAllList(@Param("s") int start, @Param("e") int end);	
	
	public List<CommunityRepDTO> communityRepList(int communityNum);
	
	// 커뮤니티 검색하기
	public ArrayList<CommunityDTO> searchList(@Param("s") int start, @Param("e") int end, @Param("type") String type, @Param("search") String search);
			
	public int writeSave(CommunityDTO dto);
	
	public CommunityDTO contentView(int communityNum);	
	
	public void updateHit(int communityNum);

	public int modify(CommunityDTO dto);	
	
	public int delete(int communityNum);
	
	public int deleteRep(int replySeq);
	
	public void addReply(CommunityRepDTO dto);
	
	public List<CommunityRepDTO> getRepList(int replyNum);

	

	

	
	
	
}


















