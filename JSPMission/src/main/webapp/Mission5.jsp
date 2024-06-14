<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String snum1; 
try{
	snum1 = request.getParameter("snum1");
}catch (Exception e){
	snum1 = "";
}
String snum2; 
try{
	snum2 = request.getParameter("snum2");
}catch (Exception e){
	snum2 = "";
}
int max; int min; int rem; int gcd; int lcm;
if (Integer.parseInt(snum1)>Integer.parseInt(snum2)){
	max = Integer.parseInt(snum1);
	min = Integer.parseInt(snum2);
} else {
	max = Integer.parseInt(snum2);
	min = Integer.parseInt(snum1);
}
rem = max%min;
while (rem != 0) {
    max = min;
    min = rem;
    rem = max % min;
}
gcd = min;
lcm = (Integer.parseInt(snum1) * Integer.parseInt(snum2)) / gcd;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
	<table style="border: 1px solid black;">
		<tr>
			<td>숫자1: </td>
<%			if (snum1==null){ %>
				<td><input type="text" name="num1" placeholder="숫자를 입력하세요."/></td>
<%			} else { %>
				<td><input type="text" name="num1" value="<%=snum1 %>"/></td>
<%			} %>				
		</tr>
		<tr>
			<td>숫자2: </td>
<%			if (snum2==null){ %>
				<td><input type="text" name="num2" placeholder="숫자를 입력하세요."/></td>
<%			} else { %>
				<td><input type="text" name="num2" value="<%=snum2 %>"/></td>
<%			} %>				
		</tr>
		<tr>
			<td>최대공약수: </td>
			<td><input type="text" name="num3" value="<%=gcd %>"readonly/></td>		
		</tr>
		<tr>
			<td>최소공배수: </td>
 			<td><input type="text" name="num4" value="<%=lcm %>"readonly/></td>	
		</tr>
		<tr>
			<td colspan="2" style="margin:0 auto; text-align:center">
			<input style="width:100%;" type="submit" value="실행"/></td>
		</tr>
		</table>
	</form>
</body>
</html>