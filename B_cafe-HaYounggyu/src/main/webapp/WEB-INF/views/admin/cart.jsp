
<!-- admin/cart.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>admin/cart.jsp</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>


<link href="${contextPath}/resources/css/brand/common.css"
	rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css"
	rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<style type="text/css">
section {
	text-align: center;
}

table {
	display: inline-block;
	width: 1000px;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	border-bottom: none;
	border-right: none;
	border-left: none;
}

th, td {
	width: 250px;
}

.menu_name {
	display: block;
	text-align: center;
}

.delete_button {
	background-color: #000000;
	color: white;
}

.bottom_section {
	text-align: right;
}

#apibtn {
	margin-top: 10px;
	background-color: #ffeb00;
	border-radius: 5px;
}

.totalPrice_span {
	color: red;
}
#buy {
	background-color: black;
	color: white;

}
</style>
</head>
<body>


	<c:import url="../default/header.jsp" />
	<c:import url="../default/quickBar.jsp" />
	<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual"
			style="background-image: url('${contextPath}/resources/imageFile/banner5.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown"
					style="visibility: visible; animation-name: fadeInDown;">장바구니</h1>
				<p class="sub-visual__txt wow fadeInUp"
					style="visibility: visible; animation-name: fadeInUp;">THE
					BLACK의 장바구니 창입니다</p>
			</div>
		</div>

		<!-- 중간 부분 -->
		<div class="sub-nav sub-nav--bar">
			<ul class="sub-nav__wrap sub-nav-clone--depth2">
				<!-- active 된 메뉴의 depth2 clone 하기 -->
				<li class="item"><a href="${contextPath }/admin/allMenuView"
					class="link on">메 뉴</a> <a
					href="${contextPath }/admin/cart?loginUser=${loginUser}"
					class="link on">장바구니</a></li>
			</ul>
		</div>
		<br><br>
		<!-- 카트메인내용-->
		<div class="sub-con">
			<section>
				<table>
					<tr>
						<th>카트번호</th>
						<th>상품명</th>
						<th>옵션</th>
						<th>가격</th>
						<th>결제/삭제</th>
					</tr>
					<c:forEach var="menu" items="${cartInfo}" varStatus="status">
						<div class="cartInfo">
							<input type="hidden" class="individual_totalPrice_input"
								value="${menu.totalPrice}"> <input type="hidden"
								class="individual_detailText_input" value="${menu.detailText}">
							<input type="hidden" class="individual_menuName_input"
								value="${menu.menuName}">
						</div>
						<tr>
							<td>${menu.cartId}</td>
							<td><img
								src="${contextPath}/admin/download?menuImage=${menu.menuImage}"
								style="width: 100px; height: 100px;"><span
								class="menu_name">${menu.menuName}</span></td>
							<td>${menu.detailText}</td>
							<td>${menu.totalPrice}</td>
							<td><input type="button" value="삭제" class="delete_button"
								onclick="location.href='${contextPath}/admin/deleteCart?cartId=${menu.cartId}&loginUser=${loginUser}'">&nbsp;
							</td>
						</tr>

					</c:forEach>
					<c:if test="${empty cartInfo}">
						<tr>						
							<td colspan="5" align="center" style="height: 100px;">장바구니에 담긴 상품이 없습니다.</td>
						</tr>
						<script>
                      alert("장바구니에 담긴 상품이 없습니다.");
                      window.location.href = "${contextPath}/admin/allMenuView";
                  </script>
					</c:if>
					<tr>						
						<td colspan="5" class="bottom_section"><b>총 금액</b>&nbsp;<span class="totalPrice_span"></span>&nbsp;<b>원</b>&nbsp;&nbsp;&nbsp;
						<button id="buy">구매하기</button>&nbsp;
						</td>
					</tr>
				</table>
			</section>
		</div>
	</div>
	<c:import url="../default/footer.jsp" />
<script>
//버튼 기능\
$(document).ready(function() {
 

  let totalPrice = 0; // 총 가격
  let detailText = ""; // 총 수량+옵션들
  let userId = "${loginUser}";
  let menuName = "";
  let menuId ="${menu.menuId}";



  $(".cartInfo").each(function(index, element) {
    // 총 가격
    totalPrice += parseInt(
      $(element).find(".individual_totalPrice_input").val()
    );
    // 총 옵션
    detailText += $(element).find(".individual_detailText_input").val();
    // 총 메뉴이름
    menuName += $(element).find(".individual_menuName_input").val() + "/";
  });

  $(".totalPrice_span").text(totalPrice);
  $(".totalMenuName_span").text(menuName);	
  $(function() {
	    $("#buy").click(function() {
	      $.ajax({
	        url: "paymentData", 
	        type: "POST",
	        dataType: "json",
	        data: {
	          menuName: menuName,
	          totalPrice: totalPrice, 
	          userId: userId,
	          detailText:detailText,
	          menuId:menuId

	        },
	        success: function(result) {
	        
	            window.location.href ="${contextPath}/admin/paymentPage?menuName="+menuName+"&totalPrice="+totalPrice+"&userId="+userId+"&detailText="+detailText;
	         
	        
	        },
	        error: function(error) {
	          // 카카오페이 결제 실패 시 처리할 로직
	        },
	      });
	    });
      });
});

</script>
</body>
</html>