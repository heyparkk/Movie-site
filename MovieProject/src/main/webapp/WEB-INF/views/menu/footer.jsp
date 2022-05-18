<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	function gotoMain() {
	  location.href="/mainpage";
	}//gotoMain
	
	function gotoService(){
		location.href="/inqubd/list";
	}//gotoService
	
	function gotoQna(){
		location.href="/qnabd/list";
	}//gotoQna
	
	
</script>
<link href="/css/nav.css" rel="stylesheet">
</head>
<body>
<div id="footer">
		<table id="serviceCenter">
			
			<td><div><ul><li><img src="/images/qnabd.png" width="100" height="100" onclick="gotoQna()"></li><li><div>よく聞かれる質問</div></li></ul></div></td>
			<td><div><ul><li><img src="/images/inqubd.png" width="100" height="100" onclick="gotoService()"></li><li><div>問い合わせ掲示板</div></li></ul></div></td></tr>
		</table>
	</div>
</body>
</html>