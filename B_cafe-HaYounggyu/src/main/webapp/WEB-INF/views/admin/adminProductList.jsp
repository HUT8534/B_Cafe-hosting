

<!-- admin/adminProductList.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지/메뉴관리</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" /> 
<style type="text/css">
table th td {
	border: 1px solid black;
	text-align: center;
	width: 300px;	
	
}


td img {
    max-width: 100%;
    max-height: 100%;
    display: block;
    margin: 0 auto;
    }


td {
    text-align: center;
}

td img {
    max-width: 100%;
    max-height: 100%;
    display: block;
    margin: 0 auto;
}
.wrap {
	height: 600px;
	text-align: center;
}
.product_table {
	display: inline-block;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<c:import url="../default/quickBar.jsp" />

	<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual"
			style="background-image: url('${contextPath}/resources/imageFile/banner5.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">관리자 페이지</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">등록된 메뉴를 관리할 수 있습니다</p>
			</div>
		</div>

		<!-- 중간 부분 -->
		<div class="sub-nav sub-nav--bar">
			<ul class="sub-nav__wrap sub-nav-clone--depth2">
				<!-- active 된 메뉴의 depth2 clone 하기 -->
				<li class="item">
					<a href="${contextPath }/admin/adminPage" class="link on">메뉴 추가</a> 
					<a href="${contextPath }/admin/adminProductList" class="link on">메뉴 관리</a>	
				</li>
			</ul>
		</div>
		<br><br>
		<!-- 메뉴 상품등록 List 부분 -->
		<div class="sub-con">
			<section class="notice">
				<div class="page-title">
					<div class="container"></div>
				</div>
				<div class="wrap">
				<table class="product_table">
					<thead>
						<tr>
							<th>제품ID</th>
							<th>제품이미지</th>
							<th>제품가격</th>
							<th>제품이름</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${allMenuViewPasing}">
							<tr>
								<td>${item.menuId }</td>
								<td><img
									src="${contextPath }/admin/download?menuImage=${item.menuImage}"
									width="100px" height="100px"></td>
								<td>${item.menuPrice }</td>
								<td>${item.menuName }<br> <a
									href="${contextPath}/admin/edit?menuName=${item.menuName}">[상품편집]</a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4"><c:forEach var="num" begin="1"
									end="${repeat}">
									<a href="adminProductList?num=${num}">[${num}]</a>
								</c:forEach></td>
						</tr>
					</tfoot>
				</table>
				</div>
			</section>
		</div>
	</div>         	         
<c:import url="../default/footer.jsp" />
</body>
</html>