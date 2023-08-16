
<!-- admin/getPaymentList.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>거래 내역</title>
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
.inner_tr {
	cursor: pointer;
}
.sub-con {
	padding-top: 100px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	  var maxLength = 10; // 원하는 최대 길이 설정
	  
	  $("tr td:last-child").each(function() {
	    var text = $(this).text();
	    
	    if (text.length > maxLength) {
	      $(this).text(text.substring(0, maxLength));
	    }
	  });
	});
</script>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<c:import url="../default/quickBar.jsp"/>
	
		<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/banner4.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">거래 내역</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">회원님의 거래 내역을 확인할 수 있습니다</p>
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
			<section>
				<table border="1">
					<tr>
						<th>번호</th>
						<th>상품명</th>
						<th>옵션</th>
						<th>가격</th>
						<th>거래일자</th>
					</tr>
					<c:forEach var="dto" items="${payList}">
						<tr class="inner_tr" onclick="location.href='${contextPath}/admin/paymentDetails?userId=${dto.userId}&payNum=${dto.payNum}'">
							<td><input type="hidden" name="payNum" value="${dto.payNum}">${dto.payNum}</td>
							<td>${dto.menuName}</td>
							<td>
								<c:if test="${empty dto.detailText}">
									없음
								</c:if>
								<c:if test="${not empty dto.detailText}">
									${dto.detailText}
								</c:if>
							</td>
							<td>${dto.totalPrice} 원</td>
							<td>${dto.regdate}</td>
						</tr>
						<c:if test="${empty payList}">
							<tr>
								<th colspan="4">거래한 내역이 없습니다</th>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</section>
		</div>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>