
<!-- member/idPwResult.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW 찾기</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/member/login.css" rel="stylesheet" />
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
	width: 340px;
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
.table-container {
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
}
input[type="submit"] {
 	width: 200px; /* 원하는 가로 길이로 설정 */
}
label {
    white-space: nowrap; /* text를 한줄로 표시 */
    }
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<c:import url="../default/quickBar.jsp" />

	<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/banner5.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">ID/PW 찾기</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">회원님의 ID/PW 정보 입니다.</p>
			</div>
		</div>

		<!-- 중간 부분 -->
		<div class="sub-nav sub-nav--bar">
			<ul class="sub-nav__wrap sub-nav-clone--depth2">
				<!-- active 된 메뉴의 depth2 clone 하기 -->
				<li class="item">
					<a href="${contextPath }/member/login" class="link on">로그인</a>					
					<a href="${contextPath }/member/register" class="link on">회원 가입</a>
					<a href="${contextPath }/member/findIdPw" class="link on">정보 찾기</a>
				</li>
			</ul>
		</div>
		
		<!-- 로그인 입력 부분 -->
		<div class="sub-con">
			<div class="wrap idPwResult">
				<div class="table-container">
					<table border="1">
						<tr>
							<th><label for="id">아 이 디</label></th>
							<td><input type="text" name="userId" id="userId" value="${userId }" readonly></td>						
						</tr>
						<tr>
							<th><label for="pw">비밀 번호</label></th>
							<td><input type="text" name="userPw" id="userPw" value="${userPw }" readonly></td>
	    				</tr>
	    				<tr>
	    					<th colspan="2">
	    						<a href="${contextPath }/member/login">
									<input type="button" class="larger-button" value="로그인">
								</a>
							</th>
	    				</tr>
	    			</table>
    			</div>
			</div>
		</div>
	</div>
<c:import url="../default/footer.jsp" />			
</body>
</html>