

<!--admin/adminPage.jsp  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE BLACK 메뉴</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
<!--
   CREATE TABLE menu(
    menuId NUMBER(20),                      -- 제품 아이디
    menuName VARCHAR2(30) NOT NULL,         -- 제품 이름
    menuOption1 VARCHAR2(30),
    menuOption2 VARCHAR2(30),
    menuOption3 VARCHAR2(30),
    menuOption4 VARCHAR2(30),               -- 제품 옵션
    menuPrice NUMBER(30),                   -- 제품 가격
    menuImage VARCHAR2(3000) NOT NULL,      -- 제품 이미지    
    CONSTRAINT menu_PK PRIMARY KEY(menuId)
-->
<style type="text/css">
.admin_h1 {
   text-align: center;
}
.warning{
   border: 1px solid red;
}


.warp {
   display: flex;
   justify-content: center;
   text-align: center;
}

table {
   width: 500px;
   height: 500px;
}

table, th, td {
   border: 1px solid black;
   text-align: center;
}

input[type=text] {
   height: 30px;
   width: 400px;
}

#delete_form  table {
   border: 1px solid black;
   text-align: center;
   width: 200px;
   height: 200px;
}

.larger-button {
   padding: 10px 20px; /* 원하는 패딩 값으로 조정 */
   font-size: 16px; /* 원하는 폰트 크기로 조정 */
}

.larger-submit {
   padding: 10px 20px; /* 원하는 패딩 값으로 조정 */
   font-size: 16px; /* 원하는 폰트 크기로 조정 */
}
::placeholder {
   color:#9ca3afcf;
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
            <h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">관리자 페이지</h1>
            <p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">메뉴 추가를 할 수 있습니다</p>
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
      <!-- 메뉴 부분 -->
      <div class="sub-con">
         <div class="warp">
            <form action="${contextPath }/admin/inputProduct" enctype="multipart/form-data" method="post" onsubmit="return validateForm()">
               <table>
                  <tr>
                     <th>제품 ID:</th>
                     <td><input type="text" name="menuId" placeholder="커피는1과0,샌드위치는2와0,마카롱은3과0으로" id="menuIdInput"></td>
                  </tr>
                  <tr>
                     <th>제품 이름 :</th>
                     <td><input type="text" name="menuName" id="menuNameInput"></td>
                  </tr>
                  <tr>
                     <th>제품 가격 :</th>
                     <td><input type="text" name="menuPrice" id="menuPriceInput"></td>
                  </tr>
                  <tr>
                     <th>상품옵션1</th>
                     <td><input type="text" name="menuOption1" id="menuOption1Input"></td>
                  </tr>
                  <tr>
                     <th>상품옵션2</th>
                     <td><input type="text" name="menuOption2" id="menuOption2Input"></td>
                  </tr>
                  <tr>
                     <th>제품 이미지 :</th>
                     <td><input type="file" name="menuImage" id="menuImageInput"></td>
                  </tr>
                  <tr>
                     <td colspan="2">
                     <input type="submit" class="larger-submit" value="등록" onclick="check();">&nbsp;
                     <input type="button" class="larger-button" value="목록보기"
                        onclick="location.href='${contextPath}/admin/adminProductList'">&nbsp;
                     </td>
                  </tr>
               </table>
            </form>
         </div>
      </div>
   </div>
<c:import url="../default/footer.jsp" />
<script>   
function validateForm() {
      
   var menuId = document.getElementById("menuIdInput").value;
   var menuName = document.getElementById("menuNameInput").value;   
   var menuPrice = document.getElementById("menuPriceInput").value;
   var menuOption1 = document.getElementById("menuOption1Input").value;
   var menuImage = document.getElementById("menuImageInput").value;
     
   if (menuId.trim() === "") {
      alert("제품 아이디를 입력해주세요.");
      return false;
   }
   if (menuName.trim() === "") {
      alert("제품 이름을 입력해주세요.");
      return false;
   }

   if (menuPrice.trim() === "") {
      alert("제품 가격을 입력해주세요.");
      return false;
   }

   if (menuOption1.trim() === "") {
      alert("옵션1 을 입력해주세요.");
      return false;
   }

   if (menuImage.trim() === "") {
      alert("메뉴 이미지를 선택해주세요.");
      return false;
   }
}
</script>


</body>
</html>