<%@ page import="common.Person" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	// pageContext 변수에 속성저장 (pagecontext는 이 페이지에서만 유효하니까 PageLocation.jsp로 이동하면 값없음)
	pageContext.setAttribute("pageInteger", 1000); 
	pageContext.setAttribute("pageString", "페이지 영역의 문자열");
	pageContext.setAttribute("pagePerson", new Person("한석봉", 99));
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 영역</title>
</head>
<body>
	<h2>page 영역의 속성값 읽기</h2>
	<%
	// 속성읽기  (set으로 받은거 출력) , object니까 맞는 속성으로 읽음
	int pInteger = (Integer)(pageContext.getAttribute("pageInteger")); 
	String pString = pageContext.getAttribute("pageString").toString();
	Person pPerson = (Person)(pageContext.getAttribute("pagePerson"));
	%>
	<ul>
	<li>Integer 객체 : <%= pInteger %></li>
	<li>String 객체 : <%= pString %></li>
	<li>Person 객체 : <%= pPerson.getName() %>, <%=pPerson.getAge() %></li>
	</ul>
	
	<h2>include된 파일에서 page영역 읽어오기</h2>
	<%@ include file = "PageInclude.jsp" %>
	
	<h2>페이지 이동 후 page영역 읽어오기</h2>
	<a href = "PageLocation.jsp">PageLocation.jsp 바로가기</a>
</body>
</html>