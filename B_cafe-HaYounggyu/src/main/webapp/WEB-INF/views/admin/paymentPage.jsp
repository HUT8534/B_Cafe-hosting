<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
<style type="text/css">
section {
   text-align: center;
}
.table_st {
   margin: 0 auto;
   width: 714px;
   border: 3px solid #dadada;
   border-radius : 10px;
   display: flex;
   justify-content: center;
}
.delivInfo {
   width: 340px;
}
.delivInfo, .delivInfo th, .delivInfo td {
   border: 3px solid #dadada;
   border-collapse: collapse;
   padding: 4px;
}
.delivInfo .title {
   width: 120px;
   text-align: center;
}

.delivInfo .larger-button {
   padding: 10px 20px; /* 원하는 패딩 값으로 조정 */
   font-size: 16px; /* 원하는 폰트 크기로 조정 */
}

.menuInfo, .menuInfo th, .menuInfo td {
   border: 1px solid black;
   border-collapse: collapse;
   text-align: center;
   border-bottom: none;
   border-right: none;
   border-left: none;
}

.menuInfo th, .menuInfo td {
   width: 250px;
}
</style>


</head>
<body>
   <c:import url="../default/header.jsp"/>
   <c:import url="../default/quickBar.jsp"/>
      <section>
         <form id="insertPayment" >
            <div class="table_st">
               <table class="menuInfo">
                  <tr>
                     <th>상품명</th>
                     <th>옵션</th>
                     <th>가격</th>
                  </tr>
                  <tr>
                     <td><span class="menu_name">${menuName}</span></td>
                     <td>${detailText}</td>
                     <td>
                        ${totalPrice}
                        <input type="hidden" name="menuName" value="${menuName}">
                        <input type="hidden" name="detailText" value="${detailText}">
                        <input type="hidden" name="totalPrice" value="${totalPrice}">
                     </td>
                  </tr>
               </table>
            </div>
            <div class="table_st">
               <table class="delivInfo">
                  <tr>
                     <th>아이디</th><td><input type="text" name="userId" value="${loginUser}" readonly></td>
                  </tr>
                  <tr>
                     <th>전화번호</th><td><input type="text" id="userPhone" name="userPhone" value="${info.userPhone}" maxlength="11"  placeholder="" ></td>
                  </tr>
                    <tr>
                       <th><label for="address">주소:</label></th>
                       <td>
                          <input type="hidden" id="hiddenAddr" name="userAddr">
                        <input type="text" id="addr2" placeholder="주소">
                        <input type="text" id="addr3" placeholder="상세주소">
                          <input type="button" class="btn btn-info" value="주소 찾기" onclick="daumPost()"><br>
                          
                       </td>
                    <tr>
                    <tr>
                     <th class="title" colspan="2">
                        <button id="subButton" class="apibtn">
						<img alt="카카오결제" src="${contextPath }/resources/imageFile/kakao/payment_icon_yellow.png">
						</button>&nbsp;
                     </th>
                  </tr>
               </table>
            </div>
         </form>
      </section>
   <c:import url="../default/footer.jsp"/>

<script   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
         
   function daumPost() {
	      new daum.Postcode({
	         oncomplete : function(data) {
	            var addr = "";
	            if (data.userSelectedType == 'R') {
	               addr = data.roadAddress
	            } else {
	               addr = data.jibunAddress
	            }
	            $("#addr2").val(addr)
	            $("#addr3").focus()
	         }
	      }).open();
	   }

   $(".apibtn").click(function() {
	   var menuName2 = $("[name='menuName']").val();
	   var totalPrice2 = $("[name='totalPrice']").val();
	   var userId2 = "${loginUser}";

	   var menuName = $("[name='menuName']").val();
	   var detailText = $("[name='detailText']").val();
	   var totalPrice = $("[name='totalPrice']").val();
	   var userId = "${loginUser}";
	   var userPhone = $("[name='userPhone']").val();
	   var userAddr = $("#addr2").val() + " " + $("#addr3").val();
	   var form = {
	   menuName: menuName,
	   detailText: detailText,
	   totalPrice: totalPrice,
	   userId: userId,
	   userPhone: userPhone,
	   userAddr: userAddr,
	   };

	   $.ajax({
	   url:"insertPayment",
	   type: "POST",
	   dataType: "json",
	   data: form,
	   async : false,
	   success: function(data) {
		  alert("성공하였습니다");
	  	
		},
		error: function(data) {
			alert("실패하였습니다");
		}
	   });
	   $.ajax({        
		    url:'kakaopay', // 카카오페이 결제를 위한 컨트롤러 맵핑 주소
		    type: 'POST',
		    dataType: 'json',                   
		    data:{
		      menuName2: menuName2,
		      totalPrice2: totalPrice2,
		      userId2: userId2
		    },
		    success: function(data) {              
		     
		      alert("카카오페이 결제 성공");
		      var redirectUrl = data.next_redirect_pc_url;
		      window.location.href = redirectUrl;
		    },
		    error: function(error) {             
		      // 카카오페이 결제 실패 시 처리할 로직
		      alert("카카오페이 결제 실패!");
		    }
		  });
	   
   });		
</script>
            
</body>
</html>