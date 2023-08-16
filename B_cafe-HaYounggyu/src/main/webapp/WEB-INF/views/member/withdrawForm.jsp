<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	width: 410px;
}
table, th, td {
	border: 3px solid #dadada;
	border-collapse: collapse;
	padding: 4px;
}
.center-table {
	margin: 0 auto; /* 가로 중앙 정렬 */
}
.title {
	width: 120px;
	text-align: center;
}

.larger-submit {
	padding: 10px 20px; /* 원하는 패딩 값으로 조정 */
	font-size: 16px; /* 원하는 폰트 크기로 조정 */
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
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">회원탈퇴</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">유저들의 탈퇴를 관리자가 담당합니다.</p>
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
			<div class="wrap withdraw">
				<form action="${contextPath }/member/withdraw" method="post">
					<table class="center-table">
						<tr>
							<th><label for="userId">아이디:</label></th>
							<td><input type="text" name="userId" id="userId"></td>
						</tr>
				        <tr>
				        	<th class="title" colspan="2">
				        		<input type="submit" class="larger-submit" value="탈퇴하기" onclick="showUserId(event)">
				        	</th>
				        </tr>			        
				    </table>
				</form>
			</div>
		</div>
	</div>
<c:import url="../default/footer.jsp" />
<script>
function showUserId(event) {
	  event.preventDefault(); // 폼 전송을 중지

	  var userId = document.getElementById("userId").value;
	  if (userId === "") {
	    alert("삭제할 회원이 없습니다.");
	    return;
	  }

	  var confirmation = confirm("아이디 " + userId + "를 탈퇴하시겠습니까?");
	  if (confirmation) {
	    document.forms[0].submit(); // 폼 전송 실행
	  }
	}
</script>
</body>
</html>