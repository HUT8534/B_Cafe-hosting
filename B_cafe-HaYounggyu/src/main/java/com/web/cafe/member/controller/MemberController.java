package com.web.cafe.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.cafe.member.dto.MemberDTO;
import com.web.cafe.member.service.MemberService;
import com.web.cafe.member.session.name.MemberSessionName;


@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName {

	@Autowired
	private MemberService ms;

	@Autowired
	public MemberController(MemberService memberService) {
		this.ms = memberService;
	}

	// 로그인 확인
	@PostMapping("userCheck")
	public String userCheck(HttpServletRequest request, RedirectAttributes ra) {
		int result = ms.userCheck(request);
		if (result == 0) {
			ra.addAttribute("id", request.getParameter("id"));
			return "redirect:successLogin";
		}
		return "redirect:login";
	}

	@RequestMapping("successLogin")
	public String successLogin(@RequestParam("id") String id, HttpSession session) {
		session.setAttribute(LOGIN, id);
		return "redirect:/index";
	}

	// 로그인 입력 페이지
	@GetMapping("login")
	public String login() {
		return "member/login";
	}

	// 로그아웃 페이지
	@GetMapping("logout")
	public String logout(HttpSession session) {
		if (session.getAttribute("loginUser") != null) {
			session.invalidate();
		}
		return "redirect:/index"; // index 페이지가 기본 컨트롤러에 있기 때문에 '/' 적용
	}

	// 회원가입 페이지
	@RequestMapping("register")
	public String register() {
		return "member/register";
	}

	@RequestMapping("join")
	public String join(MemberDTO member) {
		System.out.println("컨트롤러에 디티오데이터");
		System.out.println(member);
		int result = ms.register(member);
		if (result == 1) {
			return "redirect:/index";
		}
		return "redirect:registerForm";
	}

	@RequestMapping("userCheck")
	String userCheck() {
		return "index";
	}

	// 아이디 중복체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userId) {

		int cnt = ms.idCheck(userId);
		return cnt;

	}
	
	// 전화번호 중복체크
		@PostMapping("/phoneCheck")
		@ResponseBody
		public int phoneCheck(@RequestParam("userPhone") String userPhone) {

			int cnt = ms.phoneCheck(userPhone);
			return cnt;

		}

	// 마이페이지
	@GetMapping("myInfo")
	public String myInfo(HttpSession session, Model model) throws Exception {
		String id = (String) session.getAttribute(LOGIN);
		model.addAttribute("info", ms.memberInfo(id));
		return "member/myInfo";
	}

	// 유저 수정하기 버튼
	@GetMapping("myInfoModify")
	public String myInfoModify(HttpSession session, Model model) {
		model.addAttribute("info", ms.memberInfo((String) session.getAttribute(LOGIN)));
		return "member/myInfoModify";
	}
	
	@PostMapping("/modifySave")
	  public String modifyUser(@ModelAttribute MemberDTO dto) {
	    ms.modifyUser(dto);
	    return "redirect:myInfo"; // 회원 정보 수정 후 프로필 페이지로 이동
	  }
	
		/*
		 * // 수정 페이지
		 * 
		 * @PostMapping("modifySave") public String modifySave(MemberDTO dto) { int
		 * result = ms.modifySave(dto); if (result == 1) { return "redirect:myInfo"; }
		 * return "redirect:myInfoModify"; }
		 */

	// 아이디/비번 찾기 페이지
	@GetMapping("/findIdPw")
	public String showFindIdPwPage() {
		return "member/findIdPw";
	}

	// 아이디/비번 찾기 결과 페이지
	@PostMapping("/findIdPw")
	public String findIdPw(MemberDTO memberDTO, Model model) {
		String userId = ms.findUserId(memberDTO.getUserName(), memberDTO.getUserEmail());
		String userPw = ms.findUserPw(memberDTO.getUserName(), memberDTO.getUserEmail());

		model.addAttribute("userId", userId);
		model.addAttribute("userPw", userPw);

		return "member/idPwResult";
	}
	
	@GetMapping("/withdrawForm")
    public String withdrawForm() {
        return "member/withdrawForm"; // 탈퇴 폼을 보여주는 뷰 이름 (withdrawForm.jsp)
    }

    @PostMapping("/withdraw")
    public String withdraw(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        String userId = request.getParameter("userId");
        ms.withdraw(userId);
        redirectAttributes.addFlashAttribute("message", "회원 탈퇴가 완료되었습니다.");
        return "redirect:/index"; // 회원 탈퇴 후 리다이렉트할 경로
    }

}