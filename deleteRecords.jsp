<%@ page import="java.sql.*" %>
<%
String[] itemsToDelete = request.getParameterValues("itemToDelete");

if (itemsToDelete != null && itemsToDelete.length > 0) {
    out.println(itemsToDelete); 
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "dpp";
    String userid = "root";
    String password = "Bradhika#576";

    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;

    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();
        for (String item : itemsToDelete) {
            String sql = "UPDATE fc set slt=1 WHERE id=" + item;
            statement.executeUpdate(sql);
        }
        connection.close();
        response.sendRedirect("first.jsp"); 
    } catch (SQLException e) {
        out.println(e.getMessage());
    }
} else {
    out.println("No items selected for deletion.");
}
%>
