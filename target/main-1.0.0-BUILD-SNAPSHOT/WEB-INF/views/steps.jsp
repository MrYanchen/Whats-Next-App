<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Steps</title>
</head>
<body>
<c:set var="userId" value="${user}"></c:set>
<c:set var="itemId" value="${item}"></c:set>
<form:form id="step" modelAttribute="step" action="/main/user/${userId}/item/${itemId}/step" method="post" enctype="multipart/form-data">
<table>
<tr>
<td><form:label path="stepNumber">Number</form:label></td>
<td><form:input path="stepNumber"/></td>
<form:errors path="stepNumber" cssClass="error"></form:errors>
</tr>
<tr>
<td><form:label path="stepText">Text</form:label></td>
<td><form:input path="stepText"/></td>
<form:errors path="stepText" cssClass="error"></form:errors>
</tr>
<tr>
<td><form:label path="image">Image</form:label></td>
<td><form:input path="image" type="file"/></td>
<form:errors path="image" cssClass="error"></form:errors>
</tr>
</table>
<p><button type="submit">Submit</button></p>
</form:form>
</body>
</html>