<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
    import = "java.util.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="insert.jsp" method="post" onsubmit = "return formCheck();">
	  Title : <input type = "text"	name = "title"/><br/><br/>
	 Email : <input type = "text"	name = "writer" Pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" /><br/><br/>
    content :<textarea rows="10" cols = "20" name="content"></textarea> <br/><br/>
	Data : <input type = "date"	name = "regdate" Pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$"/><br/><br/>
	  <input type="submit"/>  
	</form>	
	<script>
	function formCheck()
	{	
		/*
		alert(document.forms[0].title.value); // Produces the value inserted in the title
		
		var title = document.form[0].title.value;
		var write = document.forms[0].write.value;
		var regdate = document.forms[0].regdate.value;
		var content = document.forms[0].content.value;
		
		if(title == null || title == "")
		{
			alert('Make sure the title value is null');
			document.forms[0].title.focus();
			return false;
		}
		if(write == null || write == "")
		{
			alert('Make sure the write value is null');
			document.forms[0].title.focus();
			return false;
		}
		if(content == null || content == "")
		{
			alert('Make sure the content value is null');
			document.forms[0].title.focus();
			return false;
		}	
		if(regdate == null || regdate == "")
		{
			alert('Make sure the cregdate value is null');
			document.forms[0].title.focus();
			return false;
		}*/
		
		var length = document.forms[0].length-1;
		
		for(var i = 0; i < length; i++)
		{
			if(document.forms[0][i].value == null || document.forms[0][i].value == "")
			{
				alert(document.forms[0][i].name+"Check if value is null");
				document.forms[0][i].focus();
				return false;
			}
		}
		
	}
</script>
</body>
</html>