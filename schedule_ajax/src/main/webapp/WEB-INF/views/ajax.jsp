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
		$.ajax({
			url : "ajax_result", type : "GET",
			success :  function(data){
				//alert('연결 성공')
				$("#count").text(data)
			}, error : function(){
				alert('문제 발생')
			}
		})
	}
</script>

</head>
<body>
	<h1>1</h1> <h1>2</h1> <h1>3</h1>
	<h1>4</h1> <h1>5</h1> <h1>6</h1>
	<h1>7</h1> <h1>8</h1> <h1>9</h1>
	<button type="button" onclick="ajax()">click</button>
	<label id="count">0</label>
</body>
</html>






