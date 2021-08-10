<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션 - 예약 하기</title>
<%-- bootstrap CDN link --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<%-- datepicker --%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
<link rel="stylesheet" type="text/css" href="/css/booking/booking_style.css">
</head>
<body>
<div id="wrap" class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="menu.jsp" />
		
		<section>
			<h1 class="text-center mt-3">예약 하기</h1>

			<div class="mb-2 col-5 p-0"><b>이름</b></div>
			<input type="text" id="name" class="form-control mb-2 col-5">
			
			<div class="mb-2 col-5 p-0"><b>숙박날짜</b></div>
			<input type="text" id="date" class="form-control mb-2 col-5">

			<div class="mb-2 col-5 p-0"><b>숙박일수</b></div>
			<input type="text" id="day" class="form-control mb-2 col-5">
			
			<div class="mb-2 col-5 p-0"><b>숙박인원</b></div>
			<input type="text" id="headcount" class="form-control mb-2 col-5">
			
			<div class="mb-2 col-5 p-0"><b>전화번호</b></div>
			<input type="text" id="phoneNumber" class="form-control mb-2 col-5">

			<button type="button" id="addBtn" class="btn btn-success w-100 mt-3 col-5">예약하기</button>
		</section>
		
		<jsp:include page="footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			
			$('#date').datepicker({
				dateFormat : "yy-mm-dd" // 2021-12-25
				, minDate : 0 // 오늘 날짜 이후로 선택
			});
			
			$('#addBtn').on('click', function(e) {
				
				let name = $('#name').val().trim();
				if (name == '') {
					alert("이름을 입력해주세요");
					return;
				}
				
				let date = $('#date').val().trim();
				if (date == '') {
					alert("날짜를 입력해주세요");
					return;
				}
				
				let day = $('#day').val().trim();
				if (day == '') {
					alert("숙박일수를 입력해주세요");
					return;
				}
				
				let headcount = $('#headcount').val().trim();
				if (headcount == '') {
					alert("숙박인원을 입력해주세요");
					return;
				}
				
				let phoneNumber = $('#phoneNumber').val().trim();
				if (phoneNumber == '') {
					alert("전화번호를 입력해주세요");
					return;
				}
				
				if (phoneNumber.startsWith('010') === false) {
					alert("010으로 시작하는 번호만 입력 가능합니다.");
					return;
				}
				
				$.ajax({
					type: 'POST' // request method (insert의 경우 보통 post를 씀)
					, url: '/booking/add_booking'
					, data: {
						'name':name
						, 'headcount':headcount
						, 'day':day
						, 'date':date
						, 'phoneNumber':phoneNumber}
					, success: function(data) {
						if (data == 'success') {
							// alert("data: " + data);
							location.href="/booking/booking_list_view";
						}
						else 
							alert("관리자에게 문의해주세요.");
						//alert("data: " + data);
					}, error: function(e) {
						alert("error: " + e);
					}
				});
				
			});
			
			
			
		});
	</script>
</body>
</html>