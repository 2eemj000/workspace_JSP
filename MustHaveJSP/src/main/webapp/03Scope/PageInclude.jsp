<%@ page import="common.Person" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>Include 페이지</h4>
<%
int pInteger2 = (Integer)(pageContext.getAttribute("pageInteger"));
//String pString2 = pageContext.getAttribute("pageString").toString(); --> 주석처리하고 밑에서 직접 출력하도록
Person pPerson2 = (Person)(pageContext.getAttribute("pagePerson"));
%>
<ul>
	<li>Integer 객체 : <%= pInteger2 %></li>
	<!-- 문자열이거나 기본타입의 래퍼클래스면 형변환없이 출력가능 -->
	<li>String 객체 : <%= pageContext.getAttribute("pageString") %></li> 
	<li>Person 객체 : <%= pPerson2.getName() %>, <%=pPerson2.getAge() %></li>
	</ul>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>