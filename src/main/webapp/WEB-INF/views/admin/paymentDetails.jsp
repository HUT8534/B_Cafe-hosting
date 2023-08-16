<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
<title>거래 상세정보</title>
<style type="text/css">
.pay-detail-section {
	text-align: center;
	width: 60%;
}
.pay-user-info td, .pay-items-info td{
  text-align: center;
  width: 500px;
}

.pay-user-info th, .pay-items-info th {
  width: 100px;
  text-align: center;
} 
.pay-title {
	padding-bottom: 50px;
	font-size: 24px;
}

.pay-items-info tr,  tr{
  background-color: #f2f2f2;
}

/* th 전체 */
.pay-items-info th, .pay-user-info th{
  background-color: #A68B6D;
  color: white;
}

.pay-items-info th:first-child, .pay-items-info td:first-child{
	border-right: 1px solid #ccc;
}

table {
  display: inline-block;
  border-top: 1px solid #f2f2f2;
  width: 100%;
  border-collapse: collapse;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

a {
  color: #0066cc;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<c:import url="../default/quickBar.jsp"/>
	
		<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/banner4.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">마이페이지</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">회원님의 정보를 확인할 수 있습니다</p>
			</div>
		</div>
		
		<div class="sub-nav sub-nav--bar">
			<ul class="sub-nav__wrap sub-nav-clone--depth2">
				<!-- active 된 메뉴의 depth2 clone 하기 -->
				<li class="item">
					<a href="${contextPath }/member/myInfo" class="link on">마이페이지</a>
					<a href="${contextPath }/member/myInfoModify" class="link on">정보 수정</a>
					<a href="${contextPath }/admin/getPaymentList?userId=${loginUser}" class="link on">거래 내역</a>
				</li>
			</ul>
		</div>
		<br><br>
		<!-- 거래 내역 -->
		<div class="sub-con">
			<div class="container mt-3">
				<section class="pay-detail-section">
					<h1 class="pay-title">거래 상세 내역</h1>
					<table class="pay-user-info">
						<tr>
							<th>구매자</th><td>${payDetail.userId}</td>
							<th>배송지</th><td class="address-td">${payDetail.userAddr}</td>
							<th>전화번호</th><td class="phone-td">${payDetail.userPhone}</td>
						</tr>
						<tr>
							<th>총 가격</th><td>${payDetail.totalPrice} 원</td>
							<th>구매일</th><td colspan="3">${payDetail.regdate}</td>
						</tr>
					</table>
					<div>
						<a href="${contextPath}/admin/menuDetail?menuName=${payDetail.menuName}">
							<%-- <img class="img-thumbnail" alt="이미지" src="${contextPath }/admin/download?menuImage=${payDetail.menuImage}"> --%>
						</a>
						<table class="pay-items-info">
							<tr>
								<th>제품명</th>
								<th>추가옵션</th>
							</tr>
							<tr>
								<td>${payDetail.menuName}</td>
								<td>
									<c:if test="${empty payDetail.detailText}">
										없음
									</c:if>
									<c:if test="${not empty payDetail.detailText}">
										${payDetail.detailText}
									</c:if>
								</td>
							</tr>
						</table>
					</div>
				</section>
			</div>
		</div>
	</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>