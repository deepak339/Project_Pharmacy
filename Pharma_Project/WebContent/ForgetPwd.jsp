<%@page import="com.notifications.Email"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="css/style.css">

</head>
<body>

	<div class="logmod">
		<div class="logmod__wrapper">
			<span class="logmod__close">Close</span>
			<div class="logmod__container">

				<div class="logmod__tab-wrapper"></div>
					<div class="logmod__heading">
							<span class="logmod__heading-subtitle">Enter your Registered
								Email <strong>to get your Credentials</strong>
							</span>
						</div>
						<div class="logmod__form">
							<form accept-charset="utf-8" class="simform">
								<div class="sminputs">
									<div class="input full">
										<label class="string optional" for="user-name">Email Id*</label>
										<input class="string optional" maxlength="255" name="email"
											id="user-Username" placeholder="Email Id" type="Email"
											size="50" />
									</div>
								</div>
								<div  class="logmod__heading" >
							<span style="display:none;" id ="forgetmsgsuccess" class="logmod__heading-subtitle" ><strong>Password has been sent</strong> to your Registered Mail id
							</span>
						</div>
						<div  class="logmod__heading" >
							<span style="display:none;" id ="forgetmsgfailed" class="logmod__heading-subtitle" ><strong>Something went wrong</strong>Sorry for inconvenience
							</span>
						</div>
						<div  class="logmod__heading" >
							<span style="display:none;" id ="forgetmsgfailure" class="logmod__heading-subtitle" >This <strong>Email not Registered</strong> with us
							</span>
						</div>
						
						<input type="hidden" value="<%=request.getParameter("role") %>" name="role">
								<div class="simform__actions">
									<input  class="sumbit" name="commit" type="submit" 
										value="Submit" /> <span class="simform__actions-sidetext"></span>
								</div>
							</form>
							<script>
						function displayMsgsuccess()
						{
							document.getElementById("forgetmsgsuccess").style.display="block";
						}
						function displayMsgfailure()
						{
							document.getElementById("forgetmsgfailure").style.display="block";
						}
						function displayMsgfailed()
						{
							document.getElementById("forgetmsgfailed").style.display="block";
						}
						
						</script>
						</div>
						
			</div>
		</div>
	</div>
<%String role_play = request.getParameter("role");
boolean role;
if (role_play.equals("true")) {
	role = true;
}
else
{
	role=false;
}	
if(request.getParameter("role")!=null && request.getParameter("email")!=null)
{
	
	String email = request.getParameter("email");
	Email e = new Email(email, role);
	if(e.checkemail())
	{
		if(e.sendemail())
		{
			out.print("<script>displayMsgsuccess();</script>");
		}
		else
		{
			out.print("<script>displayMsgfailed();</script>");
		}
	}
	else
	{			
		out.print("<script>displayMsgfailure();</script>");	
	}
		
}
%>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/index.js"></script>
</body>

</html>
