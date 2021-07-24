<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function getUsers(){
		$.ajax({
			url : "users", type : "GET", dataType : "json",
			success :  function(data){
				console.log(data)
				//$("#users").text(data)
				
				for(i=0;i < data.length; i++){
					console.log( data[i].name )
				}
				let html = ""
				$.each(data, function(index, item){
					html += "<b>아이디 : </b>"+item.name + "님<br>"
					html += "<b>나이 : </b>" + item.age + "살<hr>"
				})
				$("#users").append(html)
			}, error : function(){
				alert('문제 발생')
			}
		})
	}
	function userInfo(){
		// user/홍길동0
		$.ajax({
			url : "user/"+$("#userId").val(), type : "GET",
			dataType : "json",
			success : function(data){
				let html = "<b>아이디 : </b>"+data.name+"님<br>"
				html += "<b>나이 : </b>"+data.age+"살<hr>"
				$("#users").html(html)
			}
		})
	}
	function modify(){
		let form = {name : $("#name").val(), age : $("#age").val()}
		$.ajax({
			url: "modify", type:"PUT", dataType: "json",
			data : JSON.stringify(form),
			contentType : "application/json;charset=utf-8",
			success: function(data){
				let html = "<b>아이디 : </b>"+data.name+"님<br>"
				html += "<b>나이 : </b>"+data.age+"살<hr>"
				$("#users").html(html)
			}
		})
	}
	function membership(){
		/*
		let form = {}
// arr = [{name:uId, value:사용자 입력값},{name:uName, value:사용자 입력값},,,]
		let arr = $("#frm").serializeArray()
		for(i=0 ; i<arr.length ; i++){
//form{uId:값1,uName:값1,uAge:값1  }
			form[arr[i].name] = arr[i].value
		}
		*/
		let form = {
				uId : $("#uId").val(),
				uName : $("#uName").val(),
				uAge : $("#uAge").val(),
				uAddr : $("#uAddr").val(),
				uPhone : $("#uPhone").val(),
		}
		$.ajax({
			url : "membership", type: "POST", dataType: "json",
			data : JSON.stringify(form),
			contentType : "application/json; charset=utf-8",
			success: function(list){
				if(list.result == true){
					alert('성공적으로 저장 되었습니다')
				}else{
					alert('동일 아이디가 존재 합니다')
				}
			}, error: function(){
				alert('문제 발생!!!')
			}
		})
	}
</script>
</head>
<body>
	<h3>회원가입 페이지 입니다</h3>
<form id="frm">
	<input type="text" name="uId" id="uId" placeholder="input id"><br>
	<input type="text" name="uName" id="uName" placeholder="input name"><br>
	<input type="text" name="uAge" id="uAge" placeholder="input age"><br>
	<input type="text" name="uAddr" id="uAddr" placeholder="input addr"><br>
	<input type="text" name="uPhone" id="uPhone" placeholder="input phone"><br>
	<button type="button" onclick="membership()">회원가입</button>
</form>
<hr>
	<span id="users"></span><hr>
	<button type="button" onclick="getUsers()">사용자 목록 보기</button>
	<hr>
	<input type="text" id="userId">
	<button type="button" onclick="userInfo()">개인정보보기</button>
	<hr>
	수정하고자 하는 존재하는 아이디<br>
	<input type="text" id="name"><br>
	변경할 나이 입력 <input type="text" id="age"><br>
	<button type="button" onclick="modify()">개인정보 수정</button>
</body>
</html>








