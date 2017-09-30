<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${dto.title}</h1>
	<h2>${result}</h2>
	
	
	<%-- <p>
		<a href="/todo/list?page=${param.page}"><button>GO List</button></a>
	</p> --%>

	<form class="f1" method="get">
		<input type="hidden" name="page" value="${cri.page}">
		<button class="btn" data-oper="md">Mod OR Del</button>
		<button class="btn" data-oper="li">Go List</button>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			
			var formObj = $(".f1")
			
			$(".btn").click(function(e){
				
				var oper = $(this).attr("data-oper");
				
				if(oper === "li"){
					
					formObj.attr("action","/todo/list");
				} else if(oper === "md"){
					
					formObj.append("<input type='hidden' name='tno' value='${dto.tno}'>");
					formObj.attr("action","/todo/modify");
				}
				
				formObj.submit();
			});
		});
	
	</script>
</body>
</html>