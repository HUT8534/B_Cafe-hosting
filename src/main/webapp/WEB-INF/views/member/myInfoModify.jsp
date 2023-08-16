
<!-- member/myInfoModify.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myInfoModify.jsp</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<link href="${contextPath}/resources/css/brand/brand.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/common.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/brand/css.css" rel="stylesheet" />
<style type="text/css">
h2 {
	text-align: center;
}

.myInfoModify {
	display: flex;
	justify-content: center;
}

table {
	width: 420px;
}

table, th, td {
	border: 3px solid #dadada;
	border-collapse: collapse;
	padding: 4px;
}

.title {
	width: 120px;
	text-align: center;
}

.larger-submit {
	padding: 10px 20px; /* 원하는 패딩 값으로 조정 */
	font-size: 16px; /* 원하는 폰트 크기로 조정 */
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<c:import url="../default/quickBar.jsp"></c:import>

	<!-- 상단 부분 -->
	<div class="sub_content" id="contents">
		<div class="sub-visual" style="background-image: url('${contextPath}/resources/imageFile/sv_1.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">정보 수정</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">회원님의 개인정보를 수정할 수 있습니다</p>
			</div>
		</div>

		<!-- 중간 부분 -->
		<div class="sub-nav sub-nav--bar">
			<ul class="sub-nav__wrap sub-nav-clone--depth2">
				<!-- active 된 메뉴의 depth2 clone 하기 -->
				<li class="item">
					<a href="${contextPath }/member/myInfo" class="link on">마이페이지</a>
					<a href="${contextPath }/member/myInfoModify" class="link on">정보 수정</a>
					<a href="${contextPath }/admin/getPaymentList?userId=${loginUser}" class="link on">거래 내역</a>
				</li>
			</ul>
		</div>
		<br><br>
		<!-- 로그인 입력 부분 -->
		<div class="sub-con">
			<div class="wrap myInfoModify">
				<form action="${contextPath}/member/modifySave" method="post">
					<table>
						<tr>
							<th><label for="id">아이디</label></th>
							<td><input type="text" name="userId" id="userId" value="${info.userId }" readonly></td>
						</tr>
						<tr>
							<th><label for="pwd">비밀번호</label></th>
							<td><input type="password" name="userPw" id="userPw" placeholder="새로운 비밀번호를 입력하세요" required></td>
						</tr>
						<tr>
							<th><label for="name">이름</label></th>
							<td><input type="text" name="userName" id="userName" placeholder="새로운 이름을 입력하세요" required></td>
						</tr>
						<tr>
				        	<th><label for="address">주소:</label></th>
				        	<td><input type="text" id="addr1" placeholder="우편번호" readonly name="userAddr" required> 
				        		<input type="button" class="btn btn-info" value="우편번호 찾기" onclick="daumPost()"><br>
								<input type="text" id="addr2" placeholder="주소" readonly required><br>
								<input type="text" id="addr3" placeholder="상세주소" required>
				        	</td>
				        <tr>
						<tr>
				        	<th><label for="phone">전화번호:</label></th>
				        	<td><input type="text" id="userPhone" name="userPhone" maxlength="11" pattern="01[0-9]{1}[0-9]{3,4}[0-9]{4}" placeholder="ex) 01012345678" required><br></td>
				        </tr>
						<tr>
				        	<th><label for="email">이메일:</label></th>
				        	<td> 
				        		<input type="email" id="userEmail" name="userEmail" pattern="^[^@]+@(\w+\.)+(com|net)$" placeholder="example@google.com" required>
							</td>
				        </tr>
						<tr>
							<th colspan="2">
								<button type="submit" class="larger-submit" id="save-btn">저장</button>
							</th>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
<c:import url="../default/footer.jsp" />
<script type="text/javascript">
	var selectBox = function(value) {
		$('#changeInput').val(value);
		}
</script>

<!-- Daum(카카오) 우편번호 API https://postcode.map.daum.net/guide#usage -->
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				function daumPost() {
					new daum.Postcode({
						oncomplete : function(data) {
							var addr = "";
							if (data.userSelectedType == 'R') {
								addr = data.roadAddress
							} else {
								addr = data.jibunAddress
							}
							$("#addr1").val(data.zonecode) // document.getElementById("addr1").value = data.zonecode;
							$("#addr2").val(addr)
							$("#addr3").focus()
						}
					}).open();
				}

				function register() {
					addr1 = $("#addr1").val()
					addr2 = $("#addr2").val()
					addr3 = $("#addr3").val()
					addr1 = addr1 + "/" + addr2 + "/" + addr3
					$("#addr1").val(addr1)
					register_form.submit()
				}

				function checkId() {
					var userId = $('#userId').val(); //useId값이 "userId"인 입력란의 값을 저장
					$
							.ajax({
								url : './idCheck', //Controller에서 요청 받을 주소
								type : 'post', //POST 방식으로 전달
								data : {
									userId : userId
								},
								success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
									if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
										$('.id_ok').css("display",
												"inline-block");
										$('.id_already').css("display", "none");
									} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
										$('.id_already').css("display",
												"inline-block");
										$('.id_ok').css("display", "none");
										alert("이미 존재하는 아이디입니다!");
										$('#userId').val('');
									}
								},
								error : function() {
									alert("에러입니다");
								}
							});
				};
				function checkIdAvailability() {
		            var userId = document.getElementById('userId').value;

		            if (userId === '') {
		                document.getElementById('id-message').innerText = '아이디를 입력해주세요.';
		                document.querySelector('.id_ok').style.display = 'none';
		                document.querySelector('.id_already').style.display = 'none';
		                return;
		            }

		            $.ajax({
		                url: './idCheck',
		                type: 'post',
		                data: {
		                    userId: userId
		                },
		                success: function (cnt) {
		                    if (cnt == 0) {
		                        $('.id_ok').css('display', 'inline-block');
		                        $('.id_already').css('display', 'none');
		                        $('#id-message').empty();
		                        alert('사용 가능한 아이디입니다!');
		                    } else {
		                        $('.id_already').css('display', 'inline-block');
		                        $('.id_ok').css('display', 'none');
		                        $('#id-message').text('이미 존재하는 아이디입니다.');
		                        document.getElementById('userId').value = '';
		                        alert('이미 존재하는 아이디입니다!');
		                    }
		                },
		                error: function () {
		                    alert('에러입니다.');
		                }
		            });
		        }

				$(function() {
					$("#userPw, #rePw").keyup(function() {
						var pw1 = $("#userPw").val();
						var pw2 = $("#rePw").val();

						if (pw1 != pw2) {
							$("#password-message").text("패스워드가 일치하지 않습니다");
						} else {
							$("#password-message").empty();
						}
					});
				});
				
				function register() {
				    // 필수 입력 필드 값을 가져옵니다.
				    var userId = document.getElementById("userId").value;
				    var userPw = document.getElementById("userPw").value;
				    var rePw = document.getElementById("rePw").value;
				    var userName = document.getElementsByName("userName")[0].value;
				    var userBirth = document.getElementsByName("userBirth")[0].value;
				    var userEmail = document.getElementById("email").value;
				    var userPhone = document.getElementsByName("userPhone")[0].value;
				    var userAddr = document.getElementsByName("userAddr")[0].value;

				    // 필수 입력 필드가 비어있는지 확인합니다.
				    if (
				      userId === "" ||
				      userPw === "" ||
				      rePw === "" ||
				      userName === "" ||
				      userBirth === "" ||
				      userEmail === "" ||
				      userPhone === "" ||
				      userAddr === ""
				    ) {
				      alert("회원 가입 정보를 모두 입력해주세요.");
				      return false;
					}
				
					// 중복체크 확인
					if (!isIdAvailable) {
				        alert('아이디 중복 체크를 해주세요.');
				        return false;
				    }
				}
		

				
			</script>
</body>
</html>
