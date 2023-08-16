package com.web.cafe.qna.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.web.cafe.member.session.name.MemberSessionName;
import com.web.cafe.mybatis.qna.QnaMapper;
import com.web.cafe.qna.dto.QnaRepDTO;
import com.web.cafe.qna.service.QnaService;

@RestController
@RequestMapping("/qna")
public class QnaRepController implements MemberSessionName {
	
	@Autowired
	QnaService qs;
	
	@Autowired
	QnaMapper mapper;
	
	@PostMapping(value="addReply", produces="application/json; charset=utf-8")
	public String addReply(@RequestBody Map<String, Object> map, HttpSession session) {
		QnaRepDTO dto = new QnaRepDTO();
		dto.setUserId((String)session.getAttribute(LOGIN));
		dto.setReplyNum(Integer.parseInt((String)map.get("qnaNum")));
		dto.setQnaReContent((String)map.get("qnaReContent"));
		qs.addReply(dto);
		
		return "{\"result\" : true}";
	}
	
		
	@GetMapping(value="replyData/{replyNum}", produces="application/json; charset=utf-8")
	public List<QnaRepDTO> replyData(@PathVariable int replyNum) {
		return qs.getRepList(replyNum);
	}
	
	@RequestMapping(value = "/deleteReply/{replySeq}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> deleteReply(@PathVariable("replySeq") int replySeq) {
		Map<String, Object> result = new HashMap<>();
		int deleteResult = mapper.deleteRep(replySeq);
		if (deleteResult == 1) {
			result.put("result", 1);
			result.put("msg", "댓글이 삭제되었습니다.");
		} else {
			result.put("result", 0);
			result.put("msg", "댓글 삭제 실패");
		}
		return result;
	}
	
	
}
