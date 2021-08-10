<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>
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
		<section class="banner bg-info">
			<img id="bannerImage" src="/imgs/booking/banner1.jpg" alt="banner" width="1110px" height="500px">
		</section>
		<section class="reserve bg-primary d-flex">
			<section
				class="real-time-reserved col-4 d-flex justify-content-center align-items-center">
				<div class="display-4 text-white">
					실시간<br>예약하기
				</div>
			</section>
			<section class="confirm col-4">
				<div class="m-3">
					<span class="reserve-confirm mr-3">예약 확인</span> 
				</div>

				<div class="m-2">
					<div class="d-flex justify-content-end mr-3">
						<span class="text-white">이름:</span> <input type="text" id="name"
							class="form-control input-form">
					</div>
					<div class="d-flex mt-2 justify-content-end mr-3">
						<span class="text-white">전화번호:</span> <input type="text"
							id="phoneNumber" class="form-control input-form">
					</div>

					<div class="text-right mt-3">
						<button type="button" id="searchBtn" class="btn btn-success">조회 하기</button>
					</div>
				</div>
			</section>
			<section
				class="inquiry col-4 d-flex justify-content-center align-items-center">
				<div class="text-white">
					<h4 class="font-weight-bold">예약문의:</h4>
					<h1>
						010-<br>0000-1111
					</h1>
				</div>
			</section>
		</section>
		<jsp:include page="footer.jsp" />
	</div>

	<script>
		$(document).ready(function() {

			// 조회하기 버튼 클릭
			$('#searchBtn').on('click', function(e) {
				e.preventDefault();

				let name = $('#name').val().trim();
				if (name == '') {
					alert("이름을 입력해주세요");
					return;
				}

				let phoneNumber = $('#phoneNumber').val().trim();
				if (phoneNumber == '') {
					alert("전화번호를 입력해주세요");
					return;
				}
				// 전화번호가 010으로 시작하는지 확인
				//-- 첫번째 방법
				//var frontNumber = $('#phoneNumber').val().slice(0, 3);
				//alert(frontNumber);
				// if (frontNumber != '010') {
				//     alert("010으로 시작하는 번호만 입력 가능합니다.");
				//     return;
				// }
				//-- 두번째 방법
				if (phoneNumber.startsWith('010') === false) {
					alert("010으로 시작하는 번호만 입력 가능합니다.");
					return;
				}
				
				$.ajax({
					type: 'GET'
					, url: '/booking/main'
					, data: {
						'name':name
						, 'phoneNumber':phoneNumber}
					, success: function(data) {
						if (data.result == 'success') {
							if (data.booking != null) {
								alert("이름: " + data.booking.name + '\n'
									+ "날짜: " + data.booking.date.slice(0,10) + '\n'
									+ "일수: " + data.booking.day + '\n'
									+ "인원: " + data.booking.headcount + '\n'
									+ "상태: " + data.booking.state);
							} 
							else 
								alert("일치하는 예약자가 없습니다.");
						} 
						else 
							alert("관리자에게 문의해주세요.");
						
					}, error: function(e) {
						alert("error: " + e);
					}
				});
				
			});

			// 이미지 3초 간격으로 변경하기
			var bannerSrcArr = ['/imgs/booking/banner1.jpg', '/imgs/booking/banner2.jpg',
					'/imgs/booking/banner3.jpg', '/imgs/booking/banner4.jpg'];
			var currentIndex = 0;
			setInterval(function() {
				$('#bannerImage').attr('src',
						bannerSrcArr[currentIndex]);
				currentIndex++;

				if (currentIndex > bannerSrcArr.length) { // 인덱스 값이 배열의 크기를 넘으면 0으로(처음 이미지) 세팅
					currentIndex = 0;
				}
			}, 3000); // 3초에 한번씩 함수 실행

		});
	</script>
</body>
</html>