<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function ajax(){
	var n = $("#name").val()
	var a = $("#age").val()
	var addr = $("#addr").val()
	console.log('name : '+n)
	console.log('age : '+a)
	var form = {age:a, name:n, addr:addr}
	$.ajax({
		url : "ajax_result01", type:"POST",
		data: JSON.stringify(form), //서버로 전송할 데이터
		dataType : "json", // 서버에서 돌아오는 데이터 타입 지정
		// 서버로 전송할 데이터 타입 지정
		contentType:"application/json; charset=utf-8",
		success:function(result){
			console.log(result)
			$("#label").text(result.name+":"+result.age)
		}, error: function(){
			alert('문제 발생')
		}
	})
}
</script>
</head>
<body>
	<input type="text" id="addr" placeholder="input address"><br>
	<input type="text" id="name" placeholder="input name"><br>
	<input type="text" id="age" placeholder="input age"><br>
	<input type="button" value="click" onclick="ajax()"><br>
	<label id="label"></label>
	
</body>
</html>











