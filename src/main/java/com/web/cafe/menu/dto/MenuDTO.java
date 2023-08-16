
/*
CREATE TABLE menu_recommend(
    sugar NUMBER(38) NOT NULL,      --- 블랙&우유&설탕&시럽
    caffeine NUMBER(38) NOT NULL,   --- 카페인&디카페인
    style NUMBER(38) NOT NULL,      --- 깔끔&농후&균형&무거움 느낌
    cake NUMBER(38) NOT NULL,       --- 초코&생크림&제과&과일     
    price NUMBER(38) NOT NULL     --- 선호 가격
);
*/
package com.web.cafe.menu.dto;

public class MenuDTO {
	private int sugar;
	private int caffeine;
	private int style;
	private int price;
	
	public MenuDTO() {
		super();
	}

	public int getSugar() {
		return sugar;
	}

	public void setSugar(int sugar) {
		this.sugar = sugar;
	}

	public int getCaffeine() {
		return caffeine;
	}

	public void setCaffeine(int caffeine) {
		this.caffeine = caffeine;
	}

	public int getStyle() {
		return style;
	}

	public void setStyle(int style) {
		this.style = style;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
