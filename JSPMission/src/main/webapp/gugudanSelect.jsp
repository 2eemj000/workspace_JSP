<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sel = request.getParameter("sel");
String url;
String key;

if (sel.equals("1")){
	url = "./gugudan1.jsp";
	key="dan";
}
else if (sel.equals("2")){
	url = "./gugudan1-1.jsp";
	key="dir";
} else if (sel.equals("3")){
	url = "./gugudan2.jsp";
	key="column";
} else {
    url = "./error.jsp";
    key="";
}
request.getRequestDispatcher(url+"?"+key+"="+request.getParameter(key)).forward(request,response);
%>