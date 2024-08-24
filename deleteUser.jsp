<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.,java.util."%>
<%
int uid=Integer.parseInt(request.getParameter("uname"));



try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myprojectdatabase", "prashanth", "Pra12+34");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("delete from users where id="+uid");
        out.println("<center><b>deleted succesfully!<br><a href='RetrieveData.jsp'>Check Now</a></b></center>");
        }
        catch(Exception e)
        {
        out.print(e.getMessage());
        e.printStackTrace();
        }
 %>