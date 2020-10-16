<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "java.util.regex.Pattern"
    import = "java.sql.*"
    %>
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN" "http://ww.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=ISO-8859-1">
<title>Authentic! Bulletin Board-Delete Post</title>
</head>
<%
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
%>

<body> 							<!-- This is the main content of the HTML document. -->
<h1> Post inquiry </h1>   			<!-- This tag represents the headline text. -->
	<table border="1">						<!-- This tag represents tabular data. -->
		<tr>					<!-- This tag is used to define a row within a table tag. -->
		    <th>number</th> 	<!-- This is an abbreviation of Table Header. Within the table tag -->
		    <td><%=rs.getString("idx") %></td>
		    <th>email</th>
		    <td><%=rs.getString("writer") %></td>		    
		    <th>date</th>
		    <td><%=rs.getString("regdate") %></td>
		    <th>views</th> 
		    <td><%=rs.getString("count") %></td>  
		</tr>
		<tr>			
		    <th colspan="2">title</th>
		    <td colspan="6"><%=rs.getString("title") %></td> 
		</tr>
		<tr>			
		    <th colspan="2">contents</th>
		    <td colspan="6"><%=rs.getString("content") %></td> 
		</tr>
	</table>
	
	<a href = "delete.jsp?idx=<%=rs.getString("idx")%>">Delete Post</a>
	<a href = "index.jsp"> To list</a>
<%
	}
	
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