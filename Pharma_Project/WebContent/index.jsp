<%@page import="com.DAO.login.*"%>
<%@page import="com.DAO.Credentials"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style_dialog.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="logmod">
		<div class="logmod__wrapper">
			<span class="logmod__close">Close</span>
			<div class="logmod__container">
				<ul class="logmod__tabs">
					<li data-tabtar="lgm-1"><h2 align=center>Log In</h2></li>
				</ul>
				<div class="logmod__tab-wrapper">
					<div class="logmod__tab lgm-1">
						<div class="logmod__heading">
							<span class="logmod__heading-subtitle">Enter your username
								and password <strong>to log in</strong>
							</span>
						</div>
						<div class="logmod__form">
							<form accept-charset="utf-8" method="post" class="simform"
								id="myForm">
								<div class="sminputs">
									<div class="input full">
										<label class="string optional" for="user-name">Username*</label>
										<input class="string optional" name="name" id="user-Username"
											placeholder="Username" type="text" />
									</div>
								</div>
								<input type="hidden" name="role_play" id="flag">
								<div class="sminputs">
									<div class="input full">
										<label class="string optional" for="user-pw">Password*</label>
										<input name="pwd" class="form-control is-invalid" id="user-pw"
											placeholder="Password" type="password" /> <span
											class="hide-password">Show</span>
									</div>
								</div>
								<!--  Start_of-Code Error message div and forgot Password msg div which is hidden currently  -->
								
								
						<script>
						function displayErrDiv()
						{
							document.getElementById("index_err_div").style.display="block";
							document.getElementById("fgt_pwd_link").style.display="block";
						}
						</script>
								
								
								
								
								<!--  End_of-Code Error message div and forgot Password msg div which is hidden currently  -->
								
								
								
								<div class="logmod__heading">
									<span style="display: none;" id="forgetmsgsuccess"
										class="logmod__heading-subtitle"><strong>Password
											has been sent</strong> to your Registered Mail id </span>
								</div>
								<div class="logmod__heading">
									<span style="display: none" id="forgetmsgfailure"
										class="logmod__heading-subtitle">This <strong>Email
											not Registered</strong> with us
									</span>
								</div>
								<div class="simform__actions" align=center>
								<div id="index_err_div" class="logmod__heading" style="display:none;" >
							<span class="logmod__heading-subtitle">
							<strong>Entered Credentials are Wrong</strong>
							</span>	
						</div>
									
									<a class="special" role="link" id="fgt_pwd_link" href="ForgetPwd.jsp?role=<%=request.getParameter("role_play") %>"  style="display:none;">Forgot
										your Credentials? Click here</a><br>
										
										 <input type="button" class="btn btn-success"
										name="commit" onclick="myFunctionAdmin()"
										value="Login as Admin" /> <input type="button"
										class="btn btn-success" name="commit"
										onclick="myFunctionOperator()" value="Login as Operator" /> <br>
										
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		if (request.getParameter("name") != null) {
			boolean role;
			String username = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			String role_play = request.getParameter("role_play");
			System.out.print(username+" "+pwd+" "+role_play);
			if (role_play.equals("true")) {
				role = true;
			}
			else
			{
				role = false;
			}
			Credentials oc = new Credentials(username, pwd, role);
			Login oda = new Login(oc);
			if (role) {
				

				if (oda.validateUser()) {
					
					session.setAttribute("name", username);
					response.sendRedirect("Admin_Dashboard.jsp");
				} else {
					
					//session.setAttribute("role", role_play);
					/* RequestDispatcher rd = request.getRequestDispatcher("ForgetPwd.jsp");
					rd.forward(request, response);
					 */
					out.print("<script>displayErrDiv();</script>");
					
					//response.sendRedirect("ForgetPwd.jsp?role="+role);
				}
			} else {
				
				if (oda.validateUser()) {
					session.setAttribute("name", username);
					response.sendRedirect("Operator_Dashboard.jsp");
				} else {
					//session.setAttribute("role", role_play);
					
					out.print("<script>displayErrDiv();</script>");
					//response.sendRedirect("ForgetPwd.jsp");
					
				}
			}
		}
	%>


	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/index.js"></script>
	<script src="js/admin_operator.js"></script>
</body>

</html>
