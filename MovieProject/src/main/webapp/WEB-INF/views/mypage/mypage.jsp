<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>

<title>Mypage</title>
<style>
#body {
	width: 1400px;
	margin-left: auto;
	margin-right: auto;
}

</style>
<link href="/css/mypage.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function gotoMain() {
		location.href = "/mainpage";
	}//gotoMain

	$(function() {

	})//ready
</script>
<jsp:include page="/header" flush="true" />
</head>
<body>

<dl id="dl">
  <dt id="dt"><a href="updateMember">Myinfo</a></dt>
  <dt id="dt"><a href="mytkList">予約確認 / キャンセル</a></dt>
  <dt id="dt"><a href="myboardList">活動内訳</a></dt>
</dl>
</body>
<footer>
	<jsp:include page="/footer" flush="true" />
</footer>
</html>