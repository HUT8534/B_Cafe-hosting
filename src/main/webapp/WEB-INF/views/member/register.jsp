<!-- member/register.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register.jsp</title>
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

.info {
	display: flex;
	justify-content: center;
}

table {
	width: 800px;
	height: 600px;
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

input {
	height: 20px;
}

input[type=button], input[type=submit], input[type=reset] {
	height: 45px;
	font-size: 16px;
	color: black;
}

.id_ok {
	color: #008000;
	display: none;
	font-weight: bold;
	font-size: 15px;
}

.id_already {
	color: red;
	display: none;
	font-weight: bold;
	font-size: 15px;
}
.phone_ok {
	color: #008000;
	display: none;
	font-weight: bold;
	font-size: 15px;
}

.phone_already {
	color: red;
	display: none;
	font-weight: bold;
	font-size: 15px;
}
small {
	color: red;
	font-weight: bold;
}

.larger-submit {
	padding: 10px 20px; /* 원하는 패딩 값으로 조정 */
	font-size: 16px; /* 원하는 폰트 크기로 조정 */
}

.larger-reset {
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
		<div class="sub-visual"
			style="background-image: url('${contextPath}/resources/imageFile/banner5.png')">
			<div class="sub-visual__wrapper container">
				<h1 class="sub-visual__title wow fadeInDown" style="visibility: visible; animation-name: fadeInDown;">회 원 가 입</h1>
				<p class="sub-visual__txt wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">THE BLACK의 회원가입 페이지입니다</p>
			</div>
		</div>

		<!-- 중간 부분 -->
		<div class="sub-nav sub-nav--bar">
			<ul class="sub-nav__wrap sub-nav-clone--depth2">
				<!-- active 된 메뉴의 depth2 clone 하기 -->
				<li class="item">
				<a href="${contextPath }/member/login" class="link on">로그인</a>
				<a href="${contextPath }/member/register" class="link on">회원 가입</a>
				<a href="${contextPath }/member/findIdPw" class="link on">정보 찾기</a>
				</li>
			</ul>
		</div>
		<br><br>
		<!-- 로그인 입력 부분 -->
		<div class="sub-con">
			<div class="wrap info">
				<form name="registerForm" action="join" method="post">
			        <table>
				        <tr>
				        	<th><label for="userId">아이디:</label></th>
				        	<td><input type="text" id="userId" name="userId" required>
								<!-- id ajax 중복체크 --> 
								<span class="id_ok">사용 가능</span> 
								<!-- <span class="id_already">사용불가능</span> -->
								<small id="id-message" class="form-text text-danger"></small>
								<button type="button" onclick="checkIdAvailability()">중복 체크</button>
							</td>
				        </tr>
						<tr>
							<th><label for="password">비밀번호:</label></th>
							<td><input type="password" id="userPw" name="userPw" required><br></td>
						</tr>
				        <tr>
				        	<th><label for="confirmPassword">비밀번호 확인:</label></th>
				        	<td><input type="password" id="rePw" name="rePw" required>
				        		<small id="password-message" class="form-text text-danger"></small>
				        	</td>
				        </tr>
				        <tr>
				        	<th><label for="name">이름:</label></th>
				        	<td><input type="text" id="userName" name="userName" required><br></td>
				        </tr>
				        <tr>
				        	<th><label for="birthDate">생년월일:</label></th>
				        	<td>
				        		<input type="text" id="userBirth" name="userBirth" maxlength="8" 
				        		pattern="^(19[0-9]{2}|20[0-9]{2})(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$" placeholder="ex) 19990101" required><br>
				        	</td>
				        </tr>
				        <tr>
				        	<th><label for="email">이메일:</label></th>
				        	<td> 
				        		<input type="email" id="userEmail" name="userEmail" pattern="^[^@]+@(\w+\.)+(com|net)$" placeholder="example@google.com" required>
				        		<!-- <input type="text" name="domain" size="10" id="changeInput">
								<select name="domainSelect" onchange="selectBox(this.value);">
									<option value="" style="color: gray;">도메인을 선택하세요 > </option>
									<option value="@naver.com">Naver</option>
									<option value="@gmail.com">Gmail</option>
									<option value="@daum.net">Daum</option>
								</select> -->
							</td>
				        </tr>
				        <tr>
				        	<th><label for="phone">전화번호:</label></th>
				        	<td><input type="text" id="userPhone" name="userPhone" maxlength="11" pattern="01[0-9]{1}[0-9]{3,4}[0-9]{4}" placeholder="ex) 01012345678" required>
				        		<!-- <span class="id_already">사용불가능</span> -->
								<span class="phone_ok">사용 가능</span> 
								<small id="phone-message" class="form-text text-danger"></small>
								<button type="button" onclick="checkPhoneAvailability()">중복 체크</button>
				        	</td>
				        </tr>
				        <tr>
				        	<th><label for="address">주소:</label></th>
				        	<td><input type="text" id="addr1" placeholder="우편번호" readonly name="userAddr" required> 
				        		<input type="button" class="btn btn-info" value="우편번호 찾기" onclick="daumPost()"><br>
								<input type="text" id="addr2" placeholder="주소" readonly required><br>
								<input type="text" id="addr3" placeholder="상세주소" required>
				        	</td>
				        <tr>
							<th class="title" colspan="2">
								<input type="submit" class="larger-submit" value="회원가입" onclick="register()"> &nbsp; 
								<input type="reset" class="larger-reset" value="다시작성"> &nbsp;
							</th>
						</tr>
				    </table>

			    </form>
			</div>
		</div>
	</div>
<!-- jquery  -->
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
				
				function checkPhoneAvailability() {
		            var userPhone = document.getElementById('userPhone').value;

		            if (userPhone === '') {
		                document.getElementById('phone-message').innerText = '전화번호를 입력해주세요.';
		                document.querySelector('.phone_ok').style.display = 'none';
		                document.querySelector('.phone_already').style.display = 'none';
		                return;
		            }

		            $.ajax({
		                url: './phoneCheck',
		                type: 'post',
		                data: {
		                    userPhone: userPhone
		                },
		                success: function (cnt) {
		                    if (cnt == 0) {
		                        $('.phone_ok').css('display', 'inline-block');
		                        $('.phone_already').css('display', 'none');
		                        $('#phone-message').empty();
		                        alert('사용 가능한 번호입니다!');
		                    } else {
		                        $('.phone_already').css('display', 'inline-block');
		                        $('.phone_ok').css('display', 'none');
		                        $('#phone-message').text('이미 존재하는 번호입니다.');
		                        document.getElementById('userPhone').value = '';
		                        alert('이미 존재하는 번호입니다!');
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
			<c:import url="../default/footer.jsp" />
</body>
</html>