<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Join</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
body {
	background-color: #f9f9f9;
}

h1 {
	width: 850px;
	margin: 20px auto;
	padding: 30px 15px 5px;
	font-weight: bold;
}

a {
	color: black;
	text-decoration: none;
	display: inline-block;
}

a:hover {
	color: black;
}

form {
	width: 850px;
	margin: 20px auto;
	padding: 10px;
	font-size: small;
}

table {
	width: 100%;
	border-top: 0.5px solid lightgrey;
}

th {
	border-bottom: 0.5px solid lightgrey;
	padding: 10px;
}

td {
	border-bottom: 0.5px solid lightgrey;
	padding: 10px;
	border-left: 0.5px solid lightgrey;
}

td:first-child {
	border-left: none;
}

#b_year {
	width: 100px;
}

#b_month, #b_date {
	width: 50px;
}

#id_check_btn, #zip_search_btn {
	border: 1px solid grey;
	background-color: white;
	font-size: small;
	border-radius: 3px;
}

#zip_code {
	margin-top: 2px;
	margin-bottom: 2px;
	margin-right: 2px;
}

#address, #detail_addr {
	width: 325px;
	margin-top: 2px;
	margin-bottom: 2px;
	margin-right: 2px;
}

.bottom_btn {
	margin: 30px auto;
	text-align: center;
}

#agreement {
	width: 100%;
}

footer {
	background-color: lightgrey;
	padding: 30px 50px 50px;
	margin-top: 100px;
	line-height: 2rem;
}
</style>
<script>
	var pwd_req = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=])(?=.*[0-9]).{8,24}$/;
	var id_clicked = 0;
	
	function change_domain() {
		var s_index = e_d_select.options.selectedIndex;
		var s_val = e_d_select.options[s_index];
		eDomain.value = s_val.value;

	}
	function zip_search() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = '';
				var extraAddr = '';
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("addr1").value = extraAddr;

				} else {
					document.getElementById("addr1").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById("addr1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("addr2").focus();
			}
		}).open();
	}
	function history_back() {
		history.back();
	}
	function create_account() {
		if (id.value == '') {
			alert('아이디를 입력하세요.');
			id.focus();
		} else if (pwd.value == '') {
			alert('비밀번호를 입력하세요.');
			pwd.focus();
		} else if (!pwd_req.test(pwd.value)) {
			alert('비밀번호는 영문 대소문자/숫자/특수문자 조합(8~24자)입니다.');
			pwd.focus;
		} else if (pwd_c.value == '') {
			alert('비밀번호를 한 번 더 입력하세요.');
			pwd_c.focus();
		} else if (pwd.value != pwd_c.value) {
			alert('비밀번호 확인이 비밀번호와 다릅니다.');
			pwd_c.focus;
		} else if (name.value == '') {
			alert('이름을 입력하세요.');
			name.focus();
		} else if (phone.value == '') {
			alert('전화번호를 입력하세요.');
			phone.focus();
		}
		else if ($("input:checkbox[id=agree]").is(":checked") == false) {
			alert("회원 가입을 위해 약관동의가 필요합니다.")
		} else if (id_clicked == 0) {
			alert("아이디 중복확인이 필요합니다.")
		} else {
			document.join_member.submit();
		}
	}

	function id_check() {
		var id = $("#id").val();
		if (id == "") {
			alert("아이디를 입력하세요.");
			return;
		}
		$.ajax({
			type : "POST",
			async : true,
			url : "${contextPath}/member/overlapped.do",
			dataType : "text",
			data : {id: id},
			success : function(data, textStatus) {
				if (data == 'false') {
					alert("사용할 수 있는 아이디입니다.");
					
					id_clicked++;
				} else {
					alert("이미 존재하는 아이디입니다.");
				}
			},
			error : function(data, textStatus) {
				alert("오류가 발생했습니다.");
			},
			complete : function(data, textStatus) {
				alert("아이디 중복확인 완료");
			}
		});
	}
</script>
</head>
<body>
	<h1>
		<a href="${contextPath}/main.do">Grey Sky</a>
	</h1>
	<div>
		<form name="join_member"
			action="${pageContext.request.contextPath}/member/join.do"
			method="post">
			* 표시는 필수 입력 항목입니다.
			<table>
				<tbody>
					<tr>
						<th>아이디 *</th>
						<td><input type="text" name="id" id="id"> 
						<input
							type="button" id="id_check_btn" onclick="id_check()" value="중복확인"></input>

						</td>
					</tr>
					<tr>
						<th>비밀번호 *</th>
						<td><input type="password" name="pwd" id="pwd">
							영문자/숫자/특수문자의 조합 (8~24자)</td>
					</tr>
					<tr>
						<th>비밀번호 확인 *</th>
						<td><input type="password" name="pwd_c"
							id="pwd_c"></td>
					</tr>
					<tr>
						<th>이름 *</th>
						<td><input type="text" name="name" id="name"></td>
					</tr>
					<tr>
						<th>전화번호 *</th>
						<td><input type="text" name="phone" id="phone"
							placeholder="-없이 숫자만 입력"></td>
					</tr>
					<tr>
						<th>이메일 *</th>
						<td><input type="text" name="email" id="email"> @ <input
							type="text" name="eDomain" id="eDomain"> <select
							name="eDomain_select" id="e_d_select" onchange="change_domain()">
								<option value="">직접 입력</option>
								<option value="gmail.com">gmail.com</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
						</select></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="zipcode" id="zipcode">
							<button type="button" id="zip_search_btn" onclick="zip_search()">우편번호</button>
							<br> <input type="text" name="addr1" id="addr1">기본주소<br>
							<input type="text" name="addr2" id="addr2">상세주소</td>
					</tr>
					<tr>
						<th>약관 동의 *</th>
						<td><input type="checkBox" name="agree" id="agree">
							이용약관 및 개인정보수집 및 이용, 정보 수신에 모두 동의합니다.</td>
					</tr>
				</tbody>
			</table>

			<div class="bottom_btn">
				<input type="button" class="btn btn-outline-dark"
					onclick="history_back()" value="뒤로가기"> <input type="button"
					class="btn btn-dark" onclick="create_account()" value="가입하기">
			</div>
		</form>
	</div>


</body>
</html>