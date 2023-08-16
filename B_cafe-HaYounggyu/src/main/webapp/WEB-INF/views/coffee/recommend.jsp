<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recommend.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/css/coffee/default.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/coffee/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/coffee/qna.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/coffee/animation.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/coffee/result.css">
</head>
<script type="text/javascript">
function goToIndex() {
	  // index 페이지로 이동합니다.
	  window.location.href = "${contextPath}/index";
	}
function reTest() {
	  // index 페이지로 이동합니다.
	  window.location.href = "${contextPath}/coffee/recommend";
	}	

</script>
<body>
	<div class="container">
    <section id="main" class="mx-auto my-5 py-5 pt-5 px-3">
        <h1 class="pt-5">12가지 커피에 대한 질문으로 알아보는 나의 MBTI 유형</h1>
        <div class="col-lg-6  col-sm-6 col-12 mx-auto" >
        <img src="${contextPath}/resources/img/main1.png" class="img-fluid">
        </div>
        <p>
            나만의 커피취향 으로 알아보는 MBTI유형 사이트입니다.<br>
            아래의 시작하기 버튼을 눌러 시작해주세요
        </p>
            <button type="button" class="btn btn-dark mt-3" onclick="js:begin()">시작하기</button>
            <button type="button" class="btn btn-dark mt-3" onclick="goToIndex()">홈페이지로 돌아가기</button>
    </section>
    <section id="qna">
        <div class="status mx-auto mt-5">
            <div class="statusBar">

            </div>
        </div>
        <div class="qBox my-5 py-3 mx-auto">

        </div>
        <div class="answerBox"></div>
    </section>
    <section id="result" class="mx-auto my-5 py-5 px-3">
        <h1>당신의 결과는?!</h1>
        <div class="resultname">
                
        </div>
        <div id="resultImg" class="my-3 col-lg-6 col-md-8 col-sm-10 col-12 mx-auto" >
            
        </div>
        <div class="resultDesc">

        </div>
        <button type="button" class="kakao mt-3 py-2 px-3" onclick="reTest()">다시 테스트하기</button>	
        <button type="button" class="kakao mt-3 py-2 px-3" onclick="goToIndex()">홈페이지로 돌아가기</button>	
    </section>
    <script src="${contextPath}/resources/js/data.js" charset="UTF-8"></script>
    <script src="${contextPath}/resources/js/start.js" charset="UTF-8"></script>
    </div>
</body>
</html>