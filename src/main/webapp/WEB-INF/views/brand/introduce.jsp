<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>더블랙 소개</title>
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet"/> 	
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet"/> 	
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet"/> 	
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet"/> 	
<style type="text/css">

.fadeIn {
  opacity: 0;
  animation: fadeIn 6s forwards;
}


@keyframes fadeIn {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
.fadeInUp {
  opacity: 0;
  animation: fadeIn 4s forwards;
}


@keyframes fadeInUp {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
.fadeInDown {
  opacity: 0;
  animation: fadeIn 3s forwards;
}
@keyframes fadeInDown {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
</head>
<body>
	<c:import url="../default/header.jsp" />
	<c:import url="../default/quickBar.jsp"/>

	<!-- 전체 페이지 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/banner7.png')">
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
		
		
		<!-- 각 li태그 내용 -->
		<div class="sub-con">
			<div class="wrapper">
				<div class="sub_title">
					<h3 class="tit fadeIn" >
					합리적인 가격에 맛있는 한 잔, <span class="_mc2"> 더블랙</span>
					</h3>
					<p class="desc fadeInUp" style="line-height: 1.7;">
						더블랙은 2023년 6월, 코리아 IT 아카데미에서 첫 선을 보이며 고객님께 합리적인가격에 좋은 커피를 제공하기위해
						시작되었습니다. <i class="br"></i>가맹점의 성공이 곧 본사의 성공이라는 신념아래 2023년, 론칭
						 <i class="br"></i>늘 고객님과 가맹점주님의 편에서 든든하고 믿음직한 동행을위해 나아갈 것입니다.
					</p>
				</div>
			</div>
			<div class="intro__index">
				<div class="vision " style="background-image: url('${contextPath}/resources/imageFile/intro_bg.png')">
					<div class="wrapper wowrap">
						<p class="wow fadeInUp desc" data-wow-delay="0s" style="visibility: visible; animation-delay: 0s; animation-name: fadeInUp;">VISION</p>
						<p class="wow fadeInUp tit" data-wow-delay="0.25s" style="visibility: visible; animation-delay: 0.25s; animation-name: fadeInUp;">
							한 잔의 음료에도 <i class="br"></i>모두의 행복을 생각합니다
						</p>
						<p class="wow fadeInUp txt fadeIn" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
							더블랙은 고객의 만족과 가맹점의 성공을 최우선으로 생각하며<i class="br"></i> 모두가 기분 좋은 하루와 풍요로운 일상을 가장 가까이에서 만들어갑니다.
						</p>
					</div>
				</div>

				<div class="value">
					<div class="wrapper">
						<div class="title_bx">
							<h5 class="title">핵심가치(Core Value)</h5>
						</div>
						<div class="cir_list">
							<ul class="clearfix wowrap">
								<li class="wow fadeIn" data-wow-delay="0s" style="visibility: visible; animation-delay: 0s; animation-name: fadeIn;">									
								<div class="cir_wrap">
										<p class="cir">
											<span> <i class="img"><img src="https://theventi.co.kr/new2022/images/sub/intro_1.png" alt=""></i> 
											행복한 동행
											</span>
										</p>
									</div>
								</li>
								<li class="wow fadeIn" data-wow-delay="0.25s" style="visibility: visible; animation-delay: 0.25s; animation-name: fadeIn;">
									<div class="cir_wrap">
										<p class="cir">
											<span> 
											<i class="img"><img src="https://theventi.co.kr/new2022/images/sub/intro_2.png" alt=""></i>
											즐거운 변화
											</span>
										</p>
									</div>
								</li>
								<li class="wow fadeIn" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeIn;">
									<div class="cir_wrap">
										<p class="cir">
											<span> <i class="img">
											<img src="https://theventi.co.kr/new2022/images/sub/intro_3.png" alt=""></i> 올바른 자부심
											</span>
										</p>
									</div>
								</li>
							</ul>
						</div>
						<div class="list fadeInUp">
							<ul class="clearfix">
								<li>
									<dl>
										<dt>행복한 동행</dt>
										<dd>더블랙과 함께해주시는 고객님과 가맹점주님, 파트타이머와 임직원까지 모두의 곁에서 믿음직한 상생 파트너로서 최선을 다하겠습니다.</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>즐거운 변화</dt>
										<dd>실패에 대한 두려움보다는 자신감 있는 도전으로 이유 있는 변화를 만들어냅니다. 
										합리적인 가격에 대용량 커피를 선보였던 도전정신으로 의미 있는 변화들을 만들어 나가겠습니다.</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>올바른 자부심</dt>
										<dd>정직한 마음과 &lt;THEBLACK Flavor&gt;의 자부심을 바탕으로 꾸준히 성장하는 음료 브랜드로 나아가겠습니다</dd>
									</dl>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>

















