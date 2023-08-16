package com.web.cafe.admin.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.cafe.admin.service.AdminFileService;
import com.web.cafe.admin.service.AdminService;
import com.web.cafe.cart.dto.CartDTO;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	AdminService as;

	@RequestMapping("adminPage")
	public String adminPage() {
		return "admin/adminPage";
	}

	@PostMapping("inputProduct")
	public void inputProduct(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String message = as.inputProduct(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	// 전체메뉴 보기 페이지
	@RequestMapping("allMenuView")
	public String allMenuView(Model model) {
		as.allMenuView(model);
		return "admin/allMenuView";
	}

	@GetMapping("download")
	public void download(@RequestParam("menuImage") String menuImage, HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition", "attachment; fileName=" + URLEncoder.encode(menuImage, "utf-8")); // 한글네임처리
		File file = new File(AdminFileService.IMAGE_REPO + "\\" + menuImage);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}

	// 관리자 상품리스트관리 (수정삭제)
	@GetMapping("adminProductList")
	public String adminProductList(Model model,
			@RequestParam(value = "num", required = false, defaultValue = "1") int num) {
		as.allMenuViewPasing(model, num);
		return "admin/adminProductList";
	}

	// 제품이름으로 찾기
	@GetMapping("edit")
	public String edit(Model model, @RequestParam String menuName) {
		as.editView(model, menuName);
		return "admin/edit";
	}

	// 관리자 페이지에서 상품 수정후 저장
	@PostMapping("editSave")
	public void editSave(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		System.out.println(mul.getParameter("menuOption1"));
		System.out.println(mul.getParameter("menuOption2"));
		String message = as.editSave(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	// 관리자 페이지에서 상품 삭제
	@GetMapping("adminDelete")
	public void adminDelete(@RequestParam("menuId") int menuId, @RequestParam("menuImage") String menuImage,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("메뉴아이디:  " + menuId);
		String message = as.productDelete(menuImage, request, menuId);
		as.cartDelete(menuId);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	// 메뉴 상세보기 페이지
	@GetMapping("menuDetail")
	public String goods(Model model, @RequestParam String menuName) {
		as.editView(model, menuName);
		return "/admin/menuDetail";
	}

	// 장바구니에 담기
	@PostMapping("add")
	@ResponseBody
	public String cartAdd(@RequestBody CartDTO cartDTO, HttpServletRequest request) {
		as.insertCart(cartDTO);
		// 응답 반환
		return "{\"result\" : true}";
	}

	// 바로구매 버튼누를시에 장바구니페이지로
	@PostMapping("buy")
	@ResponseBody
	public String buy(@RequestBody CartDTO cartDTO, HttpServletRequest request, Model model) {
		as.insertCart(cartDTO);
		return "{\"result\" : true}";
	}

	// 장바구니페이지
	@GetMapping("cart")
	public String getCartList(@RequestParam("loginUser") String userId, Model model) {
		model.addAttribute("cartInfo", as.getCartList(userId));

		return "admin/cart";
	}

	// 장바구니 삭제
	@GetMapping("deleteCart")
	public void deleteCart(@RequestParam("cartId") String cartId, @RequestParam("loginUser") String loginUser,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = as.deleteCart(request, cartId, loginUser);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	@RequestMapping(value ="/paymentData", method = RequestMethod.POST)
	@ResponseBody
	public String paymentData(HttpServletRequest request, @RequestParam("menuName") String menuName,
			@RequestParam("totalPrice") String totalPrice, @RequestParam("userId") String userId,
			@RequestParam("detailText") String detailText, Model model) {
		model.addAttribute("menuName", menuName);
		return "{\"result\" : true}";
	}

	@RequestMapping("paymentPage")
	public String payment(@RequestParam("menuName") String menuName, @RequestParam("totalPrice") String totalPrice,
			@RequestParam("userId") String userId, @RequestParam("detailText") String detailText, Model model) {
		model.addAttribute("menuName", menuName);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("detailText", detailText);
		model.addAttribute("userId", userId);
		as.getUserInfo(userId, model);
		return "admin/paymentPage";
	}

	// 결제
	@RequestMapping(value ="/kakaopay", method = RequestMethod.POST)
	@ResponseBody
	public String kakaoPay(HttpServletRequest request, @RequestParam("menuName2") String menuName2,
			@RequestParam("totalPrice2") String totalPrice2, @RequestParam("userId2") String userId2) {

		System.out.println("카카오페이~"+userId2);
		System.out.println("카카오페이~"+menuName2);		
		System.out.println("카카오페이~"+totalPrice2);
		try {
			// 카카오페이 결제 준비 API 요청을 위한 파라미터 설정

			// 결제 내역 테이블에 추가
			// 가맹점 코드(10자)
			String cid = "TC0ONETIME";
			// 가맹점 주문번호(최대 100자)
			String partner_order_id = "partner_order_id";

			// 가맹점 회원 id(최대 100자)
			String partner_user_id = userId2;

			// 상품 이름 (각각의 메뉴이름을 합쳐서 결제하면 해결됨)
			String item_name = menuName2;

			// 상품 수량
			String quantity = "0";

			// 상품 총액
			String total_amount = totalPrice2;

			// 상품 부가세 금액(필수 X)
			int vat_amount = 0;

			// 상품 비과세 금액
			int tax_free_amount = 0;

			String success_url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ "/cafe/admin/success?userId2="+userId2;
			String fail_url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ "/fail";
			String cancel_url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ "/cafe/admin/allMenuView";

			// 카카오페이 결제 준비 API 요청 파라미터 설정
			StringBuilder sb = new StringBuilder();
			sb.append("cid=").append(cid).append("&partner_order_id=").append(partner_order_id)
					.append("&partner_user_id=").append(partner_user_id).append("&item_name=").append(item_name)
					.append("&quantity=").append(quantity).append("&total_amount=").append(total_amount)
					.append("&vat_amount=").append(vat_amount).append("&tax_free_amount=").append(tax_free_amount)
					.append("&approval_url=").append(success_url).append("&fail_url=").append(fail_url)
					.append("&cancel_url=").append(cancel_url);

			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK 070c771b567f337d6694caa9488ed0e0");
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true);

			OutputStream outputStream = connection.getOutputStream();
			outputStream.write(sb.toString().getBytes("UTF-8"));
			outputStream.close();

			int responseCode = connection.getResponseCode();
			InputStream inputStream;
			if (responseCode == 200) {
				inputStream = connection.getInputStream();
			} else {
				inputStream = connection.getErrorStream();
			}

			InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			StringBuilder responseBuilder = new StringBuilder();
			String line;
			while ((line = bufferedReader.readLine()) != null) {
				responseBuilder.append(line);
			}

			bufferedReader.close();
			connection.disconnect();


			return responseBuilder.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "{\"result\":\"NO\"}";
	}

	// 성공시 메세지 페이지
	@RequestMapping(value = "success", method = RequestMethod.GET)
	public String paymentSuccess(@RequestParam("userId2") String userId2, Model model) {
		as.payment(userId2);
		model.addAttribute("userId2", userId2);
		return "admin/success";
	}
	// ========================================================거래
	// 내역==============================================================


	@RequestMapping(value = "/insertPayment", method = RequestMethod.POST)
	@ResponseBody
	public String insertPayment(HttpServletRequest request) {
		System.out.println("결제내역저장 메뉴네임"+request.getParameter("menuName"));
		System.out.println("결제내역저장 총가격"+request.getParameter("totalPrice"));
		System.out.println("결제내역저장 유저아이디"+request.getParameter("userId"));
		System.out.println("결제내역저장 유저주소"+request.getParameter("userAddr"));
		System.out.println("결제내역저장 유저폰"+request.getParameter("userPhone"));
		System.out.println("결제내역저장 텍스트디테일"+request.getParameter("detailText"));
		as.insertPayment(request);		
		return "{\"result\":\"success\"}";
	}

	@GetMapping("getPaymentList")
	public String getPaymentList(@RequestParam("userId") String userId, Model model) {
		as.getPaymentList(userId, model);
		return "admin/getPaymentList";
	}

	@GetMapping("paymentDetails")
	public String paymentDetails(@RequestParam("payNum") int payNum, @RequestParam("userId") String userId,
			Model model) {
		as.paymentDetails(payNum, userId, model);
		return "admin/paymentDetails";
	}

	@GetMapping("deletePayment")
	public void deletePayment(@RequestParam("payNum") int payNum, HttpSession session) {
		String userId = (String) session.getAttribute("loginUser");
		as.deletePayment(payNum, userId);
	}
}