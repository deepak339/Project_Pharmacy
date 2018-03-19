function myFunctionAdmin() {
	var form=document.getElementById("myForm")
	document.getElementById("flag").setAttribute("value",true);
	form.submit();
}

function myFunctionOperator() {	
	var form=document.getElementById("myForm")
	document.getElementById("flag").setAttribute("value",false);
	form.submit();
}
