



<!-- member/info.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/myInfo.jsp</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
<style type="text/css">
h2 {
	text-align: center;
}
.myInfo {
	display: flex;
	justify-content: center;
}
table {
	width: 410px;
}
table, th, td {
	border: 3px solid #dadada;
	border-collapse: collapse;
	padding: 4px;
}
.title {
	width: 120px;
	text-align: center;
}

.larger-button {
	padding: 10px 20px; /* 원하는 패딩 값으로 조정 */
	font-size: 16px; /* 원하는 폰트 크기로 조정 */
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

		<!-- 중간 부분 -->
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
		<!-- 로그인 입력 부분 -->
		<div class="sub-con">
		<div class="wrap myInfo">
				<table border="1">
					<tr>
						<th><label for="id">아 이 디</label></th>
						<td><input type="text" name="userId" id="userId" value="${info.userId }" readonly></td>						
					</tr>
					<tr>
						<th><label for="pw">비밀 번호</label></th>
						<td><input type="password" name="userPw" id="userPw" value="${info.userPw }" readonly></td>
    				</tr>
    				<tr>
    					<th><label for="name">이 름</label></th>
    		 			<td><input type="text" name="userName" id="userName" value="${info.userName }" readonly></td> 
    				</tr>
    				<tr>
    					<th><label for="birth">생 일</label></th>
    					<td><input type="text" name="birth" id="userBirth" value="${info.userBirth }" readonly></td> 
    				</tr>
    				<tr>
    					<th><label for="addr">주 소</label></th>
    					<td><input type="text" name="userBirth" id="userAddr" value="${info.userAddr }" readonly></td> 
    				</tr>
					<tr>
						<th><label for="phone">전화 번호</label></th>
    					<td><input type="tel" name="userPhone" id="userPhone" value="${info.userPhone }" readonly></td> 
					</tr>
					<tr>
						<th><label for="email">이 메 일</label></th>
    					<td><input type="email" name="userEmail" id="userEmail" value="${info.userEmail }" readonly></td> 
					</tr>			
					<tr>
						<th colspan="2">
						<button type="button" class="larger-button" id="modify-btn" onclick="location.href='${contextPath }/member/myInfoModify?userId=${info.userId }'">수정하기</button>
						</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
		<c:import url="../default/footer.jsp"/>
</body>
</html>