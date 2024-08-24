<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "gmail";
String userid = "prashanth";
String password = "Pra12+34";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String user_id=request.getParameter("uname");
String user_pwd=request.getParameter("pwd");
int flag=0;
try{
connection=DriverManager.getConnection(connectionUrl+database,userid,password);
statement=connection.createStatement();
String sql="select * from users where email_id='"+user_id+"' and pwd='"+user_pwd+"'";
resultSet=statement.executeQuery(sql);
while(resultSet.next()){
flag=1;
}
if(flag==1)
{
  session.setAttribute("email_id",user_id);
response.sendRedirect("inbox.jsp");
}
else
response.sendRedirect("login.jsp?msg='Invalid Credentials!<br>Please Try Again'");
}
catch(Exception e){
out.println(e.getMessage());
}
%>