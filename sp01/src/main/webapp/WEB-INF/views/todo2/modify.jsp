<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>MOdify Page</h1>
	
	<form id="modForm" method="post">
		<div>
			Tno <input type="text" name="tno" readonly="readonly"
				value="${todo.tno}">
		</div>
		<div>
			Title <input type="text" name="title" value="${todo.title}">
		</div>
		<div>
			Writer <input type="text" name="writer"	value="${todo.writer}">
		</div>
		<div>
			<button class="btn" data-oper="del">삭제</button>
			<button class="btn" data-oper="mod">수정</button>
			<button class="btn" data-oper="li">리스트</button>
		</div>
		<input type="hidden" name="page" value="${cri.page}"> 
	</form>

	<form id="actionForm" method="get">
		<input type="hidden" name="page" value="${cri.page}"> 
		<input type="hidden" name="tno" value="${todo.tno}">
	</form>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		var action = $("#actionForm");

		$(".btn").click(function(e){
			e.preventDefault();
			$(".btn[data-oper='li']").click(function(e) {
				action.attr("action", "/todo2/list").submit();
			});
			
			$(".btn[data-oper='del']").click(function(e) {
				action.attr("method","post").attr("action", "/todo2/remove").submit();
			});
			
			$(".btn[data-oper='mod']").click(function(e) {
				$("#modForm").submit();
			});
		});
		
		
	</script>
</body>
</html>