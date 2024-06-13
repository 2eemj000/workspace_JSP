<%@ page import="utils.CookieManager" %>
<%@ page import="utils.JSFunction" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
String save_check = request.getParameter("save_check");

if ("must".equals(user_id)&&"1234".equals(user_pw)){
	// 로그인 성공
	if (save_check != null && save_check.equals("Y")){ // 체크되어있으면 
		CookieManager.makeCookie(response,"loginId",user_id,86400); // 쿠키생성
	} else{
		CookieManager.deleteCookie(response,"loginId"); // 아니면, 기존쿠키를 삭제함
	}
	JSFunction.alertLocation("로그인에 성공했습니다.","IdSaveMain.jsp",out); // 성공창 띄우고 다시 Main페이지로
}
else{
	// 로그인 실패
	JSFunction.alertBack("로그인에 실패했습니다.",out); // 실패창 띄우고 이전페이지로
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>