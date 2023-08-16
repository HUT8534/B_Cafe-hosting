package com.web.cafe.admin.dto;

public class PayHistoryDTO {
	
	private int payNum;
	// AdminDTO
	private String menuName;
	private String menuId;
	private String menuImage;
	// CartDTO
    private String totalPrice;
    private String detailText;
    private String regdate;
    // MemberDTO
    private String userId;
    private String userAddr;
    private String userPhone;
    
	public int getPayNum() {
		return payNum;
	}
	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getMenuImage() {
		return menuImage;
	}
	public void setMenuImage(String menuImage) {
		this.menuImage = menuImage;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getDetailText() {
		return detailText;
	}
	public void setDetailText(String detailText) {
		this.detailText = detailText;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	@Override
	public String toString() {
		return "PayHistoryDTO [payNum=" + payNum + ", menuName=" + menuName + ", menuId=" + menuId + ", menuImage="
				+ menuImage + ", totalPrice=" + totalPrice + ", detailText=" + detailText + ", regdate=" + regdate
				+ ", userId=" + userId + ", userAddr=" + userAddr + ", userPhone=" + userPhone + "]";
	}
    
}
