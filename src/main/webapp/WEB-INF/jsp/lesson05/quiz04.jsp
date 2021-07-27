<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 리스트</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>회원 정보 리스트</h1>

		<table class="table">
			<thead class="text-center">
				<tr>
					<th>No</th>
					<th>이름</th>
					<th>전화 번호</th>
					<th>국적</th>
					<th>이메일</th>
					<th>자기소개</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${members}" varStatus="status">
					<tr>
						<td class="text-center">${status.count}</td>
						<td class="text-center">${member.name}</td>
						<c:set var="phoneNumber" value="${member.phoneNumber}" />
						<c:choose>
							<c:when test="${fn:startsWith(phoneNumber, '010-')}">
								<td class="text-center">${member.phoneNumber}</td>
							</c:when>
							<c:otherwise>
								<td class="text-center">유효하지 않은 전화번호</td>
							</c:otherwise>
						</c:choose>
						<c:set var="nationality" value="${member.nationality}" />
						<td class="text-center">
							${fn:replace(nationality, '삼국시대', '삼국 - ')}
						</td> 
						<c:set var="email" value="${member.email}" />
						<td class="text-center">
							<b>${fn:split(email, '@')[0]}</b>@${fn:split(email, '@')[1]}
						</td>
						<c:set var="introduce" value="${member.introduce}" />
						<c:choose>
							<c:when test="${fn:length(introduce) > 15}">
								<td>${fn:substring(introduce, 0, 15)}...</td>
							</c:when>
							<c:otherwise>
								<td>${fn:substring(introduce, 0, 15)}</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>