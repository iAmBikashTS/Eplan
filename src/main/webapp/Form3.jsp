<%@page import="com.cms.eplan.db.SecondXMKL"%>
<%@page import="com.cms.eplan.db.XMLCreation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%!
XMLCreation  xml=new XMLCreation();
SecondXMKL  secxml=new SecondXMKL();
%>

<%
String name=request.getParameter("abc");
String id=request.getParameter("dba");
String action=request.getParameter("value");
String condition=request.getParameter("condition");
secxml.setAction(action);
secxml.setCondition(condition);
secxml.setField_id(id);
secxml.setField_name(name);
xml.secondXmlGeneration(secxml);
%>
<h1>Data is Submitted Successfully</h1>
<h2>Home Page
<a href="/Eplan/index.jsp">Click Here</a>
</h2>
</body>
</html>