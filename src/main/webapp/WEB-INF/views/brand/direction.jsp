<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아오시는 길</title>
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
</head>
<body>
	<c:import url="../default/header.jsp" />
	<c:import url="../default/quickBar.jsp"/>

	<!-- 전체 페이지 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/banner1.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">BRAND</h1>
				<p class="sub-visual__txt wow fadeInUp"	style="visibility: visible; animation-name: fadeInUp;">좋은 커피와 맛있는 음료를 합리적인 가격에 제공해드리는 우리는 "더블랙"입니다</p>
			</div>
		</div>
		
		
		<div class="sub-nav sub-nav--bar">
			<ul class="sub-nav__wrap sub-nav-clone--depth2">
				<!-- active 된 메뉴의 depth2 clone 하기 -->
				<li class="item"><a href="${contextPath }/brand/introduce" class="link on">더블랙 소개</a></li>
				<li class="item"><a href="${contextPath }/brand/history" class="link on">더블랙 연혁</a></li>
				<li class="item"><a href="${contextPath }/brand/direction" class="link on">찾아 오시는길</a></li>
			</ul>
		</div>
		<br><br>
		<!-- 찾아오시는 길 -->
		<div class="sub-con">
			<div class="wrapper">
				<div class="title_bx">
					<h5 class="title">더블랙코리아 역삼</h5>
					<p class="desc">서울특별시 강남구 테헤란로 146 현익빌딩 3층, 4층 (신한은행건물)
				</div>
				<div id="map" style="width:60%; height:350px; margin-left: 250px; overflow: hidden; position:relative; 
						background: url(https://t1.daumcdn.net/mapjsapi/images/bg_tile.png);">
				</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=71feafc4a84f3d783c861debf3428038&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.5000, 127.0354), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '더블랙코리아 역삼', 
        latlng: new kakao.maps.LatLng(37.5000, 127.0354)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://cdn-icons-png.flaticon.com/128/7704/7704551.png";
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(60, 75); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>
				</div>
			</div>
		</div>
		<c:import url="../default/footer.jsp" />
</body>
</html>