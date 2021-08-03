<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의 민족</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/css/lesson05/store_Style.css">
</head>
<body>
	<div id="wrap" class="container">
		<jsp:include page="header.jsp" />
		<h2>${storeName} - 리뷰</h2>
		
		<c:choose>
			<c:when test="${empty newReviewList}">
				<div>작성된 리뷰가 없습니다.</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="newReview" items="${newReviewList}" varStatus="status">
				<div class="box-theme p-2 mb-3">
					<b>${newReview.userName}</b>
					<small>
					<c:set var="pointCnt" value="${newReview.point / 1}" />
					<c:set var="pointCntRemain" value="${newReview.point % 1}" />
					<c:forEach var="pointStar" begin="0" end="${pointCnt - 1}" step="1">
						<img src="/imgs/star_fill.PNG" width="15px" class="mb-1">
					</c:forEach>
					<c:if test="${pointCntRemain ne 0}">
						<img src="/imgs/star_half.PNG" width="15px" class="mb-1">
						<c:set var="pointCnt" value="${pointCnt + 1}" />
					</c:if>
					<c:if test="${pointCnt < 5}">
						<c:forEach var="pointStar" begin="0" end="${5 - pointCnt - 1}" step="1">
							<img src="/imgs/star_empty.PNG" width="15px" class="mb-1">
						</c:forEach>
					</c:if>
					</small>
					<div class="mb-2">
						<small class="text-secondary">
						<fmt:formatDate value="${newReview.updatedAt}" pattern="yyyy년 M월 d일" />
						</small>
					</div>
					<div class="mb-2">${newReview.review}</div>
					<div>
					<span class="bg-menu">${newReview.menu}</span>
					</div>
				</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>