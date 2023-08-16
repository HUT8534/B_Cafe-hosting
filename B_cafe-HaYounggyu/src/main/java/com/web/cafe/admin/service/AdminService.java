package com.web.cafe.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.cafe.cart.dto.CartDTO;

public interface AdminService {

	public String inputProduct(MultipartHttpServletRequest mul, HttpServletRequest request);

	public void allMenuView(Model model);

	public void allMenuViewPasing(Model model, int num);

	public void editView(Model model, String menuName);

	public String editSave(MultipartHttpServletRequest mul, HttpServletRequest request);

	public String productDelete(String menuImage, HttpServletRequest request, int menuId);

	public void insertCart(CartDTO cartDTO);

	public List<CartDTO> getCartList(String userId);

	public String deleteCart(HttpServletRequest request, String cartId, String loginUser);

	public void payment(String userId2);

	public void cartDelete(int menuId);

	public void getUserInfo(String userId, Model model);

	public String getImage(String menuName);

	// ========================================================거래
	// 내역==============================================================

	public void insertPayment(HttpServletRequest request);

	public void getPaymentList(String userId, Model model);

	public void paymentDetails(int payNum, String userId, Model model);

	public void deletePayment(int payNum, String userId);

}