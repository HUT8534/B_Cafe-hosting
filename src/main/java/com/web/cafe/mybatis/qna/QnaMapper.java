package com.web.cafe.mybatis.qna;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.cafe.qna.dto.QnaDTO;
import com.web.cafe.qna.dto.QnaRepDTO;

public interface QnaMapper {
	
	public int selectBoardCount();
	public List<QnaDTO> qnaList(@Param("s") int start, @Param("e")int end);
	public ArrayList<QnaDTO> qnaSearch(@Param("s")int start, @Param("e")int end, @Param("type")String type, @Param("search")String search);
	// QnA 검색 목록수
	public int selectSearchCount();
	public int writeSave(QnaDTO dto);
	public QnaDTO qnacontentView(int qnaNum);
	public int modify(QnaDTO dto);
	public int delete(int qnaNum);
	public void addReply(QnaRepDTO dto);
	public List<QnaRepDTO> getRepList(int replyNum);
	public int deleteRep(int replySeq);

}
