
<!-- member/login.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/login.jsp</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/member/login.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />

</head>
<body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
  Kakao.init("71feafc4a84f3d783c861debf3428038"); // 카카오 앱 키 입력

  function kakaoLogin() {
	  Kakao.Auth.getStatusInfo(function(statusObj) {
	    if (statusObj.status === 'not_connected') {
	      // 카카오에 로그인되어 있지 않은 경우 로그인 팝업 열기
	      Kakao.Auth.login({
	        scope: 'profile_nickname, account_email, age_range',
	        success: function(authObj) {
	          console.log(authObj);
	          window.Kakao.API.request({
	            url:'/v2/user/me', 
	            success: function(res) {
	              const kakao_account = res.kakao_account;
	              console.log(kakao_account);
	              // 추가 처리 로직을 여기에 작성하세요.
	              alert('카카오 인증이 완료되었습니다. \n회원가입 페이지로 이동합니다.');
	              window.location.href = '${contextPath}/member/register';
	            }
	          });
	        }
	      });
	    } else {
	      // 이미 카카오에 로그인되어 있는 경우 처리할 로직 작성
	      console.log('이미 카카오에 로그인되어 있습니다.');
	    }
	  });
	}
  function kakaoLogout() {
	  Kakao.Auth.logout(function() {
	    console.log('카카오 로그아웃 완료');
	    // 추가 처리 로직을 여기에 작성하세요.
	    alert('카카오 로그아웃 되었습니다. \n다시 로그인 하세요');
	  });
	}
  
  $(function(){
	  $("#find_id_btn").click(function(){
		  location.href="../member/findIdForm";
	  })
  })
</script>
	<c:import url="../default/header.jsp" />
	<c:import url="../default/quickBar.jsp" />

	<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/banner5.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">로그인</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">THE BLACK의 로그인 창입니다</p>
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
		<br><br>
		<!-- 로그인 입력 부분 -->
		<div class="sub-con">
			<div class="wrap login">				
				<form action="${contextPath }/member/userCheck" method="post">
					<div class="table-container">
						<table>
							<tr>
								<th>아이디</th>
								<td><input type="text" id="userId" name="id" placeholder="아이디를 입력하세요"></td>
							</tr>
							<tr>
								<th>패스워드</th>
								<td><input type="password" id="userPw" name="pw" placeholder="패스워드를 입력하세요"></td>
							</tr>
							<tr>
								<th colspan="4" >
									<input type="submit" class="larger-submit" value="로그인">&nbsp; 
									<a href="${contextPath }/member/register">
									<input type="button" class="larger-button" value="회원가입">
									</a>
									<a href="javascript:kakaoLogin();"> 
										<img src="${contextPath }/resources/imageFile/kakao/kakao_login_medium.png">
									</a>
								</th>
							</tr>
							<tr>
								<th colspan="2">
									<a href="javascript:kakaoLogout();">
										<img src="${contextPath }/resources/imageFile/kakao/kakao_logout_medium_wide.png">
									</a>
								</th>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
	<c:import url="../default/footer.jsp" />
<script>
  // 로그인 성공 시 실행되는 함수
  function loginSuccess() {
    alert('로그인하셨습니다.');
  }

  // 로그인 폼 제출 시 실행되는 함수
  function submitLoginForm() {
    // 로그인 폼을 서버로 제출하는 로직

    // 서버로부터 로그인 성공 여부를 받아온다고 가정
    var loginSuccess = true;

    if (loginSuccess) {
      loginSuccess();
    }
  }
</script>
</body>
</html>


