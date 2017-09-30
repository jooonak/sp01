<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>${memberDTO.uname}님 반갑습니다</h2>
	<form method="post" id="mainForm">
		<div>
			Title <input type="text" name="title">
		</div>
		<div>
			Writer <input type="text" name="writer" value="${memberDTO.uid}" readonly="readonly">
		</div>
		<div>
			<input type="reset"> <input type="submit">
		</div>
	</form>

	<div class="uploadDiv">
		<form id="uploadForm">
			<input type="file" name="file"> <input type="submit">
		</form>
	</div>

	<ul class="imgList"></ul>


	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
	
	$("#mainForm").on("submit",function(e){
		e.preventDefault();
		
		var mform = $(this);
		
		$(".imgList").each(function(idx){

			var fileName = $(this).attr("data-file");
			
			var str = "<input type='hidden' name='ufile' value='"+fileName+"'>";
			
			mform.append(str);
			
		});
	});
	
	$("#uploadForm").on("submit", function(e) {
		e.preventDefault();

		console.dir($("#uploadForm input[type='file']"));

		var formData = new FormData();

		formData.append("file", $("#uploadForm input[type='file']")[0].files[0]);

		$.ajax({
			url : '/upload/',
			data : formData,
			dataType : 'json',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {

				console.log(data);

				var str = "";

				str = "<li data-file='" + data.uploadName + "'><div>";
				str += "<img data-ori='"+data.uploadName+"' data-thumb='"+data.thumbName+"'src='/upload/thumb/"+ data.thumbName +"'>"
				str += "<span>" + data.original
						+ "</span>";
				str += "</div></li>";

				$(".imgList").append(str);
			}
		});
	});
		
	
	$(".imgList").on("click", function(e){
		
		console.log(".........");
		var $target = $(e.target);
		var data = {origin : $target.attr("data-ori"), thumb : $target.attr("data-thumb")}
		console.log(data);
		$.ajax({
			url : '/upload/del',
			data : data,
			dataType : 'json',
			processData : false,
			contentType : false,
			type : 'DELETE',
			success : function(data) {

				alert("success");
				$target.remove();
			}
		});
	});
	</script>

</body>
</html>