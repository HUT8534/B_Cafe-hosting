<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하단 커피 슬라이더</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<!-- Demo styles -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style type="text/css">
.menu_title {
	text-align: center;
	font-size: 40px;
	font-weight: bold;
}

.menu_list_wrap {
	text-align: center;
}

.menu_list {
	font-size: 30px;
}


body {
    position: relative;
    height: auto
}

body {
    background: #eee;
    font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
    font-size: 14px;
    color: #000;
    margin: 0;
    padding: 0;
    overflow-x: hidden;
}

.wrapper {
    max-width:1200px;
    width:75%;
    margin:0 auto;
}

.swiper {
    max-width: 350px;
    width:60%;
    height: 360px;
    position: relative;
    overflow: visible;
}

.swiper-slide {
    max-width: 480px;
    width:90%;
    height:360px;
    text-align: center;
    font-size: 18px;
    background: #fff;
    border-radius: 10px;

    /* Center slide text vertically */
    display: -webkit-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -webkit-align-items: center;
    align-items: center;
}

.swiper-slide img {
    display: block;
    width: 100%;
    width: 280px;
    height: 70%;
    margin-bottom: 40px;
    object-fit: cover;
}

.swiper-slide img {
    transition: transform 0.3s ease;
}

.swiper-slide img:hover {
    transform: scale(1.1);
}


b {
	text-align: center;
}


.swiper-slide {opacity:0.5; transition:opacity 0.5s;}
.swiper-slide-active {opacity:1;}

.changing {
    transition:opacity 0.3s;
    pointer-events:none;
  }
  
  .changed {  
    transition:none;
  }


/* pagination */
.mySwiper .swiper-pagination {
    position: absolute;
    bottom: -30px;
    text-align:left;
    
}

/* nav btn*/
.mySwiper .swiper-button-next,
.mySwiper .swiper-button-prev {
    top: 50%;
    color: black;
}

.mySwiper .swiper-button-prev {
    transform:translateX(-150%);
}
.mySwiper .swiper-button-next {
    transform:translateX(150%);
}

.custom-fraction {text-align:right; margin:15px 5px 0 0;}
.btn-wrapper {
    margin-top:50px;
}

.blind {overflow: hidden; position: absolute; width: 1px; height: 1px; font-size: 12px; clip: rect(1px, 1px, 1px, 1px);}


.container .img-popup {position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.5); visibility: hidden; opacity: 0; transition: all 0.3s; z-index: 10000;}
.container .img-popup.active {visibility: visible; opacity: 1;}
.container .img-popup .popup-inner {position: absolute; top: 50%; left: 55%; transform: translate(-50%, -50%); width: 900px;}

.container .img-popup .popup-inner .close-btn {display: flex; display: -webkit-flex; display: -ms-flexbox; position: absolute; top: -36px; left: 40%; transform: translateX(-50%); width: 40px; height: 40px; border-radius: 50%; background-color: #1eb9b2; justify-content: center; align-items: center; color: #fff; font-size: 30px;}
.container .img-popup .popup-inner .close-btn i {transition: all 0.3s;}
.container .img-popup .popup-inner .close-btn:hover i {transform: rotate(180deg);}

@media (max-width:991px) {
  .container .img-popup .popup-inner {width: 90%;}
  .container .img-popup .popup-inner .close-btn {width: 50px; height: 50px; top: -26px;}
  .container .img-popup .popup-inner .close-btn img {width: 20px;}


</style>
</head>

<body>
	<div class="best_menu">
	  <div class="menu_title">
	  	<img src="${contextPath }/resources/imageFile/main/bean.png" width="50px;" height="50px;">
	  	THE BLACK'S BEST MENU
	  	<img src="${contextPath }/resources/imageFile/main/bean.png" width="50px;" height="50px;">
	  </div>
	</div>
  <br>
  	
  	
  <div class="container">
  <div class="img-popup">
    <div class="popup-inner">
      <textarea rows="8" cols="160" readonly="readonly" style="font-weight: bold; font-size: 20px; padding: 60px 5px 40px 5px; margin-top:20px; text-align: center; border-radius: 20px;" class="popup-textarea"></textarea>
      <a href="#" class="close-btn"><i class="xi-close"></i><span class="blind">팝업창 닫기</span></a>
    </div>
  </div>
  
  <div class="wrapper">
  <div class="swiper mySwiper">
    <div class="swiper-wrapper">
      <div class="swiper-slide">
      	<a href="#">
      		<img src="${contextPath }/resources/imageFile/menu/아메리카노.jpg" alt="이미지1"
      		data-text="<아이스 카페 아메리카노>
  진한 에스프레소에 시원한 정수물과 얼음을 더하여 더블랙의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피입니다.
   
   
   -----영양정보   Tall(톨) 355ml 기준 -----
   1회 제공량(kcal): 10 / 나트륨(mg): 5 / 단백질(g): 1 / 카페인(mg): 150">
      		<span class="text" style="font-size:17px; font-weight: bold;">아이스 카페 아메리카노</span>
      	</a>
      </div>            
      <div class="swiper-slide">
      	<a href="#">
      		<img src="${contextPath }/resources/imageFile/menu/에스프레소 프라푸치노.PNG" alt="이미지2"
      		data-text="<에스프레소 프라푸치노>
    에스프레소 샷의 강렬함과 약간의 단맛이 어우러진 프라푸치노입니다.
      		
      		
     -----영양정보   Tall(톨) 355ml 기준 -----
   1회 제공량(kcal): 145 / 나트륨(mg): 115 / 단백질(g): 2 / 카페인(mg): 120">
      		<span class="text" style="font-size:17px; font-weight: bold;">에스프레소 프라푸치노</span>
      	</a>
      </div>
      <div class="swiper-slide">
      	<a href="#">
      		<img src="${contextPath }/resources/imageFile/menu/오트 콜드브루.PNG" alt="이미지3"
      		data-text="<오트 콜드브루>
   콜드 브루의 풍미와 깔끔한 오트음료가 어우러진 달콤 고소한 라떼. 식물성 대체유를 사용해 모든 고객이 부담없이 즐길 수 있는 콜드 브루 음료입니다.
   
   
     -----영양정보   Tall(톨) 355ml 기준 -----
  1회 제공량(kcal): 265 / 나트륨(mg): 130 / 단백질(g): 8 / 카페인(mg): 155">
      		<span class="text" style="font-size:17px; font-weight: bold;">오트 콜드브루</span>
      	</a>
      </div>
      <div class="swiper-slide">
      	<a href="#">
      		<img src="${contextPath }/resources/imageFile/menu/바질토마토지츠 베이글.png" alt="이미지4"
      		data-text="<바질 토마토 치즈 베이글>
    바질, 썬드라이 토마토, 크림치즈의 조합이 이색적인 베이글로 크림치즈가 듬뿍 샌드되어 든든하게 즐길 수 있습니다.
    
    
    -----영양정보           185(g) 기준 -----
  1회 제공량(kcal): 517 / 나트륨(mg): 804 / 단백질(g): 14 / 당류(g): 17">
      		<span class="text" style="font-size:17px; font-weight: bold;">바질 토마토 치즈 베이글</span>
      	</a>
      </div>
      <div class="swiper-slide">
      	<a href="#">
      		<img src="${contextPath }/resources/imageFile/menu/클라우드 치즈 케이크.png" alt="이미지5"
      		data-text="<클라우드 치즈 케이크>
     사워크림의 상큼함과 진한 치즈의 맛을 동시에 맛볼 수 있는 케이크입니다.
     
     
     -----영양정보           145(g) 기준 -----
  1회 제공량(kcal): 532 / 나트륨(mg): 874 / 단백질(g): 8 / 당류(g): 24">
      		<span class="text" style="font-size:17px; font-weight: bold;">클라우드 치즈 케이크</span>
      	</a>
      </div>
      <div class="swiper-slide">
      	<a href="#">
      		<img src="${contextPath }/resources/imageFile/menu/뺑 오 쇼콜라.png" alt="이미지6"
      		data-text="<뺑 오 쇼콜라>
     바삭하면서도 속은 부드러운 데니쉬 안에 초콜릿 필링을 넣어 담백하면서도 달콤한 맛이 느껴지는 빵입니다.
     
     
     -----영양정보           70(g) 기준 -----
  1회 제공량(kcal): 295 / 나트륨(mg): 380 / 단백질(g): 5 / 당류(g): 8">
      		<span class="text" style="font-size:17px; font-weight: bold;">뺑 오 쇼콜라</span>
      	</a>
      </div>
      <div class="swiper-slide">
      	<a href="#">
      		<img src="${contextPath }/resources/imageFile/menu/블루베리마카롱.png" alt="이미지7"
      		data-text="<블루베리마카롱>
     겉은 바삭하고 속은 쫄깃한 새콤 달콤 블루베리 맛의 마카롱입니다.
     
     
     -----영양정보           35(g) 기준 -----
     1회 제공량(kcal): 160 / 나트륨(mg): 26 / 단백질(g): 3 / 당류(g): 16">
      		<span class="text" style="font-size:17px; font-weight: bold;">블루베리마카롱</span>
      	</a>
      </div>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>
</div>
</div>	
		

	
	
  
  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

  <script type="text/javascript">
  $("document").ready(function () {
	    // 문서의 dom이 준비되면
	    // .mySwiper 클래스를 swiper 슬라이더로 만듦
	    // 이후에 swiper변수에 할당했기 때문에 스크립트로 제어할 수도 있음.
	    var swiper = new Swiper(".mySwiper", {
	        slidesPerView: '1',
	        spaceBetween: 80,
	        loop: true,

	        // pagination 기본은 bullet
	        pagination: {
	            el: ".swiper-pagination"
	        },

	        // 좌우 화살표 navigation element 지정
	        navigation: {
	            nextEl: ".swiper-button-next",
	            prevEl: ".swiper-button-prev"
	        },
	        // 반응형
	        breakpoints: {
	            // 600px 이하가 되면 슬라이드 간 간격을 0으로
	            600: {
	                spaceBetween: 0
	            },
	        },

	        on: {
	            init: function() {
	                $('.swiper-slide').addClass('changed');

	                // fraction에 현재 인덱스와 전체 인덱스 표시
	                // this.loopedSlides는 loop, slidesPerView: 'auto'일 때 제대로 동작
	                $('.custom-fraction .current').text(this.realIndex + 1);
	                $('.custom-fraction .all').text(this.loopedSlides);
	                // console.log(this);
	                // console.log(this.loopedSlides)
	            },

	            slideChangeTransitionStart: function() {
	                // 기본적으로 제공하는 swiper-slide-active 클래스를 이용해
	                // css transition 애니메이션 작성 가능하다.
	                // 다만 루프 모드일 때에는 루프 픽스를 하며 slide를 바꿔치기를 하는데,
	                // 이 때 플리커링이 발생할 수 있다.
	                // css transition을 서로 다르게 설정한 changed, changing 클래스를 이용
	                $('.swiper-slide').addClass('changing');
	                $('.swiper-slide').removeClass('changed');

	                // 페이지 넘어갈 때마다 fraction 현재 인덱스 변경
	                $('.custom-fraction .current').text(this.realIndex + 1);
	            },

	            slideChangeTransitionEnd: function() {
	                // changing : transition O
	                // changed : transition X
	                $('.swiper-slide').removeClass('changing');
	                $('.swiper-slide').addClass('changed');
	            }
	        },
	    });

	    // 슬라이더 할당한 swiper로 슬라이더 제어
	    $(".auto-start").on("click", function() {
	        // 기본 설정으로 autoplay 시작
	        console.log("autoplay start");
	        swiper.autoplay.start();
	    });

	    $(".auto-stop").on("click", function() {
	        console.log("autoplay stop");
	        swiper.autoplay.stop();
	    });
	});
  
  $(function(){
	    var popup = $('.img-popup');
	    var closeButton = popup.find('.close-btn');
	    var popupTextarea = popup.find('.popup-textarea');
	    var htmlAndBody = $('html, body');
	    var focusTarget;

	    // 팝업 생성
	    $('.swiper-slide a').on('click', function(e){
	      e.preventDefault();
	      var text = $(this).find('img').attr('data-text');
	      focusTarget = $(this);
	      popupTextarea.val(text);
	      createPopup();
	    });

		  // 팝업 제거
		  popup.on('click', function(){
		    removePopup();
		  });
		  closeButton.on('click', function(e){
		    e.preventDefault();
		    removePopup();
		  });

		  // 팝업창 검은배경과 닫기 버튼을 제외한 나머지 부분 클릭시 닫히지 않도록 하기
		  popup.find('> .popup-inner').on('click', function(e){
		    e.stopPropagation();
		  })

		  // 팝업 생성 함수
		  function createPopup(){
		    popup.addClass('active');
		    htmlAndBody.css('overflow-y', 'hidden');
		    setTimeout(function(){
		      closeButton.focus();
		    }, 50);
		  }
		  // 팝업 제거 함수
		  function removePopup(){
		    popup.removeClass('active');
		    focusTarget.focus();
		    htmlAndBody.css('overflow-y', 'visible');
		  }
		})

  </script> 
</body>
</html>