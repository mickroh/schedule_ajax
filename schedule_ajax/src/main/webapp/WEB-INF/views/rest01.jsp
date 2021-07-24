<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function ajaxGet(){
		$.ajax({
			url : "rest", type : "GET", dataType : "json",
			success : function(data){
				$("#label").text(data.execute)
			}, error : function(){ alert('문제 발생')}
		})
	}
	function ajaxPost(){
		$.ajax({
			url : "rest", type : "POST", dataType : "json",
			success : function(data){
				$("#label").text(data.execute)
			}, error : function(){ alert('문제 발생')}
		})
	}
	function ajaxPut(){
		$.ajax({
			url : "rest", type : "PUT", dataType : "json",
			success : function(data){
				$("#label").text(data.execute)
			}, error : function(){ alert('문제 발생')}
		})
	}
	function ajaxDelete(){
		$.ajax({
			url : "rest", type : "DELETE", dataType : "json",
			success : function(data){
				$("#label").text(data.execute)
			}, error : function(){ alert('문제 발생')}
		})
	}
</script>
</head>
<body>
	<label id="Label"></label><hr>
	<button type="button" onclick="ajaxGet()">get호출</button>
	<button type="button" onclick="ajaxPost()">get호출</button>
	<button type="button" onclick="ajaxPut()">get호출</button>
	<button type="button" onclick="ajaxDelete()">get호출</button>
</body>
</html>