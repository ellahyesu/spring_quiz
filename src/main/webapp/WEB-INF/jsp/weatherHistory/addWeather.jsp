<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력</title>
<!-- jquery : bootstrap, datepicker -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- datepicker-->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="/css/lesson05/weatherhistory_Style.css">
</head>
<body>
	<div id="wrap">
		
		<section class="contents d-flex">
		
			<jsp:include page="menu.jsp" />
			
			<section class="container col-10 m-3">
				<h2>날씨 입력</h2>
				
				<form method="post" action="/weatherHistory/add_weather">
					
					<div class="d-flex mt-5 mb-3">
						<div class="d-flex align-items-center justify-content-center text-center col-4">
							<label for="date" class="col-4">날짜</label>
							<input type="text" id="selectDate" name="date" class="form-control">
						</div>
						<div class="d-flex align-items-center justify-content-center text-center col-4">
							<label for="weather" class="col-4">날씨</label>
							<select id="weather" name="weather" class="form-control">
								<option>비</option>
								<option>흐림</option>
								<option>맑음</option>
								<option>구름조금</option>
							</select>
						</div>
						<div class="d-flex align-items-center justify-content-center text-center col-4">
							<label for="microDust" class="col-4">미세먼지</label>
							<select id="microDust" name="microDust" class="form-control">
								<option>좋음</option>
								<option>보통</option>
								<option>나쁨</option>
								<option>최악</option>
							</select>
						</div>					
					</div>

					<div class="d-flex mb-5">
						<div class="d-flex col-4">
							<label for="temperatures" class="d-flex align-items-center justify-content-center text-center col-4">기온</label>
							<div class="input-group">
							 	<input type="text" name="temperatures" class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">ºC</span>
								</div>
							</div>
						</div>
						<div class="d-flex col-4">
							<div class="d-flex align-items-center justify-content-center text-center col-4">강수량</div>
							<div class="input-group">
							 	<input type="text" name="precipitation" class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">mm</span>
								</div>
							</div>
						</div>
						<div class="d-flex col-4">
							<div class="d-flex align-items-center justify-content-center text-center col-4">풍속</div>
							
							<div class="input-group">
							 	<input type="text" name="windSpeed" class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">km/h</span>
								</div>
							</div>
						</div>
					</div>
					
					<div class="d-flex justify-content-center">
                		<button type="submit" class="btn btn-success col-1">저장</button>
                	</div>
				</form>
			</section>
		</section>
		
		<jsp:include page="footer.jsp" />
		
	</div>
	
	<script>
		$(document).ready(function() {
			$('#selectDate').datepicker({
				showButtonPanel: true
				, minDate: 0
				, dateFormat: 'yy-mm-dd'
				, changeMonth: true // 월 선택 셀렉트
				, changeYear: true // 년도 선택 셀렉트
			});
		});
	</script>
</body>
</html>