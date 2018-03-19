<%@page import="com.DAO.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%  
	
	String mail_value = request.getParameter("umail");
	String password_value = request.getParameter("upwd");
	String role_value =request.getParameter("user_type");
	
	
	
	if(role_value.equals("admin"))
	{
		
		iAdminLoginDAO user = new AdminLoginDAO();
		if(user.validateAdmin(new AdminInformation(mail_value,password_value)))
		{	
			
			//On successful login of admin
			 
		}
		else
		{
			//Wrong login credentials
		}
		
	}
	else
	{
		iOperatorLoginDAO user = new OperatorLoginDAO();
		if(user.validateOperator(new OperatorInformation(mail_value,password_value)))
		{
			//On successful login of operator
		}
		else
		{
			//On wrong credentials
		}
	}
	
	
	
%>
</body>
</html>