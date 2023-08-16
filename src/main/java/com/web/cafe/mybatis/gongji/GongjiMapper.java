package com.web.cafe.mybatis.gongji;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.web.cafe.gongji.dto.GongjiDTO;

public interface GongjiMapper {
	
	// 공지 목록 가져오기
	public ArrayList<GongjiDTO> gongjiList(@Param("s")int start, @Param("e")int end);
	
	// 공지 검색하기
	public ArrayList<GongjiDTO> gongjiSearch(@Param("s")int start, @Param("e")int end, @Param("type")String type, @Param("search")String search);
	
	// 공지 전체 목록수
	public int selectGongjiCount();
	
	// 공지 검색 목록수
	public int selectSearchCount(@Param("type")String type, @Param("search")String search);

	// 공지 등록하기
	public int gongjiWriteSave(GongjiDTO dto);
	
	// 공지 내용 가져오기
	public GongjiDTO gongjiView(int gongjiNum);

	// 공지 수정하기
	public int gongjiModify(GongjiDTO dto);
	
	// 공지 삭제하기
	public int gongjiDelete(int gongjiNum);
	
	// 글번호 정렬
	public void gongjiUpdateNum();
	
}
 	