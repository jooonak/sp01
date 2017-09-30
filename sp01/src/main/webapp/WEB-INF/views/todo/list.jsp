<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<style>
.hide {
	display: none;
}

.show {
	display: inline;
}

.popup {
	position: absolute;
	top: 50%;
	left: 25%;
	width: 200px;
	height: 100px;
	margin-left: -50px;
	background-color: threedhighlight;
}

.list {
	list-style: none;
}

.pageArea li {
	list-style: none;
	margin: 1em;
	width: 3em;
	color: lime;
	float: left;
}
</style>

	<h1>List Page</h1>
	<h2>${criteria.total}</h2>

	<ul class="list">
		<c:forEach items="${list}" var="todo">
			<li><span>${todo.tno}</span> <span><a
					href="/todo/view?tno=${todo.tno}&page=${criteria.page}">${todo.title}</a></span>
				<span>${todo.writer}</span></li>
		</c:forEach>
	</ul>

	<form class="form1" action="">
		<input type="hidden" name=>
	</form>

	<ul class="pageArea">

	</ul>
	<div class="popup hide"></div>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="/resources/js/paging.js"></script>
	<script>
		$(document).ready(function() {
			
			var pageStr = makePage({
		        total: ${criteria.total},
		        current: ${criteria.page},
		        pageSize: 10
		    });
			
			$(".pageArea").html(pageStr);
			
			$(".pageArea").on("click", function(e){
				e.preventDefault();
				
				var target = e.target;
				
				console.log(target.innerHtml);
				
				$("#form1").find("input[name='page']")
				.val(target.innerHtml);
				
				$("#form1").submit;
				
			});
			
			$(".delBtn").on("click", function(e){
				
				var $this = $(this);
				var tno = $this.attr("data-tno");
				
				$("#tno").val(tno);
				$("#form1").attr("action", "/todo/remove").submit();
			});
			
			$(".link").on("click", function(e){
				
				e.preventDefault();
				
				var $this = $(this);
				var tno = $this.attr("href");
				
				$("#tno").val(tno);
				$("#form1").submit();
			});
		});
	</script>
	<script type="text/javascript">
		var msg = '${result}';

		if (msg === 'success') {
			document.querySelector(".popup")
					.setAttribute("class", "popup show");
		}
	</script>
</body>
</html>