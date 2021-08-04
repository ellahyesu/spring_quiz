<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨 찾기 추가</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		
		<label for="name" class="mb-2">제목</label>
		<input type="text" id="name" class="form-control mb-2">
		
		<label for="url" class="mb-2">URL 주소</label>
		<div class="d-flex mb-3">
			<input type="text" id="url" class="form-control mr-3">	
			<button type="button" id="urlCheckBtn" class="btn btn-info">중복확인</button>
		</div>
		<div id="statusArea"></div>
		
		<button type="button" id="addBtn" class="btn btn-success w-100">추가</button>
	</div>
	
	<script>
		$(document).ready(function() {

			$('#urlCheckBtn').on('click', function() {

				let url = $('#url').val().trim();
				if (url == '') {
					alert("주소를 입력해주세요");
					return;
				}
				
				if (url.startsWith('http://') == false && url.startsWith('https://') == false) {
					alert("주소를 다시 확인해주세요");
					return;
				}
				$('#statusArea').empty();
				
				$.ajax({
					type: 'GET' // request method 
					, url: "/lesson06/quiz01/is_duplication"
					, data: {'url':url}
					, success: function(data) {
						alert("data: " + data.isDuplication);
						if (data.isDuplication) {
							$('#statusArea').append('<small class="text-danger">중복된 url 입니다</small>');
						} else {
							$('#statusArea').append('<small class="text-success">저장 가능한 url 입니다</small>');
						}
					}, error: function(e) {
						alert("error: " + e);
					}
				});
			});
			
			$('#addBtn').on('click', function(e) {
				//validation check
				let name = $('#name').val().trim();
				let url = $('#url').val().trim();
				
				if (name == '') {
					alert("제목을 입력해주세요");
					return;
				}
				
				if (url == '') {
					alert("주소를 입력해주세요");
					return;
				}
				
				if (url.startsWith('http://') == false && url.startsWith('https://') == false) {
					alert("주소를 다시 확인해주세요");
					return;
				}

				$.ajax({
					type: 'POST' // request method (insert의 경우 보통 post를 씀)
					, url: "/lesson06/quiz01/add_new_site"
					, data: {'name':name, 'url':url}
					, dataType: 'json' // response body - AJAX 통신 후 response로는 String 또는 JSON이 리턴되어야 한다.
					, success: function(data) {
						
						//alert("data: " + data.result);
						
						location.href="/lesson06/quiz01/get_site";
					}, error: function(e) {
						alert("error: " + e);
					}
				});
				
			});
		});
	</script>
</body>
</html>