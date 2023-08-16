


<!-- admin/allMenuView.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/allMenuView.jsp</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/member/login.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style type="text/css">
section {
	height: 1800px;
	position: relative;
	top: 200px;
}

.clear::after {
	content: "";
	display: block;
	clear: both;
}

li {
	list-style: none;
}

#product  span {
	font-size: 18px;
	color: black;
	font-weight: bold;
}

#product .item {
	float: left;
	margin: 10px;
	text-align: center;
}

#product .item .menuId {
	margin-top: 10px;
	color: #ce5c11;
}

#product .item .menuName .option {
	margin-top: 10px;
	color: #333333;
}

#product .item .price {
	margin-top: 10px;
	font-size: 22px;
	font-weight: bold;
	color: #9d0000;
}

#add_button {
	width: 100px;
}
section {
	text-align: center;
}
.menu_nav {
	margin:0;
	border:0;
	width: 900px;
	height: 40px;
	display: inline-block;
	position:relative;
	left:27%;
	background-color: black;
	display:flex;
	justify-content:space-around;
	border-radius: 10px;
}
.menu_nav_bar {	
	display:block;
	width: 100%;
	border-radius: 10px;
	
}
.menu_nav_bar a {
	display:block;
	line-height:40px;
	color: white;
}
.menu_nav_bar:hover {
	background: white;
	border: 1px solid black;	
}
.menu_nav_bar a:hover {
	color: black;
}
#product .item{
	width:300px;
	background-color: #E2E2E2;
	position: relative;
	left: 5%;
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
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">메 뉴</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">THE BLACK의 메뉴 창입니다</p>
			</div>
		</div>
	</div>	

		<!-- 중간 부분 -->
		<div class="sub-nav sub-nav--bar">
			<ul class="sub-nav__wrap sub-nav-clone--depth2">
				<!-- active 된 메뉴의 depth2 clone 하기 -->
				<li class="item">
					<a href="${contextPath }/admin/allMenuView" class="link on">메 뉴</a>
					<a href="${contextPath }/admin/cart?loginUser=${loginUser}" class="link on">장바구니</a>
				</li>
			</ul>
		</div>
		
		<!-- 전체메뉴 부분 -->
	<div class="sub-con">
		<section>
			<!--중단 메뉴 선택바  -->
			<div class="menu_nav">
				<div class="menu_nav_bar">
					<a href="?all">전체메뉴</a>
				</div>
				<div class="menu_nav_bar">
					<a href="?category=coffee">커피</a>
				</div>
				<div class="menu_nav_bar">
					<a href="?category=sandwich">샌드위치</a>
				</div>
				<div class="menu_nav_bar">
					<a href="?category=makalong">마카롱</a>
				</div>
			</div>
			
			<c:forEach var="product" items="${allMenuView}">
				<c:choose>
					<c:when test="${param.category == 'all'}">
						<div id="product">
							<ul class="item">
								<li><a href="${contextPath }/admin/menuDetail?menuName=${product.menuName}">
									<img src="${contextPath }/admin/download?menuImage=${product.menuImage}"width="200px" height="200px"></a></li>
								<li class="menuName"><span>${product.menuName}</span></li>
								<li class="option">${product.menuPrice }원</li>
								<li class="menuId">열량: ${product.menuOption1 }kcal</li>
								<li class="menuId">재료: ${product.menuOption2 }</li>
								
							</ul>
						</div>
					</c:when>
					<c:when test="${param.category == 'coffee'}">
						<c:if test="${fn:containsIgnoreCase(product.menuId, '1')}">
							<div id="product">
								<ul class="item">
									<li>
										<a href="${contextPath }/admin/menuDetail?menuName=${product.menuName}">
										<img src="${contextPath }/admin/download?menuImage=${product.menuImage}"width="200px" height="200px"></a>
									</li>
									<li class="menuName">${product.menuName}</li>
									<li class="option">${product.menuPrice }원</li>
									<li class="menuId">열량: ${product.menuOption1 }kcal</li>
									<li class="menuId">정보: ${product.menuOption2 }<li>									
								</ul>
							</div>
						</c:if>
					</c:when>
					<c:when test="${param.category == 'sandwich'}">
						<c:if test="${fn:containsIgnoreCase(product.menuId, '2')}">
							<div id="product">
								<ul class="item">
									<li><a href="${contextPath }/admin/menuDetail?menuName=${product.menuName}">
											<img src="${contextPath }/admin/download?menuImage=${product.menuImage}"width="200px" height="200px"></a></li>
									<li class="menuName"><span>${product.menuName}</span></li>
									<li class="option">${product.menuPrice }원</li>
									<li class="menuId">열량: ${product.menuOption1 }kcal</li>
									<li class="menuId">재료: ${product.menuOption2 }</li>
									
								</ul>
							</div>
						</c:if>
					</c:when>
					<c:when test="${param.category == 'makalong'}">
						<c:if test="${fn:containsIgnoreCase(product.menuId, '3')}">
							<div id="product">
								<ul class="item">
									<li><a href="${contextPath }/admin/menuDetail?menuName=${product.menuName}">
										<img src="${contextPath }/admin/download?menuImage=${product.menuImage}"width="200px" height="200px"></a></li>
									<li class="menuName"><span>${product.menuName}</span></li>
									<li class="option">${product.menuPrice }원</li>
									<li class="menuId">열량: ${product.menuOption1 }kcal</li>
									<li class="menuId">재료: ${product.menuOption2 }</li>
									
								</ul>
							</div>
						</c:if>
					</c:when>
					<c:otherwise>
						<div id="product">
							<ul class="item">
								<li><a href="${contextPath }/admin/menuDetail?menuName=${product.menuName}">
									<img src="${contextPath }/admin/download?menuImage=${product.menuImage}"width="200px" height="200px"></a></li>
								<li class="menuName"><span>${product.menuName}</span></li>
								<li class="option">${product.menuPrice }원</li>
								<li class="menuId">열량 : ${product.menuOption1 }kcal</li>
								<li class="menuId">재료 : ${product.menuOption2 }</li>
								
							</ul>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</section>
	</div>
	<c:import url="../default/footer.jsp" />
<script type="text/javascript">
</script>
</body>
</html>