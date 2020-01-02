<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>로그인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   $("#loginBtn").click(function() {
      if($("#id").val() == "") {
         alert("아이디 입력!!!");
         return;
      } else if($("#pass").val() == "") {
         alert("비밀번호 입력!!!");
         return;
      } else {
         $("#loginform").attr("action", "/memberjsp/login/login_process.jsp").submit();
      }
   });
   
   $("#moveRegisterBtn").click(function() {
      $(location).attr("href", "/memberjsp/member/member.jsp");
   });
});
</script>
</head>
<body>

<div class="container" align="center">
   <div class="col-lg-6" align="center">
      <h2>로그인</h2>
      <form id="loginform" method="post" action="">
         <div class="form-group" align="left">
            <label for="">아이디</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="">
         </div>
         <div class="form-group" align="left">
            <label for="">비밀번호</label>
            <input type="password" class="form-control" id="pass" name="pass" placeholder="">
         </div>
         <div class="form-group" align="center">
            <button type="button" class="btn btn-warning" id="loginBtn">로그인</button>
            <button type="button" class="btn btn-primary" id="moveRegisterBtn">회원가입</button>
         </div>
      </form>
   </div>
</div>

</body>
</html>