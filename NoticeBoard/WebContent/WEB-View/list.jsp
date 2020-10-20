<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page 
 import = "java.util.regex.Pattern"
 import = "java.sql.*"
 import = "com.board.beans.Board"
 import = "java.util.ArrayList"
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN" "http://ww.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="./jquery-3.5.1.js"></script>
<meta http-equiv="content-Type" content="text/html; charset=ISO-8859-1">

<style type="text/css">  
table, td, th
{
	border:1px solid green;
}
th{
	background-color:green;
	color:white;
  }  
</style>

<title>Notice Board</title>
</head>
<body> 							<!-- This is the main content of the HTML document. -->
<h1> Post List </h1>   			<!-- This tag represents the headline text. -->
	<table>						<!-- This tag represents tabular data. -->
		<tr>					<!-- This tag is used to define a row within a table tag. -->
		    <th>number</th> 	<!-- This is an abbreviation of Table Header. Within the table tag -->
		    <th>title</th>
		    <th>email</th>
		    <th>date</th>
		    <th>views</th> 
		    <th>count</th>  
		</tr>
		<c:forEach items="${articleList}" var="article">
		<tr>
		<td>${article.idx}</td>         <!-- The jstl expression has the same attribute as the scriptlet, so it takes precedence wherever it is used -->
		<td><a href ='WEB-View/content.jsp?idx=${article.idx}'>${article.title}</a></td>
		<td>${article.writer}</td>
		<td>${article.regdate}</td>
		<td>${article.content}</td>
		<td>${article.count}</td>
		</tr>		
		</c:forEach>

	</table>
	<form>
	<br/> 
	<button type="button" class="mybtn">Go to form</button>
	<div id="target">Go to form B</div>
	</form> 
	<script>
	//$('.mybtn').click(function() {
	//    window.location.href = 'write.jsp';
	//});
   </script>
	
	<!-- change Jquery -->
	
	<a href="write.jsp">Go to form</a> 
</body>
</html>