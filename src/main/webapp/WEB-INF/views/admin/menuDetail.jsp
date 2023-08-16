
<!-- admin/menuDetail.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/menuDetail.jsp</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
   integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>


<link href="${contextPath}/resources/css/brand/common.min.css"
   rel="stylesheet" />
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style type="text/css">

.section_wrap {
   width:1000px;
   height:600px;
   text-align:center;
   position:relative;
   left:20%;
   bottom:-40px;

}

.clear::after{ /* ::after -> 요소 내용 끝에 새로운 컨텐츠를 추가  */
    content: ""; /* 빈 컨텐츠 -> 가상 요소(::afer)를 실행시키기 위해서 필요  */
    display: block; /* 한줄 차지  */
    clear:both;
}
.div_float {
   width: 600px;
}
img{
   margin-right: 10px;
}
.div_img ,.div_float {
   text-align: center;
   float: left;      
   
}

.div_op {
   
   width: 600px;

}
.div_op .add {
   height: 30px;

}
.button_quantity {

   width:600px;
}

.div_button {
   position:relative;
   top:20%;
   left:38%;
   text-align:center;   
   width:200px;
   height: 50px;
}
#amount {
   color: red;
}
.btn_cart {
   background-color: black;
   color: white;
}
.btn_buy {
   background-color: black;
   color: white;
}
.div_amount{

   height:30px;
   width: 500px;
   position: relative;
    left: 25%;
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
            <h1 class="sub-visual__title wow fadeInDown"
               style="visibility: visible; animation-name: fadeInDown;">상 품</h1>
            <p class="sub-visual__txt wow fadeInUp"
               style="visibility: visible; animation-name: fadeInUp;">THE
               BLACK의 상품 창입니다</p>
         </div>
      </div>
   </div>
   <!-- 중간 부분 -->
   <div class="sub-nav sub-nav--bar">
      <ul class="sub-nav__wrap sub-nav-clone--depth2">
         <!-- active 된 메뉴의 depth2 clone 하기 -->
         <li class="item"><a href="${contextPath }/admin/allMenuView"
            class="link on">상 품</a> <a
            href="${contextPath }/admin/cart?loginUser=${loginUser}"
            class="link on">장바구니</a></li>
      </ul>
   </div>

   <!-- 본문내용 -->
   <div class="section_wrap">
   <div class="div_img">
      <img src="${contextPath}/admin/download?menuImage=${edit.menuImage}"style="width: 300px; height: 300px;">
      <input type="text" hidden="" value="${loginUser }" id="userId">         
   </div>
   <div class="div_float">
   <div class="div_op1">
      <span >상품명:${edit.menuName }</span>
      <span hidden=""> 상품ID : ${edit.menuId}</span>
      <span >판매가 : ${edit.menuPrice }원</span>
   </div>
   <c:if test="${fn:containsIgnoreCase(edit.menuId, '1')}">
   <div class="div_op">
      <span class="point_span">사이즈 <select class="add">
            <option value="0">라지+0</option>
            <option value="500">톨+500</option>
            <option value="1000">그란테+1000</option>
            <option value="1500">벤티+1500</option>
      </select>
      </span>
   </div>
   <div class="div_op">
      <span class="point_span">시럽  
         <select class="add">
            <option value="0">없음</option>
            <option value="500">시나몬시럽+500</option>
            <option value="500">헤이즐넛+500</option>
            <option value="500">바닐라+500</option>
            <option value="500">카라멜+500</option>
         </select>
      </span>
   </div>
   <div class="div_op">
       <span class="point_span">토핑 
         <select class="add">
            <option value="0">없음</option>
            <option value="1000">크림추가+1000</option>
            <option value="1000">우유추가+1000</option>
            <option value="500">1샷추가+500</option>
            <option value="1000">2샷추가+1000</option>
         </select>
      </span>
   </div>
   <div class="button_quantity">
         <input type="text" class="quantity_input" value="1"> <span>주문수량
            :</span>
         <button class="plus_btn">+</button>
         <button class="minus_btn">-</button>
   </div>
   </c:if>
   <c:if test="${fn:containsIgnoreCase(edit.menuId, '2')}">
      <div class="div_op">
       <span class="point_span">토핑 
         <select class="add">
            <option value="0">없음</option>
            <option value="1000">치즈추가+1000</option>
         </select>
      </span>
      </div>
      <div class="button_quantity">
         <input type="text" class="quantity_input" value="1"> <span>주문수량
            :</span>
         <button class="plus_btn">+</button>
         <button class="minus_btn">-</button>
      </div>
   </c:if>
   <c:if test="${fn:containsIgnoreCase(edit.menuId, 3)}">
      <div class="button_quantity">
         <input type="text" class="quantity_input" value="1"> <span>주문수량
            :</span>
         <button class="plus_btn">+</button>
         <button class="minus_btn">-</button>
      </div>
   </c:if>
   
   <div id="detail" style="height: 100px;"></div>
   </div>
   <div class="div_amount">       
      총금액 <input type="text"value="${edit.menuPrice}" readonly="readonly"style="border: 0; width: 100px;" id="amount"><span class="point_span"> 원</span>
   </div>
   
   <div class="div_button">
      <input type="button" class="btn_cart" value="장바구니 담기"> <input type="button" class="btn_buy" value="바로구매">
   </div>
   </div>
   <c:import url="../default/footer.jsp" />

   <script>
   /* 셀렉트태그 옵션의 value 값과 합친 총금액  */
   $(document).ready(function() {
        $('.add').change(function() {
          const selectedOption = $(this).find('option:selected');
          const optionValue = selectedOption.val();
          const optionText = selectedOption.text();
          
          const totalPriceElement = $('#totalPrice');
          totalPriceElement.text(optionValue);
          
        });
      });   
      
 
$(document).ready(function() {
  var menuPrice = parseInt(${edit.menuPrice});
  var quantity = parseInt($(".quantity_input").val());
  var userId="${loginUser}";
  var menuId="${edit.menuId}";

  $(".plus_btn").on("click", function() {
    quantity++;
    $(".quantity_input").val(quantity);
    updateTotalAmount();
  });

  $(".minus_btn").on("click", function() {
    if (quantity > 1) {
      quantity--;
      $(".quantity_input").val(quantity);
      updateTotalAmount();
    }
  });

  $('.add').change(function() {
    updateTotalAmount();
  });

  $(".btn_cart").on("click", function(e) {
    e.preventDefault();
    var detailText = $("#detail").text();
    var totalPrice = parseInt($("#amount").val());

    var formData = {
      totalPrice: totalPrice,
      detailText: detailText,
      userId: userId,
      menuId: menuId
      
      
    };

    $.ajax({
      url: 'add',
      type: 'POST',
      dataType: 'json',
      contentType: 'application/json; charset=utf-8',
      data: JSON.stringify(formData),
      success: function(result) {
           alert("장바구니에 추가하였습니다.");
           window.location.href = '${contextPath}/admin/cart?loginUser=${loginUser}';
      },
      error: function(error) {
         console.log("실패")
         alert("장바구니에 담기실패했습니다.");
      }
    });
  });

          

          

  function updateTotalAmount() {
    var sum = 0;
    var detailText = '';

    $('.add').each(function() {
      var selectedOption = $(this).find('option:selected');
      var selectedValue = parseInt(selectedOption.val());
      var selectedText = selectedOption.text();

      if (selectedValue) {
        sum += selectedValue;
        detailText += selectedText + ' + ';
      }
    });

    detailText += ' 수량 : ' + quantity + ' 개  ';

    var totalPrice = (menuPrice + sum) * quantity;
    $("#amount").val(totalPrice);
    $("#detail").text(detailText);
  }

  updateTotalAmount();
});
   

$(".btn_buy").on("click", function(e) {
    e.preventDefault();
    var detailText = $("#detail").text();
    var totalPrice = parseInt($("#amount").val());
    var userId="${loginUser}";
    var menuId="${edit.menuId}";
    var menuName="$(edit.menuName)";
    
    var formData = {
      totalPrice: totalPrice,
      detailText: detailText,
      userId: userId,
      menuId: menuId,
      menuName: menuName
      
      
    };

    $.ajax({
      url: 'buy',
      type: 'POST',
      dataType: 'json',
      contentType: 'application/json; charset=utf-8',
      data: JSON.stringify(formData),
      success: function(result) {
         console.log("성공")
         window.location.href = '${contextPath}/admin/cart?loginUser=${loginUser}';
      },
      error: function(error) {
         console.log("실패",error)
       
      }
    });
  });

</script>

</body>
</html>