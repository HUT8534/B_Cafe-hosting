package com.web.cafe.qna.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.web.cafe.member.session.name.MemberSessionName;

public class QnAInterceptor extends HandlerInterceptorAdapter implements MemberSessionName {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN) == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인 후 글쓰기가 가능합니다');"
					+ "location.href='"
					+ request.getContextPath()
					+ "/member/login'</script>");
			return false;
		}
		return true;
		
		
	}
}
