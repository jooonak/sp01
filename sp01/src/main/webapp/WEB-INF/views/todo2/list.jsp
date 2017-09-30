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

	<h1>List Page</h1>

	<h2>${cri.page}</h2>
	<h2>${cri.total}</h2>
	<a href="/todo2/register"><button>글쓰기</button></a>
	
	<div>
		<ul class="listUl">
			<c:forEach items="${list}" var="todo">
				<li><a href="${todo.tno}">${todo} ${todo.replycnt}</a></li>
			</c:forEach>
		</ul>
	</div>
	
	<div class="pageDiv">
		<ul class="pageUl"></ul>
	</div>
	
	<form id="actionForm" method="get">
	<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="tno">
	</form>
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="/resources/js/paging.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			var msg = '${result}'
			var page = '${cri.page}'
			var actionForm = $("#actionForm")
			
			if (msg === 'success'){
				alert("등록 성공!")
			}else if(msg === 'Del'){
				alert("삭제 성공!")
			}
			
			$(".listUl li a").on("click",function(e){
				e.preventDefault();
				
				var tno = $(this).attr("href");
				
				actionForm.attr("action","/todo2/view");
				actionForm.find("input[name='tno']").val(tno);
				
				actionForm.submit();
			})
			
			$(".pageUl").on("click", "li", function(e){
			
				var pageNum = $(this).html();
				console.log(pageNum);
				
				self.location="/todo2/list?page="+pageNum;
				
			});
			
			var pageStr = makePage({
		        total: ${cri.total},
		        current: ${cri.page},
		        pageSize: 10
		    });
			
			$(".pageUl").html(pageStr);
		});
	</script>
</body>
</html>