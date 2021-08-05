<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨 찾기 목록</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 목록</h1>
	
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="favorite" items="${favoriteList}">
				<tr>
					<td>${favorite.id}</td>
					<td>${favorite.name}</td>
					<td><a href="${favorite.url}">${favorite.url}</a></td>
					<td>
						<%-- 방법(1) name속성과 value속성을 이용해서 동적으로 삭제버튼 감지
						<button type="button" name="delBtn" class="btn btn-danger" value="${favorite.id}">
							삭제
						</button>
						--%>
						
						<%-- 방법(2) data를 이용해서 태그에 data를 임시 저장해놓기 --%>
						<button type="button" class="favorite-btn btn btn-danger" data-favorite-id="${favorite.id}">
							삭제
						</button>	

					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script>
		$(document).ready(function() {
			// 방법(1) name속성과 value속성을 이용해서 동적으로 삭제버튼 감지
			/* $('td').on('click', 'button[name=delBtn]',function() {
				let id = $(this).attr('value');
			}); */
			
			// 방법(2) data를 이용해서 태그에 data를 임시 저장해놓기
			// 태그: data-favorite-id      data- 그 뒤부턴 우리가 이름을 정한다.
			// 스크립트: $(this).data('favorite-id');
			$('.favorite-btn').on('click', function() {
				// 많은 버튼들 중 지금 클릭된 하나를 this로 가져온다
				let favoriteId = $(this).data('favorite-id');
				// alert(favoriteId);
				
				$.ajax({
					type: 'POST' // 남의 id로 잘못들어가서 삭제하면 안되기 때문에 GET으로 하면 안됨.
					, data: {'favorite_id': favoriteId}
					, url: '/lesson06/quiz02/delete_favorite_by_id'
					, success: function(data) {
						alert("성공: " + data);
						
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