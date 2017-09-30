<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<style>
		.popup {
			background-color: lime;
			position: absolute;
			width: 300px;
			height: 300px;
			top: 10px;
			left: 50%;
		}
		
		.hide {
			display: none;
		}
		
	</style>


	<button class="uBtn">업로드 하기</button>

	<div class="popup hide">
		<form id="form" method="post" enctype="multipart/form-data">
			<input type="file" name="file">
			<button class="sBtn">등록</button>
			<button class="cBtn">닫기</button> 
		</form>
	</div>
	
	<div class="files"></div>


	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
		
	<script type="text/javascript">
		
		$(".uBtn").on("click",function(e){
			e.preventDefault();
			$(".popup").show("slow");
		});
	
		
		$(".sBtn").click(function(e){
			e.preventDefault();
			
			var data = new FormData();
			
			data.append("file", $("#form"));
		});
		
	</script>

</body>
</html>