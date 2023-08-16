package com.web.cafe.admin.dto;
/*
 CREATE TABLE menu(
    menuId NUMBER(20),                      -- 제품 아이디
    menuName VARCHAR2(30) NOT NULL,         -- 제품 이름
    menuOption1 VARCHAR2(30),
    menuOption2 VARCHAR2(30),
    menuOption3 VARCHAR2(30),
    menuOption4 VARCHAR2(30),               -- 제품 옵션
    menuPrice NUMBER(30),                   -- 제품 가격
    menuImage VARCHAR2(3000) NOT NULL,      -- 제품 이미지    
    CONSTRAINT menu_PK PRIMARY KEY(menuId)
);
 */
public class AdminDTO {
	
	private int menuId;
	private String menuName;
	private String menuOption1;
	private String menuOption2;
	private String menuOption3;
	private String menuOption4;
	private int menuPrice;
	private String menuImage;
	private int pasingNum;
	
	
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuOption1() {
		return menuOption1;
	}
	public void setMenuOption1(String menuOption1) {
		this.menuOption1 = menuOption1;
	}
	public String getMenuOption2() {
		return menuOption2;
	}
	public void setMenuOption2(String menuOption2) {
		this.menuOption2 = menuOption2;
	}
	public String getMenuOption3() {
		return menuOption3;
	}
	public void setMenuOption3(String menuOption3) {
		this.menuOption3 = menuOption3;
	}
	public String getMenuOption4() {
		return menuOption4;
	}
	public void setMenuOption4(String menuOption4) {
		this.menuOption4 = menuOption4;
	}
	public int getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getMenuImage() {
		return menuImage;
	}
	public void setMenuImage(String menuImage) {
		this.menuImage = menuImage;
	}
	
	public int getPasingNum() {
		return pasingNum;
	}
	public void setPasingNum(int pasingNum) {
		this.pasingNum = pasingNum;
	}
	@Override
	public String toString() {
		return "AdminDTO [menuId=" + menuId + ", menuName=" + menuName + ", menuOption1=" + menuOption1
				+ ", menuOption2=" + menuOption2 + ", menuOption3=" + menuOption3 + ", menuOption4=" + menuOption4
				+ ", menuPrice=" + menuPrice + ", menuImage=" + menuImage + "]";
	}
	
	
	
	
	
	
}
