<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="get">
		<div>
			Tno <input type="text" name="tno" readonly="readonly"
				value="${todo.tno}">
		</div>
		<div>
			Title <input type="text" name="title" readonly="readonly"
				value="${todo.title}">
		</div>
		<div>
			Writer <input type="text" name="writer" readonly="readonly"
				value="${todo.writer}">
		</div>
		<div>
			<button class="btn" data-oper="mod">수정/삭제</button>
			<button class="btn" data-oper="li">리스트</button>
		</div>
	</form>

	<form id="actionForm">
		<input type="hidden" name="page" value="${cri.page}"> <input
			type="hidden" name="tno" value="${todo.tno}">
	</form>

	<div>
		<input id="reply" type="reply" name="reply" value="테스트"> <input
			id="replyer" type="replyer" name="replyer" value="JH">
		<button id="replyBtn">Save</button>
	</div>


	<div class="replyDiv">
		<ul class="replyUL">
		</ul>
	</div>

	<style>
.hide {
	display: none;
}

.popup {
	background-color: lime;
	position: absolute;
	width: 300px;
	height: 300px;
	top: 10px;
	left: 50%;
}
</style>

	<div class="popup hide">
		<input type="text" name="rno"> 
		<input type="text" name="reply">
		<input type="text" name="replyer">
		<button class="popBtn del">삭제</button>
		<button class="popBtn mod">수정</button>
		<button class="popBtn clo">닫기</button>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		
	
		function getReplies() {
			var str = "";
			$.getJSON("/reply/list/1", function(arr) {
				for (var i = 0; i < arr.length; i++) {
					str += "<li data-rno='"+ arr[i].rno +"'>" + arr[i].rno + arr[i].reply + "</li>";
				};
				$(".replyUL").html(str);
			});
		};

		$(".replyUL").on("click", "li", function(e) {
			var rno = $(this).attr("data-rno");

			$.getJSON("/reply/" + rno, function(replyObj) {
				$(".popup input[name='rno']").val(replyObj.rno);
				$(".popup input[name='reply']").val(replyObj.reply);
				$(".popup input[name='replyer']").val(replyObj.replyer);
				$(".popup").show("slow");
			});
		});

		$(".clo").click(function(e) {
			console.log("close");
			$(".popup").hide("slow");
		});

		$(".mod").click(function(e) {
			console.log($(".popup input[name='reply']").val());
			
			var data = { 
					rno: $(".popup input[name='rno']").val(),
					reply: $(".popup input[name='reply']").val(),
					replyer: $(".popup input[name='replyer']").val()
					};
			console.log(data);
			$.ajax({

				url : "/reply/" + $(".popup input[name='rno']").val(),
				type : "PUT",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(data),
				success : function(result) {
					alert("success");
					getReplies();
					$(".popup").hide("slow");
				}
			});
		});

		$(".del").click(function(e) {
			console.log("delete" + $(".popup input[name='rno']").val());
			var rno = $(".popup input[name='rno']").val();

			$.ajax({

				url : "/reply/" + rno,
				type : "DELETE",
				success : function(result) {
					alert("success");
					getReplies();
					$(".popup").hide("slow");
				}
			});
		});

		getReplies();

		$("#replyBtn").click(function(e) {
			var data = {
				reply : $("#reply").val(),
				replyer : $("#replyer").val(),
				tno : 78
			}

			$.ajax({
				url : "/reply/new",
				type : "POST",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(data),
				success : function(result) {
					alert("success");
					getReplies();
				}
			});
		});

		var msg = '${result}'

		if (msg === 'Mod') {
			alert("수정 성공!");
		}

		var action = $("#actionForm");

		
		
		
		$(".btn[data-oper='li']").click(function(e) {
			action.attr("action", "/todo2/list").submit();
		});

		$(".btn[data-oper='mod']").click(function(e) {
			action.attr("action", "/todo2/modify").submit();
		});
	</script>
</body>
</html>