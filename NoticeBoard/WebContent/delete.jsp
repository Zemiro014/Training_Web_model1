<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"   
    import = "java.util.regex.Pattern"
    import = "java.sql.*"
    %>
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN" "http://ww.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
		String sql = "delete from BOARD where idx = "+idx; // Delete query
		rs = stmt.executeQuery(sql);
		con.close();
	}
	catch(Exception e)
	{
        out.println("Oracle Database Connection Something Problem. <hr>");
        
        out.println(e.getMessage());
 
        e.printStackTrace();
	}
%>
<script>
alert(""); // Display a warning window that the post has been deleted
location.href="redirect.jsp"; // Go to the list page.
</script>
<body>

</body>
</html>