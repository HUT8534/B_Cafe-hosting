<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>더 블랙 연혁</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/brand/brand.css"
	rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css"
	rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css"
	rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	position: relative;
}

.fadeInDown {
	padding: 1rem;
	text-align: center;
	animation-name: fade-in;
	animation-duration: 7s;
}

@
keyframes fade-in { 0% {
	opacity: 0;
	transform: translateY(-50px);
}
100
%
{
opacity
:
1;
transform
:
translateY(
0
);
}
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<c:import url="../default/quickBar.jsp" />

	<!-- 전체 페이지 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual"
			style="background-image: url('${contextPath}/resources/imageFile/banner2.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown"
					style="visibility: visible; animation-name: fadeInDown;">BRAND</h1>
				<p class="sub-visual__txt wow fadeInUp"
					style="visibility: visible; animation-name: fadeInUp;">좋은 커피와
					맛있는 음료를 합리적인 가격에 제공해드리는 우리는 "더블랙"입니다</p>
			</div>
		</div>
		<div class="sub-nav sub-nav--bar">
			<ul class="sub-nav__wrap sub-nav-clone--depth2">
				<!-- active 된 메뉴의 depth2 clone 하기 -->
				<li class="item"><a href="${contextPath }/brand/introduce"
					class="link on">더블랙 소개</a></li>
				<li class="item"><a href="${contextPath }/brand/history"
					class="link on">더블랙 연혁</a></li>
				<li class="item"><a href="${contextPath }/brand/direction"
					class="link on">찾아 오시는길</a></li>
			</ul>
		</div>
		<br><br>


		<div class="sub_content" id="contents">

			<div class="sub-con">
				<div class="wrapper">
					<div class="sub_title">
						<h3 class="tit wow fadeInDown"
							style="visibility: visible; animation-name: fadeInDown;">
							<span class="_mc2">더블랙 연혁</span>
						</h3>
						<p class="desc wow fadeInUp"
							style="visibility: visible; animation-name: fadeInUp;">History</p>
					</div>
					<div class="history_wrap">
						<div class="wrap wow fadeInDown"
							style="visibility: visible; animation-name: fadeInDown;">
							<div class="img_bx">
								<div class="imgwrap">
									<img
										src="${pageContext.request.contextPath }/resources/imageFile/logo.png"
										alt="">
									<p>2023.06.22 THE BLACK 프로젝트 기획, 구현</p>
								</div>
							</div>
							<div class="txt_bx">
								<p class="tit">6월</p>
								<dl>
									<dt>05.22</dt>
									<dd>실무프로젝트 'THE BLACK' 기획</dd>
									<dd>- 개발 프로젝트 수행방법론 탐색 <br>
										- 개발 프로젝트 주제선정<br>
										- 개발 예정 보고서 작성<br>
										- 개발 일정표 작성</dd>
								</dl>
								<dl>
									<dt>05.31</dt>
									<dd>실무프로젝트 'THE BLACK' 구현</dd>
									<dd>- 논리·물리 ERD 및 쿼리 테스트<br>
										- 프로젝트 네비게이션 작성<br>
										- 사용자 요구사항 분석<br>
										- 개발 화면 구성<br>
										- 실무 프로젝트 구축<br>
										- 프로젝트 테스트<br>
										- 산출물 정리 및 배포<br>
										- 프로젝트 보고서 작성 및 발표</dd>
								</dl>
								<dl>
									<dt>06.22</dt>
									<dd>실무프로젝트 'THE BLACK' 완성</dd>
								</dl>
							</div>
						</div>
						<div class="wrap wow fadeInDown"
							style="visibility: visible; animation-name: fadeInDown;">
							<div class="img_bx">
								<div class="imgwrap">
									<img
										src="data:image/png;base64,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"
										alt="">
									<p>2023.03.13 애플리케이션 테스트 및 설계</p>
								</div>
							</div>
							<div class="txt_bx">
								<p class="tit">5월</p>
								<dl>
									<dt>05.12</dt>
									<dd>애플리케이션 테스트 수행</dd>
									<dd>요구사항대로 응용소프트웨어가 구현되었는지를 검증하기 위해서 분석된 테스트 케이스에 따라 테스트를 수행하고 결함을 조치할 수 있다.</dd>
								</dl>

							</div>
						</div>
						<div class="wrap wow fadeInDown"
							style="visibility: visible; animation-name: fadeInDown; animation-delay:">
							<div class="img_bx">
								<div class="imgwrap">
									<img
										src="data:image/png;base64,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"
										alt="">
									<p>2023.03.24 서버프로그램</p>
								</div>
							</div>
							<div class="txt_bx">
								<p class="tit">4월</p>
								<dl>
									<dt>03.24</dt>
									<dd>인터페이스 구현</dd>
									<dd>모듈간의 분산이 이루어진 경우를 포함하여 단위 모듈간의 데이터 관계를 분석하고 이를 기반으로 한
										메커니즘을 통해 모듈간의 효율적인 연계를 구현하고 검증할 수 있다.</dd>
								</dl>
								<dl>
									<dt>04.10</dt>
									<dd>서버프로그램 구현</dd>
									<dd>애플리케이션 설계를 기반으로 개발에 필요한 환경을 구성하고, 프로그래밍 언어와 도구를 활용하여
										공통모듈, 업무프로그램과 배치 프로그램을 구현할 수 있다.</dd>
								</dl>
								<dl>
									<dt>04.26</dt>
									<dd>통합 구현</dd>
									<dd>모듈간의 분산이 이루어진 경우를 포함하여 단위 모듈간의 데이터 관계를 분석하여 이를 기반으로 한
										메커니즘을 통해 모듈간의 효율적인 연계를 구현하고 검증할 수 있다.</dd>
								</dl>
							</div>
						</div>
						<div class="wrap wow fadeInDown"
							style="visibility: visible; animation-name: fadeInDown;">
							<div class="img_bx">
								<div class="imgwrap">
									<img
										src="data:image/png;base64,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"
										alt="">
									<p>2023.03.13 애플리케이션 테스트 및 설계</p>
								</div>
							</div>
							<div class="txt_bx">
								<p class="tit">3월</p>
								<dl>
									<dt>03.13</dt>
									<dd>애플리케이션 설계</dd>
									<dd>요구사항 확인을 통한 상세 분석 결과, 소프트웨어 아키텍처 가이드라인 및 소프트웨어 아키텍처
										산출물에 의거하여 이에 따른 애플리케이션 구현을 수행하기 위해 공통모듈 설계, 타 시스템 연동에 대하여 상세
										설계하는 능력이다.</dd>
								</dl>

							</div>
						</div>
						<div class="wrap wow fadeInDown"
							style="visibility: visible; animation-name: fadeInDown;">
							<div class="img_bx">
								<div class="imgwrap">
									<img
										src="data:image/png;base64,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"
										alt="">
									<p>2023.02.09 화면구현</p>
								</div>
							</div>
							<div class="txt_bx">
								<p class="tit">2월</p>
								<dl>
									<dt>02.09</dt>
									<dd>화면 설계</dd>
									<dd>요구사항분석 단계에서 파악된 화면에 대한 요구사항을 소프트웨어 아키텍처 단계에서 정의된 구현 지침
										및 UI/UX 엔지니어가 제시한 UI표준과 지침에 따라 화면을 설계하는 능력을 함양할 수 있다.</dd>
								</dl>
								<dl>
									<dt>02.22</dt>
									<dd>화면 구현</dd>
									<dd>요구사항분석 단계에서 파악된 화면에 대한 요구사항을 소프트웨어 아키텍처 단계에서 정의된 구현 지침
										및 UI/UX 엔지니어가 제시한 UI표준과 지침에 따라 화면과 폼, 메뉴 등의 구조와 흐름을 구현하여 반영하는
										능력을 함양할 수 있다.</dd>
								</dl>
							</div>
						</div>
						<div class="wrap wow fadeInDown"
							style="visibility: visible; animation-name: fadeInDown;">
							<div class="img_bx">
								<div class="imgwrap">
									<img
										src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCIFfoW5E4xsjIoAO2rbnieFmZwy62wNZfxQ&usqp=CAU"
										alt="">
									<p>2023.01.06 SQL 및 데이터 베이스</p>
								</div>
							</div>
							<div class="txt_bx">
								<p class="tit">1월</p>
								<dl>
									<dt>01.06</dt>
									<dd>SQL 활용</dd>
									<dd>관계형 데이터베이스에서 SQL을 사용하여 목적에 적합한 데이터를 정의하고, 조작하며, 제어할 수
										있다.</dd>
								</dl>
								<dl>
									<dt>01.16</dt>
									<dd>데이터 베이스 구현</dd>
									<dd>설계된 데이터베이스 모델을 적용하기 위해 DBMS(Data Base Management
										System)를 설치하고 데이터베이스와 데이터베이스 오브젝트를 생성할 수 있다.</dd>
								</dl>
								<dl>
									<dt>01.26</dt>
									<dd>SQL응용</dd>
									<dd>관계형 데이터베이스에서 SQL을 사용하여 응용시스템의 요구기능에 적합한 데이터를 정의하고,
										조작하며, 제어할 수 있다.</dd>
								</dl>
								<dl>
									<dt>02.01</dt>
									<dd>요구사항 확인</dd>
									<dd>업무 분석가가 수집 분석 정의한 요구사항과 이에 따른 분석모델에 대해서 확인과 현행 시스템에 대해
										분석할 수 있다.</dd>
								</dl>
							</div>
						</div>
						<div class="wrap wow fadeInDown"
							style="visibility: visible; animation-name: fadeInDown;">
							<div class="img_bx">
								<div class="imgwrap">
									<img
										src="${pageContext.request.contextPath }/resources/imageFile/menu/코리아 it 아카데미 로고.png"
										alt="">
									<p>2022.12.20 자바 기반 풀스택 강의 시작</p>
								</div>
							</div>
							<div class="txt_bx">
								<p class="tit">2022</p>
								<dl>
									<dt>12.20</dt>
									<dd>네트워크 프로그래밍 구현</dd>
									<dd>네트워크 프로그램을 구현하기 위한 네트워크 개발환경을 분석하고, 각 단계별로 요구되는 기능을
										구현(코딩)하고, 테스트를 하는 능력과 프로그래밍 개발과정에서 발생 할 수 있는 오류를 디버깅하여 프로그램을
										최적화 할 수 있다</dd>
								</dl>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>