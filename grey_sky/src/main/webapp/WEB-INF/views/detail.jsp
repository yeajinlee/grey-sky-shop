<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Detail</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/detail.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	function go_cart() {
		alert('해댱 상품은 현재 품절이므로 장바구니에 담을 수 없습니다.');
	}
	function go_order() {
		alert('해당 상품은 현재 품절이므로 주문하실 수 없습니다.');
	}
</script>
</head>
<body>
	<table style="table-layout: fixed; text-align: center;">
		<tr>
			<td><img
				src="${pageContext.request.contextPath}/resources/image/jerry-zhang-ePpaQC2c1xA-unsplash.jpg" style="width:500px; height:400px; margin: 15px 70px 15px 30px;"></td>
			<td class="info">
				<p class="p_name">
					<b>Mountain Postcard</b>
				</p> 가격: 5000원<br>뒷면 색상: black, white<br>크기: 15cm X 10cm <br>
				<br> 수량 &nbsp;<input type="number" min="1" max="10" id="cnt"
				disabled><br> 색상 &nbsp; <select name="p_color"
				id="p_color">
					<option value="black">black - 품절</option>
					<option value="white">white - 품절</option>
			</select> <br>
			<br> <input type="button" class=btn id="cart" value="장바구니"
				onclick="go_cart()" style="cursor: pointer;">
				<input type="button" class=btn
				id="order" value="바로주문" onclick="go_order()" style="cursor: pointer;">
			</td>
		</tr>
	</table>
	<div class="detail">
		<h2>Detail</h2>
		<p>유명 사진작가의 산 사진 3종이 프린팅된 엽서세트 (3장이 한세트입니다.)</p>
	</div>
	<div>
		<h2>Review</h2>
		<p>
		<table align="center"  width="70%">
			<tr height="10" align="center" bgcolor="lightgrey">
				<td>글번호</td>
				<td>작성자</td>
				<td>평가</td>
				<td>글내용</td>
				<td>작성일</td>
			</tr>
			<c:choose>
				<c:when test="${empty reviewList}">
					<tr height="10">
						<td colspan="5">
							<p align="center">
								<b>등록된 후기가 없습니다.</b>
							</p>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="review" items="${reviewList }" varStatus="reviewNO">
						<tr align="center">
							<td width="3%">${reviewNO.count }</td>
							<td width="5%">${review.id }</td>
							<td width="5%">${review.star } / 5</td>
							<td width="35%" align="left"><a class='cls1'
								href="${pageContext.request.contextPath}/review/reviewView.do?reviewNO=${review.reviewNO }">
									${review.content } </a></td>
							<td width="10%"><fmt:formatDate value="${review.postDate}" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="5"><input type="button" value="후기 등록" class="btn" style="cursor: pointer; margin-top: 20px;"></td>
			</tr>
		</table>
		</p>
	</div>
</body>
</html>