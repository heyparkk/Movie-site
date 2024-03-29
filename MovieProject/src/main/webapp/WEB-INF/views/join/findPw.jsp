<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
</head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="/css/joinForm.css" rel="stylesheet">
<style>
	.exMsg h3 {font-weight:bold; text-align:center}
	.exMsg {padding-bottom:10px;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	$(function(){
		
		$("#input").hide();
		$("#ck_b").hide();
		
		let num = "";
		
		 $("#mail_ck").click(function(){
			 let email = $("#email").val();
			 let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			 
			if(!email){
					$("#emailresult").html("메일 주소를 입력하세요");
					return false;
				}//if
				
			if(!(regExp.test(email))){
				$("#emailresult").html("형식에 맞게 메일 주소를 입력하세요");
				return false;
			}//if
			
			let mem_name=$("#name").val();
			let mem_email=$("#email").val();
			let mem_id=$("#id").val();
			
			$.ajax({
				url:"/pwCheck",
				data:{
					"mem_name":mem_name,
					"mem_email":mem_email,
					"mem_id":mem_id
					},
				dataType:"text"
			}).done(function(data){
				if(data==0){
					$("#emailresult").html("該当する名前とID、Eメールに登録したIDがありません。");
				}else{
					$.ajax({url:"/send",
					 	data:"emailAddress="+email,
						dataType:"json"}
					).done(function(data){
						if(eval(data[1])){
							num = data[0];
							alert("메일이 전송되었습니다. 인증번호를 입력하세요.");
							$("#input").show();
							$("#ck_b").show();
					}
						}); //sendMail
					
				}
			})//nameCheck
			
		 
		})//mail 전송
		
		$("#ck_b").click(function(){
			let ck_num = $("#ck_num").val();
			if(ck_num == num){
				$("#result").html("인증이 확인되었습니다.")
				$("#result").append("<input type='hidden' id='ck' value='1'>");
			}else{
				$("#result").html("인증 실패했습니다. 다시 확인하세요.");
			}
		})//이메일 인증
		
		$("#findPw").submit(function(){
			
			if($("#ck").val() != 1){	
				$("#result").html("이메일 인증 하셔야 합니다.");
				return false;
			}//email 인증
		
		})//submit
		
	})//ready

</script>
<body>
<div id="container">
	<div id="body">
		<div class="registration-form">
			<form id="findPw" method="post">
				<div class="form-icon">
		        	<span><i class="icon icon-user" id="icon"></i></span>
		        </div>
				<div class="form-group">
					<div class="exMsg"><h3>新規登録時に入力した名前と</h3></div>
					<div class="exMsg"><h3>ID、Eメールを入力してください。</h3></div>
				</div>
				<div class="form-group">
					<div class="title"><h5>名前</h5></div>
					<input class="form-control item" name="mem_name" id="name" placeholder="이름" value="${dto.mem_name}">
					<div class="msg" id="name_msg"></div>
				</div>
				<div class="form-group">
					<div class="title"><h5>ID</h5></div>
					<input class="form-control item" name="mem_id" id="id" placeholder="아이디">
					<div class="msg" id="id_msg"></div>
				</div>
				<div class="form-group">
					<div class="title"><h5>email</h5></div>
					<input class="form-control item" id="email" name="mem_email" placeholder="email">
					<button type="button" id="mail_ck" class="btn btn-block create-account">メール認証</button>
					<div class="msg" id="emailresult"></div>
				</div>
				<div class="form-group" id="input">
					<input class="form-control item" id="ck_num" placeholder="인증번호를 입력하세요">
					<button type="button" class="btn btn-block create-account" id="ck_b">メール認証チェック</button>
					<div class="msg" id="result"></div>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-block create-account">次に</button>
				</div>	
			</form>
		</div>
	</div>
</div>
</body>
</html>