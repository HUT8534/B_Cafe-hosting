<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/xhtml+xml;charset=utf-8" />
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
html, body {
	position: relative;
	height: 100%;	
	position: relative;
	height: 100%;	
	height: 100%;
}

body {
	background: #eee;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

swiper-container {
	width: 100%;
	height: 70%;
}

swiper-slide {
	position: relative; /* 슬라이드 내부 요소의 위치를 상대적으로 설정 */
}

swiper-slide img {
	display: block;
	width: 100%;
	height: auto; /* 이미지의 높이를 자동으로 조정하여 비율을 유지 */
}
.MySwiper img {
    max-width: 100%;
    max-height: 100%;
  }
.main-visual .swiper-pagination {
    position: absolute;
    left: 50%;
    bottom: 3.125rem;
    transform: translateX(-50%);
}
.swiper-pagination {
    text-align: center;
    transition: 300ms opacity;
    z-index: 10;
}

/*메인 페이지 팝업창*/
.divpop {
	position: absolute;
	z-index: 999;
	top: 150px;
	left: 80px;
	width: 430px;
	height: 500px;
	border: 1px solid black;
	background-color: rgba(255, 255, 255, 1);
	display: none;
}

.title_area {
	font-weight: bold;
	text-align: center;
	width: 100%
}

.button_area {
	position: absolute;
	bottom: 0;
	left: 10px;
}
</style>
<script type="text/javascript">
//팝업창 쿠키설정    
function setCookie( name, value, expiredays ) {
var todayDate = new Date();
todayDate.setDate( todayDate.getDate() + expiredays );
document.cookie = name + '=' + escape( value ) + '; path=/; expires=' + todayDate.toGMTString() + ';'
}

//쿠키 불러오기
function getCookie(name) 
{ 
    var obj = name + "="; 
    var x = 0; 
    while ( x <= document.cookie.length ) 
    { 
        var y = (x+obj.length); 
        if ( document.cookie.substring( x, y ) == obj ) 
        { 
            if ((endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
                endOfCookie = document.cookie.length;
            return unescape( document.cookie.substring( y, endOfCookie ) ); 
        } 
        x = document.cookie.indexOf( " ", x ) + 1; 
        
        if ( x == 0 ) break; 
    } 
    return ""; 
}

//닫기 버튼 클릭시
function closeWin(key)
{
    if($("#todaycloseyn").prop("checked"))
    {
        setCookie('divpop'+key, 'Y' , 1 );
    }
    $("#divpop"+key+"").hide();
}

$(function(){    
    if(getCookie("divpop1") !="Y"){
        $("#divpop1").show();
    }
});
</script>
</head>
<body>
	<swiper-container class="MySwiper" space-between="30" effect="slide" loop>
		<swiper-slide>
			<img src="${contextPath }/resources/imageFile/main/main_01.png" width="300" height="200"/>
		</swiper-slide>
		<swiper-slide>
			<img src="${contextPath }/resources/imageFile/main/main_02.png" width="300" height="200"/>
		</swiper-slide>
		<swiper-slide>
			<img src="${contextPath }/resources/imageFile/main/main_03.png" width="300" height="200"/>
		</swiper-slide>
		<swiper-slide>
			<img src="${contextPath }/resources/imageFile/main/main_04.png" width="300" height="200"/>
		</swiper-slide>
		
	</swiper-container>
	
	<script>
		document.addEventListener("DOMContentLoaded", function() {
		    var swiper = new Swiper('.MySwiper', {
		      loop: true,
		      autoplay: {
		      delay: 3000, // 3초마다 슬라이드 전환
		      },
		      speed: 1000, // 애니메이션 속도
		      preventInteractionOnTransition: true // 슬라이드 애니메이션 중에 상호 작용 비활성화
		    });
		  });
	  // Swiper 초기화 및 옵션 설정
	  var swiper = new Swiper('.swiper-container', {
	    pagination: {
	      el: '.swiper-pagination',
	    },
	    navigation: {
	      nextEl: '.swiper-button-next',
	      prevEl: '.swiper-button-prev',
	    },
	  });
	</script>
	
	<!-- 팝업창 폼 -->
	<form name="notice_form">
      <div id="divpop1" class="divpop">    
          <div class="title_area">notice</div>
           <div class="button_area">
           <img src="${contextPath }/resources/imageFile/popup.png" height="460px;" width="400px;">
               <input type='checkbox' name='chkbox' id='todaycloseyn' value='Y'> 오늘 하루 이창을 열지 않음  
               <a href='#' onclick="javascript:closeWin(1);"><B>[닫기]</B></a>
           </div>
      </div>
  </form>
</body>
</html>