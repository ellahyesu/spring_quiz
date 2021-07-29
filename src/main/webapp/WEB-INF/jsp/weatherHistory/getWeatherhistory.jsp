<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/css/lesson05/weatherhistory_Style.css">
</head>
<body>
	<div id="wrap">
		
		<section class="contents d-flex">
		
			<jsp:include page="menu.jsp" />
		
			<section class="container col-10 m-3">
				<h2>과거 날씨</h2>
				<table class="table text-center mt-3">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${weatherhistory}">
						<tr>
							<td><fmt:formatDate value="${item.date}" pattern="yyyy년 M월 d일" /></td>
							<c:choose>
								<c:when test="${item.weather eq '비'}">
									<td><img src="/imgs/rainy.jpg"></td>
								</c:when>
								<c:when test="${item.weather eq '흐림'}">
									<td><img src="/imgs/cloudy.jpg"></td>
								</c:when>
								<c:when test="${item.weather eq '맑음'}">
									<td><img src="/imgs/sunny.jpg"></td>
								</c:when>
								<c:when test="${item.weather eq '구름조금'}">
									<td><img src="/imgs/partlyCloudy.jpg"></td>
								</c:when>
							</c:choose>
							<td>${item.temperatures}ºC</td>
							<td>${item.precipitation}mm</td>
							<td>${item.microDust}</td>
							<td>${item.windSpeed}km/h</td>						
						</tr>
						</c:forEach>
					</tbody>			
				</table>
			</section>
		</section>
		
		<jsp:include page="footer.jsp" />
		
	</div>
</body>
</html>