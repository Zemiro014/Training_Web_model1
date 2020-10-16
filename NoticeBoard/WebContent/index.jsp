<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
 import = "java.util.regex.Pattern"
 import = "java.sql.*"
%>
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN" "http://ww.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<%
try
{
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:JERONIMO";
	ResultSet rs = null;
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url,"jeronimo","1234");
	out.println("Oracle Database Connection Success.");
	
	Statement stmt = con.createStatement();
	String sql = "select * from BOARD order by idx desc";
	rs = stmt.executeQuery(sql);

%>

<body> 							<!-- This is the main content of the HTML document. -->
<h1> Post List </h1>   			<!-- This tag represents the headline text. -->
	<table>						<!-- This tag represents tabular data. -->
		<tr>					<!-- This tag is used to define a row within a table tag. -->
		    <th>numb</th> 	<!-- This is an abbreviation of Table Header. Within the table tag -->
		    <th>title</th>
		    <th>email</th>
		    <th>date</th>
		    <th>views</th>   
		</tr>
<%
	while(rs.next())
	{
		out.print("<tr>");
		out.print("<td> <a href='content.jsp?idx= "+rs.getString("idx")+"'>"+rs.getString("title")+"</a></td>");
		out.print("<td>"+rs.getString(2)+"</td>");
		out.print("<td>"+rs.getString(3)+"</td>");
		out.print("<td>"+rs.getString(4)+"</td>");
		out.print("<td>"+rs.getString(5)+"</td>");
		out.print("</tr>");
	}
%>
	</table>
	
	<!-- change Jquery -->
	<a href="write.jsp">Go to form</a> 
<%
	
	con.close();
	
} catch(Exception e)
	{
		out.println("Oracle Database Connection Something Problem. <hr>");
		 
	    out.println(e.getMessage());

	    e.printStackTrace();
	}
 %>
</body>
</html>