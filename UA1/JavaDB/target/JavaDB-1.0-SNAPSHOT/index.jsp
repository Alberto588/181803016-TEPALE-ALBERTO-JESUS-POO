<%-- 
    Document   : index
    Created on : 29 may. 2020, 9:00:13
    Author     : Alberto
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connection conexion = null;//Variable para la conexion
    Statement stmt = null; //
    ResultSet rs = null;
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuaris", "root", "");
        
        stmt = conexion.createStatement();
        rs = stmt.executeQuery("Select * from usuario");
        
        while(rs.next()){
            out.println(rs.getString(1));
            out.println(rs.getString(2));
        }

    }catch(Exception e){
        out.println("Error: "+e);
    }//catch(SQLSyntaxErrorException e){
       // out.println("No existe la tabla: " + e.getMessage());
    //}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

