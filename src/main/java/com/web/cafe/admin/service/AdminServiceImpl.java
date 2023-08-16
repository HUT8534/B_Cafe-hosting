package com.web.cafe.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.cafe.admin.dto.AdminDTO;
import com.web.cafe.admin.dto.PayHistoryDTO;
import com.web.cafe.cart.dto.CartDTO;
import com.web.cafe.mybatis.admin.AdminMapper;
import com.web.cafe.mybatis.member.MemberMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper mapper;

	@Autowired
	MemberMapper mMapper;

	@Autowired
	AdminFileService afs;

	// 관리자 상품등록
	@Override
	public String inputProduct(MultipartHttpServletRequest mul, HttpServletRequest request) {
		AdminDTO dto = new AdminDTO();
		dto.setMenuId(Integer.parseInt(mul.getParameter("menuId")));
		dto.setMenuName(mul.getParameter("menuName"));
		dto.setMenuPrice(Integer.parseInt(mul.getParameter("menuPrice")));
		dto.setMenuOption1(mul.getParameter("menuOption1"));
		dto.setMenuOption2(mul.getParameter("menuOption2"));
		MultipartFile file = mul.getFile("menuImage");
		if (file.getSize() != 0) {
			dto.setMenuImage(afs.saveFile(file));// 파일 보내진이름 AdminFileServiceImpl sysFileName

		} else {
			dto.setMenuImage(mul.getParameter("originalMenuImage"));
		}
		int result = 0;
		try {
			result = mapper.inputProduct(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String msg, url;
		if (result == 1) {
			msg = "상품이  등록 되었습니다";
			url = "/admin/adminPage";
		} else {
			msg = "상품 등록 실패~";
			url = "/admin/adminPage";
		}
		return afs.getMessage(request, msg, url);
	}
	// 전체메뉴보기

	@Override
	public void allMenuView(Model model) {
		// TODO Auto-generated method stub
		model.addAttribute("allMenuView", mapper.allMenuView());
	}

	@Override
	public void allMenuViewPasing(Model model, int num) {

		int pageLetter = 5; // 한페이지당 상품목록수
		int allCount = mapper.selectProductCount();// 전체상품목록 수
		int repeat = allCount / pageLetter; // 마지막 페이지번호
		if (allCount % pageLetter != 0)
			repeat += 1;
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("allMenuViewPasing", mapper.allMenuViewPasing(start, end));
	}

	// 관리자 상품편집 상세보기
	@Override
	public void editView(Model model, String menuName) {

		model.addAttribute("edit", mapper.editView(menuName));

	}

	@Override
	public String editSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		AdminDTO dto = new AdminDTO();
		dto.setMenuId(Integer.parseInt(mul.getParameter("menuId")));
		dto.setMenuName(mul.getParameter("menuName"));
		System.out.println("서비스임플에 옵션1" + mul.getParameter("menuOption1"));
		System.out.println("서비스임플에 옵션2" + mul.getParameter("menuOption2"));
		dto.setMenuOption1(mul.getParameter("menuOption1"));
		dto.setMenuOption2(mul.getParameter("menuOption2"));
		dto.setMenuPrice(Integer.parseInt(mul.getParameter("menuPrice")));
		MultipartFile file = mul.getFile("menuImage");
		if (file.getSize() != 0) {
			dto.setMenuImage(afs.saveFile(file));// 파일 보내진이름 AdminFileServiceImpl sysFileName
			afs.deleteImage(mul.getParameter("originalFileName"));
		} else {
			dto.setMenuImage(mul.getParameter("originalFileName"));
		}
		int result = 0;
		try {
			result = mapper.editSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String msg, url;
		if (result == 1) {
			msg = "상품이 수정 되었습니다";
			url = "/admin/adminProductList";
		} else {
			msg = "상품 수정 실패~";
			url = "/admin/adminProductList";
		}
		return afs.getMessage(request, msg, url);
	}

	@Override
	public String productDelete(String menuImage, HttpServletRequest request, int menuId) {

		int result = mapper.productDelete(menuId);
		String msg, url;
		if (result == 1) {
			msg = "등록한 상품이 삭제 되었습니다";
			url = "/admin/adminProductList";
			afs.deleteImage(menuImage);
		} else {
			msg = "등록한 상품 삭제 실패~";
			url = "/admin/edit?menuId=" + menuId;
		}
		return afs.getMessage(request, msg, url);
	}

	@Override
	public void cartDelete(int menuId) {
		mapper.cartDelete(menuId);

	}

	@Override
	public void insertCart(CartDTO cartDTO) {
		CartDTO dto = new CartDTO();
		dto.setMenuId(cartDTO.getMenuId());
		dto.setUserId(cartDTO.getUserId());
		dto.setTotalPrice(cartDTO.getTotalPrice());
		dto.setDetailText(cartDTO.getDetailText());
		System.out.println(dto);
		mapper.insertCart(dto);

	}

	@Override
	public List<CartDTO> getCartList(String userId) {
		List<CartDTO> cartDTO = mapper.getCartList(userId);

		return cartDTO;
	}

	// 카트 지우기
	@Override
	public String deleteCart(HttpServletRequest request, String cartId, String loginUser) {

		int result = mapper.deleteCart(cartId);
		String msg, url;
		if (result == 1) {
			msg = "등록한 상품이 장바구니에서 삭제 되었습니다";
			url = "/admin/cart?loginUser=" + loginUser;

		} else {
			msg = "등록한 상품 삭제 실패~";
			url = "/admin/cart?cartId=" + cartId;
		}
		return afs.getMessage(request, msg, url);
	}

	@Override
	public void payment(String userId) {
		mapper.payment(userId);
	}

	@Override
	public void getUserInfo(String userId, Model model) {
		model.addAttribute("info", mMapper.memberInfo(userId));
	}

	

	// ========================================================거래
	// 내역==============================================================

	@Override
	public void insertPayment(HttpServletRequest request) {
		PayHistoryDTO dto = new PayHistoryDTO();
		dto.setMenuName(request.getParameter("menuName"));
		dto.setTotalPrice(request.getParameter("totalPrice"));
		dto.setDetailText(request.getParameter("detailText"));
		dto.setUserId(request.getParameter("userId"));
		dto.setUserAddr(request.getParameter("userAddr"));
		dto.setUserPhone(request.getParameter("userPhone"));

		String msg;
		String url;

		int result = 0;
		result = mapper.insertPayment(dto);
		if (result > 0) {
			mapper.orderPayNum(request.getParameter("userId"));
			msg = "거래내역이 등록되었습니다";
			url = "admin/getPaymentList?userId=" + request.getParameter("userId");
		} else {
			msg = "거래내역 등록 실패";
			url = "admin/cart?loginUser=" + request.getParameter("userId");
		}
		afs.getMessage(request, msg, url);
	}

	@Override
	public void getPaymentList(String userId, Model model) {

		// 전체 결제 리스트
		ArrayList<PayHistoryDTO> payList = mapper.getPaymentList(userId);

		// 전체 메뉴 맵
		Map<Integer, List<PayHistoryDTO>> map = new HashMap<>();

		// 메뉴 리스트를 불러와서 결제 리스트의 payNum에 해당하는 메뉴 리스트를 Map에 저장
		for (PayHistoryDTO dto : payList) {
			int cnt = 1;
			ArrayList<PayHistoryDTO> list = mapper.getDetailMenu(dto.getPayNum(), userId);
			map.put(cnt++, list);
		}
		mapper.orderPayNum(userId);
		// model에 속성으로 추가해서 return
		model.addAttribute("payList", payList);
		model.addAttribute("menuMap", map);
	}

	@Override
	public void paymentDetails(int payNum, String userId, Model model) {
		// TODO Auto-generated method stub
		model.addAttribute("payDetail", mapper.paymentDetails(payNum, userId));
	}

	@Override
	public void deletePayment(int payNum, String userId) {
		int result = mapper.deletePayment(payNum);
		mapper.orderPayNum(userId);
		if (result > 0) {
			System.out.println("거래내역 삭제 완료");
		} else {
			System.out.println("거래내역 삭제 실패");
		}
	}

	@Override
	public String getImage(String menuName) {
		// TODO Auto-generated method stub
		return null;
	}


	

}