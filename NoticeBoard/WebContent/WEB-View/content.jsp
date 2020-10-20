<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "java.util.regex.Pattern"
    import = "java.sql.*"
    %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN" "http://ww.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=ISO-8859-1">
<title>Authentic! Bulletin Board-Delete Post</title>
</head>

<% // scriptlet Java
String idx = request.getParameter("idx");
try
{
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:JERONIMO";
	ResultSet rs = null;
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url,"jeronimo","1234");
	out.println("Oracle Database Connection Success.");
	
	Statement stmt = con.createStatement();
	String sql = "select * from BOARD where idx = "+idx;
	rs = stmt.executeQuery(sql);
	
	while(rs.next())
	{
		// "setAttribute" is the method of the "request" object that defines a specified attribute
		request.setAttribute("idx",rs.getString("idx"));
		request.setAttribute("writer",rs.getString("writer"));
		request.setAttribute("regdate",rs.getString("regdate"));
		request.setAttribute("count",rs.getString("count"));
		request.setAttribute("title",rs.getString("title"));
		request.setAttribute("content",rs.getString("content"));
	}
	con.close();
	
}
catch(Exception e)
	{
		out.println("Oracle Database Connection Something Problem. <hr>");
		 
	    out.println(e.getMessage());

	    e.printStackTrace();
	}
%>

<body> 							<!-- This is the main content of the HTML document. -->
<h1> Post inquiry </h1>   			<!-- This tag represents the headline text. -->
	<table border="1">						<!-- This tag represents tabular data. -->
		<tr>					<!-- This tag is used to define a row within a table tag. -->
		    <th>number</th> 	
		    <td>${idx}</td>     <!--the variable defined by the setAtribute method of the request object is being used-->
		    <th>email</th>
		    <td>${writer}</td>	<!--the variable defined by the setAtribute method of the request object is being used-->	    
		    <th>date</th>
		    <td>${regdate}</td> <!--the variable defined by the setAtribute method of the request object is being used-->
		    <th>views</th> 
		    <td>${count}</td>  <!--the variable defined by the setAtribute method of the request object is being used-->
		</tr>
		<tr>			
		    <th colspan="2">title</th>
		    <td colspan="6">${title}</td> 
		</tr>
		<tr>			
		    <th colspan="2">contents</th>
		    <td colspan="6">${content}</td> 
		</tr>
	</table>
	
	<a href = "delete.jsp?idx=${idx}">Delete Post</a>
	<a href = "redirect.jsp"> To list</a>

</body>
</html>