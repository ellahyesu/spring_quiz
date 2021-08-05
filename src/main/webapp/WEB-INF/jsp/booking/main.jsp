<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>
<!-- jquery : bootstrap, datepicker -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<!-- datepicker-->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css"
	href="/css/booking/booking_style.css">
</head>
<body>
	<div id="wrap" class="container">

		<jsp:include page="header.jsp" />
		<jsp:include page="menu.jsp" />
		<section class="banner bg-info">
			<img id="bannerImage" src="/css/booking/banner1.jpg" alt="banner"
				width="1110px" height="500px">
		</section>
		<section class="reserve bg-primary d-flex">
			<section
				class="real-time-reserved col-4 d-flex justify-content-center align-items-center">
				<div class="display-4 text-white">
					실시간<br>예약하기
				</div>
			</section>
			<section class="confirm col-4">
				<!-- 예약 확인, 회원 비회원 라디오 버튼 -->
				<div class="m-3">
					<span class="reserve-confirm mr-3">예약 확인</span> <label for="member"
						class="mr-3"> <span class="text-white">회원</span> <input
						type="radio" id="member" name="member" value="member"
						checked="checked">
					</label> <label for="nonMember"> <span class="text-white">비회원</span>
						<input type="radio" id="nonMember" name="member" value="nonMember">
					</label>
				</div>

				<!-- 아이디 비밀번호(회원용)-->
				<div id="memberInputBox" class="m-2">
					<div class="d-flex justify-content-end mr-3">
						<span class="text-white">아이디:</span> <input type="text" id="id"
							class="form-control input-form">
					</div>
					<div class="d-flex mt-2 justify-content-end mr-3">
						<span class="text-white">비밀번호:</span> <input type="password"
							id="password" class="form-control input-form">
					</div>

					<!-- 버튼 -->
					<div class="text-right mt-3">
						<button type="button" class="btn btn-success submit-btn">조회
							하기</button>
					</div>
				</div>

				<!-- 아이디 비밀번호(비회원용)-->
				<div id="nonMemberInputBox" class="m-2 d-none">
					<div class="d-flex justify-content-end mr-3">
						<span class="text-white">이름:</span> <input type="text" id="name"
							class="form-control input-form">
					</div>
					<div class="d-flex mt-2 justify-content-end mr-3">
						<span class="text-white">전화번호:</span> <input type="text"
							id="phoneNumber" class="form-control input-form">
					</div>
					<div class="d-flex mt-2 justify-content-end mr-3">
						<span class="text-white">날짜:</span> <input type="text"
							id="reserveDateText" class="form-control input-form">
					</div>

					<!-- 버튼 -->
					<div class="text-right mt-3">
						<button type="button" class="btn btn-success submit-btn">조회
							하기</button>
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
			// 2-1. 회원/비회원 선택시 인풋폼 내용 바뀌도록 설정
			$('input[name=member]').change(function() {
				//alert($(this).val());
				var radioValue = $(this).val();
				if (radioValue == 'member') {
					$('#memberInputBox').removeClass("d-none");
					$('#nonMemberInputBox').addClass("d-none");
				} else {
					$('#nonMemberInputBox').removeClass("d-none");
					$('#memberInputBox').addClass("d-none");
				}
			});

			// 2-2. 날짜 영역 datePicker로 선택하기
			$('#reserveDateText').datepicker({
				dateFormat : "yy년 mm월 dd일" // 2021년 00월 00일
				,
				minDate : 0
			// 오늘 날짜 이후로 선택
			});

			// 조회하기 버튼 클릭
			$('.submit-btn').on('click', function(e) {
				e.preventDefault();

				var memberRadioValue = $(
						'input:radio[name=member]:checked')
						.val(); // 라디오 버튼 중 선택된 value
				console.log(memberRadioValue); // member or nonMember

				if (memberRadioValue == 'member') {
					// 회원 validation
					if ($('#id').val().trim() == '') {
						alert("아이디를 입력하세요");
						return;
					}

					if ($('#password').val() == '') {
						alert("비밀번호를 입력하세요");
						return;
					}
				} else {
					// 비회원 validation
					if ($('#name').val().trim() == '') {
						alert("이름을 입력하세요");
						return;
					}

					if ($('#phoneNumber').val().trim() == '') {
						alert("전화번호를 입력하세요");
						return;
					}

					if ($('#reserveDateText').val() == '') {
						alert("날짜를 선택해주세요");
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
					if ($('#phoneNumber').val().startsWith(
							'010') === false) {
						alert("010으로 시작하는 번호만 입력 가능합니다.");
						return;
					}
				}
			});

			// 이미지 3초 간격으로 변경하기
			var bannerSrcArr = ['banner1.jpg', 'banner2.jpg',
					'banner3.jpg', 'banner4.jpg'];
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