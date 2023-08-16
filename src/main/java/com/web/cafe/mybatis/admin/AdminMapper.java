package com.web.cafe.mybatis.admin;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.cafe.admin.dto.AdminDTO;
import com.web.cafe.admin.dto.PayHistoryDTO;
import com.web.cafe.cart.dto.CartDTO;

public interface AdminMapper {

	public int inputProduct(AdminDTO dto);

	public List<AdminDTO> allMenuView();

	public AdminDTO editView(String menuName);

	public int editSave(AdminDTO dto);

	public int productDelete(int menuId);

	public void insertCart(CartDTO cartDTO);

	public List<CartDTO> getCartList(String userId);

	public int deleteCart(String cartId);

	public void cartDelete(int menuId);

	public int selectProductCount();

	public List<AdminDTO> allMenuViewPasing(@Param("s") int start, @Param("e") int end);

	public void payment(String userId);

	// ========================================================거래
	// 내역==============================================================



	public ArrayList<PayHistoryDTO> getPayResult(@Param("userId") String userId);

	public int insertPayment(PayHistoryDTO dto);

	public ArrayList<PayHistoryDTO> getPaymentList(@Param("userId") String userId);


	public PayHistoryDTO paymentDetails(@Param("payNum") int payNum, @Param("userId") String userId);

	public int deletePayment(@Param("payNum") int payNum);

	public void orderPayNum(@Param("userId") String userId);

	public ArrayList<PayHistoryDTO> getDetailMenu(@Param("payNum")int payNum, @Param("userId")String userId);
}