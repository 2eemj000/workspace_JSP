<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
</head>
<body>
<h1>Member List</h1>
    <table border="1">
        <thead>
            <tr>
                <th>id</th>
                <th>pass</th>
                <th>name</th>
                <th>regidate</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="member" items="${members}">
                <tr>
                    <td>${member.id}</td>
                    <td>${member.pass}</td>
                    <td>${member.name}</td>
                    <td>${member.regiate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>