<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<style type="text/css">
.quick {
    width: 100px;
    height: 400px;
    z-index: 1000;
    text-align: center;
    position: fixed;    
    left: 100%;
    top: 200px;
    margin-left: -150px;
} 
#quick.on {
     position: fixed;
     top: 250px;
}
.quick li {
	margin-top: 30px;
	background-color: a397c6;
}
.quick li a p {
	font-size: 20px;
	text-align: center;
	font-size: 15px;
	left: 50%;
	color: black;
}
.quick li a p:hover{
	color:white;
}


.txtwrap {
	display: flex;
	justify-content: center;
 	align-items: center;
	margin: 0 auto;
    width: 85px;
	height: 85px;
    border: 10px solid black;
    background-color: white;
    border-radius: 100%; /* 원으로 만들어주는 코드 */
}
.txtwrap:hover{
	background-color: #dadada;
	color: white;
}
.moveTopBtn {
  margin-top: 200px;  
  border: 3px solid black;
 }

</style>
</head>
<body>
	<div class="quick">
		<ul class="clearfix">
			<li>
			<div class="txtwrap" onclick="location.href='${contextPath }/member/myInfo'" style="cursor: pointer;">
			<a href="${contextPath }/member/myInfo" class="wrap">
					<c:if test="${loginUser != null }">
						<p class="myPage">내 정보</p>
					</c:if>
			</a>	
			<a href="${contextPath }/member/login" class="wrap">
					<c:if test="${loginUser == null }">
						<p class="login">로그인</p>
					</c:if>
			</a>
			</div>	
			</li>
			
			<li>
			<div class="txtwrap" onclick="location.href='${contextPath }/admin/allMenuView'" style="cursor: pointer;">
			<a href="${contextPath }/admin/allMenuView" class="wrap">		
					<p class="tit">전체 메뉴</p>
			</a>
			</div>
			</li>
				
			<li>
			<div class="txtwrap" onclick="location.href='${contextPath }/gongji/gongjiList'" style="cursor: pointer;">
			<a href="${contextPath }/gongji/gongjiList" class="wrap">			
					<p class="tit">공지사항</p>
			</a>
			</div>
			</li>
			
			<li>
			<div class="txtwrap" onclick="location.href='${contextPath }/community/communityAllList'" style="cursor: pointer;">
			<a href="${contextPath }/community/communityAllList" class="wrap">				
					<p class="tit">게시판</p>
			</a>
			</div>
			</li>
			
			<li>
			<div class="moveTopBtn">
					<a class="wrap">				
					<button class="tit">TOP</button>
					</a>
			</div>
			</li>
			
			
			
		</ul>
	</div>

	<!-- javascript -->
	<script type="text/javascript">
	const $topBtn = document.querySelector(".moveTopBtn");

	// 버튼 클릭 시 맨 위로 이동
	$topBtn.onclick = () => {
	  window.scrollTo({ top: 0, behavior: "smooth" });  
	}
	
		/*  
		# window 이벤트
		- ready() :문서가 모두 로드 되었을 때
		  scroll():스크롤바가 움직일 때
		  resize():윈도우의 사이즈가 변경될 때
		  
		 */
		$(document).ready(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > $("header").height()) {
					$("#quick").addClass("on");
				} else {
					$("#quick").removeClass("on");
				}
			}).resize(function() {
				if ($(this).width() < 1000) {
					$("header").addClass("on");
				} else {
					$("header").removeClass("on");
				}
			});

		});
	</script>
	
	
</body>
</html>