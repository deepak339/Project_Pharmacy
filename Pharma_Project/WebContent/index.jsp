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
									<br> <input type="button" class="btn btn-success"
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
			String username = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			String role_play = request.getParameter("role_play");
			boolean role = false;
			if (role_play.equals("true")) {
				role = true;
			} //role=1 for admin and vice versa
			if (role) {
				Credentials oc = new Credentials(username, pwd, role);
				ILogin oda = new Login();

				if (oda.validateUser(oc)) {
					//out.print("Succesful login for operator");
					session.setAttribute("name", username);
					response.sendRedirect("Admin_Dashboard.jsp");
				} else {
	%>
	<%-- <div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<p id="msg3" align=center>
				<strong><br>Incorrect User Name or Password</strong>
			</p>
			<br>
			<div>
				<form action="./index.jsp" method="get">
					<p id="msg4" align="center" style="display: none;">
						Enter your<strong> Registered Email Id</strong>
					</p>
					<input id="forgetemail1" type="email" style="display: none;"
						required> <input id="forgetbtn1" type="submit"
						style="display: none;" value="submit"> <a id="hlink1"
						href="#" onclick="return executeforget1()" class="special"
						style="text-align: center;">Forgot your Credentials? Click
						here </a>
				</form>
			</div>
		</div>
	</div>
	<script>
		function executeforget1() {

			var button1 = document.getElementById("forgetbtn1");
			var email1 = document.getElementById("forgetemail1");
			var msg3 = document.getElementById("msg3");
			var msg4 = document.getElementById("msg4");
			var hlink1 = document.getElementById("hlink1");
			email1.style.display = "block";
			button1.style.display = "block";
			msg3.style.display = "none";
			hlink1.style.display = "none";
			msg4.style.display = "block";
			return false;
		}
		var modal = document.getElementById('myModal');
		var span = document.getElementsByClassName("close")[0];
	</script>
	<script>
		function mahesh() {
			var modal = document.getElementById('myModal');
			var span = document.getElementsByClassName("close")[0];
			modal.style.display = "block";
		}
		span.onclick = function() {
			modal.style.display = "none";
		}
		mahesh();
	</script>
	<%
		boolean flag = false;
					String oemail = request.getParameter("forgetemail1");
					ForgetMailCheck ch = new ForgetMailCheck(oemail, flag);
					boolean check = ch.validateEmail();

					if (check == true) {
	%><input type="hidden" value="" id="chk">
	<script>
		if (document.getElementById("chk").value == "true") {
			var k = document.getElementById("forgetmsgsuccess");
			k.style.display = "block";
		}
	</script>

	<%
		GetCredentials gc = new GetCredentials(oemail, flag);
						Credentials opData = gc.GetData();
					} else {
	%><script>
		if (document.getElementById("chk").value != "true") {
			var j = document.getElementById("forgetmsgfailure");
			j.style.display = "block";
		}
	</script> --%>
	<%
		//}
				}
			} else {
				Credentials ac = new Credentials(username, pwd, role);
				ILogin adi = new Login();
				if (adi.validateUser(ac)) {
					//out.print("Succesful");
					session.setAttribute("name", username);
					response.sendRedirect("Operator_Dashboard.jsp");
				} else {
	%>
	<%-- <div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<p id="msg1" align=center>
				<strong><br>Incorrect User Name or Password</strong>
			</p>
			<br>
			<div>
				<form action="./index.jsp" method="get">
					<p id="msg2" align="center" style="display: none;">
						Enter your<strong> Registered Email Id</strong>
					</p>
					<input id="forgetemail" type="email" style="display: none;"
						required> <input id="forgetbtn" type="submit"
						style="display: none;" value="submit"> <a id="hlink"
						href="#" onclick="return executeforget()" class="special"
						style="text-align: center;">Forgot your Credentials? Click
						here </a>
				</form>
			</div>
		</div>
	</div>
	<script>
		function executeforget() {

			var button = document.getElementById("forgetbtn");
			var email = document.getElementById("forgetemail");
			var msg1 = document.getElementById("msg1");
			var msg2 = document.getElementById("msg2");
			var hlink = document.getElementById("hlink");
			email.style.display = "block";
			button.style.display = "block";
			msg1.style.display = "none";
			hlink.style.display = "none";
			msg2.style.display = "block";
			return false;
		}
		var modal = document.getElementById('myModal');
		var span = document.getElementsByClassName("close")[0];
	</script>
	<script>
		function mahesh() {

			modal.style.display = "block";
		}
		span.onclick = function() {
			modal.style.display = "none";
		}
		mahesh();
	</script>
	<%
		}
			}
		} --%>
	%>


	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/index.js"></script>
	<script src="js/admin_operator.js"></script>
</body>

</html>
