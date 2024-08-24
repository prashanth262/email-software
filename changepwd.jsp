<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.,java.util."%>
<%
int user_id=Integer.parseInt(request.getParameter("uname"));

String oldpwd=request.getParameter("oldpwd");
String newpwd=request.getParameter("newpwd");

try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myprojectdatabase", "prashanth", "Pra12+34");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("update users set name='"+newpwd+"' where id="+user_id);
        out.println("<center><b>password changed succesfully!<br><a href='RetrieveData.jsp'>Check Now</a></b></center>");
        }
        catch(Exception e)
        {
        out.print(e.getMessage());
        e.printStackTrace();
        }
 %>