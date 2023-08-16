package com.web.cafe.cart.dto;

public class CartDTO {
    private String totalPrice;
    private String detailText;
    private String userId;
    private String menuId;
    private String cartId;
    private String regdate;

    
    //menuDTO
	private String menuName;
	private String menuImage;
	private String menuOption1;
    
    // 생성자, getter, setter 정의

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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}


	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
  
	
	//adminDTO getter setter
	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuImage() {
		return menuImage;
	}

	public void setMenuImage(String menuImage) {
		this.menuImage = menuImage;
	}

	public String getMenuOption1() {
		return menuOption1;
	}

	public void setMenuOption1(String menuOption1) {
		this.menuOption1 = menuOption1;
	}

	@Override
	public String toString() {
		return "CartDTO [totalPrice=" + totalPrice + ", detailText=" + detailText + ", userId=" + userId + ", menuId="
				+ menuId + ", cartId=" + cartId + ", regdate=" + regdate + "]";
	}

	
	
	
	
}
	
	
	
	
	

