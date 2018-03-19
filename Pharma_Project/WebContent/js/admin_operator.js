function myFunctionAdmin() {
	var form=document.getElementById("myForm")
	document.getElementById("flag").setAttribute("value","1");
	form.submit();
}

function myFunctionOperator() {	
	var form=document.getElementById("myForm")
	document.getElementById("flag").setAttribute("value","0");
	form.submit();
}
