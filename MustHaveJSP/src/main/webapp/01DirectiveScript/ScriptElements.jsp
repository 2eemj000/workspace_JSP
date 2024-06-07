<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
public int add(int num1, int num2){
	return num1+num2;
}
public int minus(int num1, int num2){
	return num1-num2;
}
public int mul(int num1, int num2){
	return num1*num2;
}
public int div(int num1, int num2){
	return num1/num2;
}
%>
<!DOCTYPE html>
<html>
<head>
<title>스크립트 요소</title>
</head>
<body>
<%
int result;
int result1;
int result2;
int result3;
try{
int num1 = Integer.parseInt(request.getParameter("num1")); // 무조건 string으로 return받아서 int로 바꿔줘야함
int num2 = Integer.parseInt(request.getParameter("num2"));
// http://localhost:8080/MustHaveJSP/01DirectiveScript/ScriptElements.jsp?num1=100&num2=20으로 실행
result = add(num1,num2);
result1 = minus(num1,num2);
result2 = mul(num1,num2);
result3 = div(num1,num2);
}catch (Exception e){
	result = 0;
	result1 = 0;
	result2 = 0;
	result3 = 0;
}
%>
덧셈 결과 [1] : <%=result %><br/>
덧셈 결과 [2] :  <%=add(30,40) %><br/>
뺄셈 결과 : <%=result1 %><br/>
곱셈 결과 :  <%=result2 %><br/>
나눗셈 결과 :  <%=result3 %>
</body>
</html>