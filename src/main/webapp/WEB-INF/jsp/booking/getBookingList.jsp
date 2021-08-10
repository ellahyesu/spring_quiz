<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션 - 예약 목록</title>
<!-- jquery : bootstrap, datepicker -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- datepicker-->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="/css/booking/booking_style.css">
</head>
<body>
	<div id="wrap" class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="menu.jsp" />
		
		<section>
			<h1 class="text-center mt-3">예약 목록 보기</h1>
		
			<table class="table mt-3 text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="booking" items="${bookingList}">
					<tr>
						<td>${booking.name}</td>
						<td><fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 d일" /></td>
						<td>${booking.day}</td>
						<td>${booking.headcount}</td>
						<td>${booking.phoneNumber}</td>
						<td>
							<c:choose>
								<c:when test="${booking.state eq '대기중'}">
									<span class="text-info">대기중</span>
								</c:when>
								<c:when test="${booking.state eq '확정'}">
									<span class="text-success">확정</span>
								</c:when>
								<c:when test="${booking.state eq '취소'}">
									<span class="text-danger">취소</span>
								</c:when>
							</c:choose>
						</td>
						<td>
							<button type="button" class="delete-btn btn btn-danger" data-booking-id="${booking.id}">삭제</button>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
		
		<jsp:include page="footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			
			// data를 이용해서 태그에 data를 임시 저장해놓기
			$('.delete-btn').on('click', function() {
				let id = $(this).data('booking-id');
				// alert(id);
				
				$.ajax({
					//type: 'POST' // 남의 id로 잘못들어가서 삭제하면 안되기 때문에 GET으로 하면 안됨.
					type: 'delete' // post와 비슷함
					, data: {'id': id}
					, url: '/booking/delete_booking_by_id'
					, success: function(data) {
						// alert("성공: " + data);
						if (data == 'success')
							location.reload(); // 새로고침
						else 
							alert("서버에서 삭제 처리를 하지 못했습니다. 관리자에게 문의해주세요.");
					}, error: function(e) {
						alert("error: " + e);
					}
				});
			});
			
		});
	</script>
</body>
</html>