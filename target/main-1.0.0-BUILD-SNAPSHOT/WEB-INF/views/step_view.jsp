<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:if test="${!empty stepList}">
<c:forEach items="${stepList}" var="step">
<c:out value="${step.getStepNumber()}"></c:out>
<img alt="image" src="<c:url value="/item/${itemId}/step/${step.getStepId()}/image" />">
</c:forEach>
</c:if>
</body>
</html>