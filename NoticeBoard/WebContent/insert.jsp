<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    
     import = "java.util.regex.Pattern"
     import = "java.util.*"
     import = "java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
    int idx = 1;
 
    String title = request.getParameter("title");
 
    String writer = request.getParameter("writer");
 
    String regdate = request.getParameter("regdate");
 
    int count = 10000;
    // Jquery Change
    String content = request.getParameter("content"); 
    if(title == ""|| title == null) 
    		out.println("title is null.\n");
    
    if(writer == "" || writer == null) 
    		out.println("writer is null.<br/");
    else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
    		out.println("Not in email format.\n");
    
    if(regdate == "" || regdate == null) 
    		out.println("regdate is null.<br/");
    else if(!Pattern.matches("^[0-9]*$",regdate))
    		out.println("It is not a number format.<br/");
    
    if(content == "" || content == null) out.println("content is null.<br/");
    
    try
    {
    	String driverName = "oracle.jdbc.driver.OracleDriver";
    	String url = "jdbc:oracle:thin:@localhost:1521:JERONIMO";
    	Class.forName(driverName);
    	Connection con = DriverManager.getConnection(url,"jeronimo","1234"); // (url, user, password)
    	out.println("You have successfully connected to the Oracle db database. ");
    	
    	Statement stmt = con.createStatement(); // Creating a Statement object to run SQL queries    	 
    	 String sql = "INSERT INTO BOARD "+    	 
    	                "(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) "+    	 
    	                "VALUES (board_seq.nextval, '"+title+"', '"+writer+"' , sysdate, "+count+", '"+content+"')";    	 
    	 
    	stmt.executeUpdate(sql); 
    	out.println("Data was successfully inserted. <br/>");
    	con.close();
    }
    catch(Exception e)
    {
    	out.println("There is a problem connecting to the Oracle database db.<hr>");
    	out.println(e.getMessage());
    	e.printStackTrace();
    }
    finally
    {
    	out.print("<script>location.href='index.jsp';</script>");
    }
%>
</body>
</html>