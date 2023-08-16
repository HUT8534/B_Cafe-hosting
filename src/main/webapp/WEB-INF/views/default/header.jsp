<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<style>
* {
	margin: 0;
	box-sizing: border-box;
	text-decoration: none;
	list-style: none;
}

.headerBox {
	height: 30px;
	background-color: black;
}

.tnb {
	display: flex;
	justify-content: end;
	line-height: 30px;
}

.tnb li a {
	position: relative;
	right: 20px;
	margin-right: 10px;
	font-size: 13px;
	color: white;
}

header {
	height: 90px;
	border-bottom: 1px solid black;
}

#gnb {
	display: flex;
	line-height: 90px;
	position: absolute;
	left: 20%;
	top: 30px;
	padding: 0;
	height: 90px;
	z-index: 3;
	opacity: 2; /* 투명도를 0.7로 설정 */
}

#gnb .lnb a {
	display: block;
	color: black;
}

#gnb .lnb li a:hover {
	border-top: 3px solid black;
	
}
#gnb .h_title:hover {
    color: white;
    background-color: black;
} 

h1 {
	color: rgba(161, 31, 31, 0.733);
}

.lnb a {
	font-size: 18px;
	font-weight: bold;
	color: rgb(247, 245, 245);
}

.lnb {
	text-align: center;
	width: 200px;
}

.lnb ul li {
	position: relative;
	height: 50px;
	line-height: 50px;
	border-bottom: 1px solid black;
	font-size: 14px;
	font-weight: bold;

}

.lnb ul li a {
	list-style: none;
	text-decoration: none;
	color: white;
}

.sub_bar {
	height: 205px;
	background-color: white;
	position: relative;
	top: 90px;
	display: none;
	z-index: 2;
}

.lnb ul {
	display: none;
}
.fadeIn {
  opacity: 0;
  animation: fadeIn 1s forwards;
}
.fadeIn1 { 
  opacity: 0;
  animation: fadeIn 1.5s forwards;
}
.fadeIn2 {
  opacity: 0;
  animation: fadeIn 2s forwards;
}
.fadeIn3 {
  opacity: 0;
  animation: fadeIn 2.5s forwards;
}
.fadeIn4 {
  opacity: 0;
  animation: fadeIn 3s forwards;
}

@keyframes fadeIn {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
</style>
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    </head>
    <body>
       <div class="headerBox">
          <ul class="tnb">
             <c:if test="${loginUser == 'cafe' }">
                <li><a href="/cafe/admin/adminPage">관리자페이지</a></li>
             </c:if>
             <c:if test="${loginUser == null }">
                <li><a href="/cafe/member/login">로그인 </a></li>
             </c:if>
             <c:if test="${loginUser != null }">
                <li><a href="/cafe/member/logout"> 로그아웃 </a></li>
             </c:if>
             <c:if test="${loginUser == null }">
                <li><a href="/cafe/member/register">회원가입</a></li>
             </c:if>
             <c:if test="${loginUser != null }">
                <li><a href="/cafe/member/myInfo">마이페이지</a>&nbsp;</li>
             </c:if>
             <c:if test="${loginUser == 'cafe' }">
                <li><a href="/cafe/member/withdrawForm">회원탈퇴</a>&nbsp;</li>
             </c:if>
          </ul>
       </div>

        <header>
            <div class="sub_bar fadeIn"></div>   
            <ul id="gnb" class="gnb_2 fadeIn">               
                <li><a href="${contextPath }/index"><img src="${pageContext.request.contextPath }/resources/imageFile/logo.png" alt="logo" width="200px" height="80px"/></a></li>               
                <li class="lnb"><a href="#" class="h_title">BRAND</a>                                             
                    <ul>
                        <li><a href="${contextPath}/brand/introduce">더블랙 소개</a></li>
                        <li><a href="${contextPath}/brand/history">더블랙 연혁</a></li> 
                        <li><a href="${contextPath}/brand/direction">찾아오시는 길</a></li>                   
                    </ul>                   
                </li>
                
                <li class="lnb fadeIn1"><a href="#" class="h_title">MENU</a>            
                    <ul>
                        <li><a href="${contextPath}/coffee/recommend">커피추천</a></li>
                        <li><a href="${contextPath}/admin/allMenuView">전체메뉴</a></li>
                    </ul>            
                </li>
                <li class="lnb fadeIn2"><a href="#" class="h_title">STORE</a>              
                    <ul>
                        <li><a href="${contextPath}/map/findShop">매장찾기</a></li>
                    </ul>                     
                </li>
                <li class="lnb fadeIn3"><a href="#" class="h_title">MEMBERSHIP</a>             
                    <ul>
                        <li><a href="${contextPath }/admin/cart?loginUser=${loginUser}">장바구니</a></li>   
                        <li><a href="${contextPath }/admin/getPaymentList?userId=${loginUser}">구매내역</a></li>     
                    </ul>
                </li>
                <li class="lnb fadeIn4"><a href="#" class="h_title">COMMUNITY</a>             
                    <ul>
                        <li><a href="/cafe/community/communityAllList">커뮤니티</a></li>
                         <li><a href="/cafe/gongji/gongjiList">공지사항</a></li>
                         <li><a href="/cafe/qna/qnaList">Q&A</a></li>
                    </ul>           
                </li>
            </ul>               
        </header>
         

<script>
    $(document).ready(function() {             
        $("#gnb").on("mouseenter focusin", function() {
          $(this).siblings("li").find("ul").hide();
          $("ul", this).show();
          
          $(this).addClass("on").siblings("li").removeClass("on");
        }).on("mouseleave", function() {
          $("#gnb ul").hide().add("#gnb .lnb").removeClass("on");
        });
      });
      $(document).ready(function() {
        $("#gnb li").mouseenter(function() {
          $(this).closest("#gnb").prev(".sub_bar").css("display", "block");
        });
      
        $("#gnb li").mouseleave(function() {
          $(this).closest("#gnb").prev(".sub_bar").css("display", "none");
        });
      }); 
</script>
</body>
</html>