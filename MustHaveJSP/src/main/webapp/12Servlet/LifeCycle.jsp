<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LifeCycle.jsp</title>
</head>
<body>
	<script>
	function requestAction(frm,met){ // 폼값전송(첫번째인자:DOM객체, 두번째인자:전송방식)
		if(met==1){
			frm.method = "get";
		}else{
			frm.method = "post";
		}
		frm.submit(); // 폼값전송
	}
	</script>
	
	<h2>서블릿 수명주기(Life Cycle) 메서드</h2>
	<form action="./LifeCycle.do"> <!-- action속성을 제외하고는 클릭시 설정하도록 함 -->
		<input type="button" value="Get 방식 요청하기"
			onClick="requestAction(this.form, 1);"/>
		<input type="button" value="Post 방식 요청하기"
			onClick="requestAction(this.form, 2);"/>
	</form>
</body>
</html>