<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Success</title>
</head>
<body>
<c:if test="${!empty register}">
<table>
<tr>
<td><c:out value="${register.getRegisterName()}"></c:out></td>
<td><c:out value="${register.getRegisterPassword()}"></c:out></td>
<td><c:out value="${register.getRegisterPhone()}"></c:out></td>
<td><c:out value="${register.getRegisterEmail()}"></c:out></td>
</tr>
</table>
</c:if>
<c:set var="id" value="${register.getRegisterId()}"></c:set>
<h3><a href="/main/user/${id}/homepage">User Home Page</a></h3>
</body>
</html>