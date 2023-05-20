<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert the Details</title>
	<script language="javascript">
	function nullcheck(){
	var name=document.data.name.value;
	var age=document.data.age.value;
	var amount=document.data.amount.value;
	var year=document.data.year.value;
	var rate=document.data.rate.value;
		if(name==null||name==""){
			alert("Enter name");
			return false;
		}
		else if(age==null||age==""){
			alert("Enter age");
			return false;
		}
		else if(amount==null||amount==""){
			alert("Enter amount");
			return false;
		}
		else if(year==null||year==""){
			alert("Enter year");
			return false;
		}
		else if(rate==null||rate==""){
			alert("Enter rate%");
			return false;
		}else if(name.length<3){
			alert("Enter valid Name");
			return false;}
	}
	function validate(obj,event){
		var gg=obj.name;
		if(gg=="name"){
			var k=event.keyCode;
			if(!((k>64&&k<91)||(k>96&&k<123)||(k==32))){
				alert("Enter valid name");
				return false;
				}
			}
		else if(gg=="age"||gg=="year"||gg=="amount"||gg=="rate"){
			var a=event.keyCode;
			if(!(a>=48&&a<=57)){
				alert("Enter data's in number");
				return false;
			}
		}	
	}
	function validateRate(){
		var dd=document.data.rate.value;
		var r=parseInt(dd);
		if(r>10||r<1){
			alert("Rate % must be inbetween 1 to 10");
			return false;
			}}
	function validateAmount(){
		var amount=parseInt(document.data.amount.value);
		if(amount>100000){
			alert("Amount below 100000");
			return false;
			}}
		function validateAge(){
			var age=parseInt(document.data.age.value);
			if(age<18||age>100){
				alert("Age between 18 to 100");
				return false;
				}}
	function Submit(){
		var result;
		result=nullcheck();
		if(result==false){
			return false;
		}
		result=validateAge();
		if(result==false){
			return false;
			}
			result=validateAmount();
		if(result==false){
			return false;
		}
		result=validateRate();
		if(result==false){
			return false;
		}	
	}
	</script>
</head>
<body>
<form action="SimpleServlet" name="data" method="post">
	Name:<input type="text" name="name" maxlength="30" onkeypress="return validate(this,event)"/><br/>
	Age:<input type="text" name="age" maxlength="3" onkeypress="return validate(this,event)"/><br/>
	Principle Amount:<input type="text" name="amount" maxlength="6"onkeypress="return validate(this,event)"/><br/>
	Year:<input type="text" name="year" maxlength="3" onkeypress="return validate(this,event)"/><br/>
	Rate:<input type="text" name="rate" maxlength="2" onkeypress="return validate(this,event)"/><br/><br/>
	<input type="submit" value="Simple Intrest" onclick="return Submit()"/>
</form>
</body>
</html>