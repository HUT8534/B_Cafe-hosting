<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>success.jsp</title>
<script>
    alert("결제가 성공적으로 완료되었습니다!");
    window.location.href = "${contextPath}/admin/getPaymentList?userId=${userId2}"
</script>
</head>
<body>
</body>
</html>