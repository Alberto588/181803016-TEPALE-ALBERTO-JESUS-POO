<%-- 
    Document   : agergarUsuario
    Created on : 12 jun. 2020, 9:18:26
    Author     : Alberto
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AgregaUsuario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
<%
    Connection conexion=null;
    PreparedStatement stmt=null;
    ResultSet rs=null;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "usuarios", "usu123");
        stmt=conexion.prepareStatement("INSERT INTO usuario SET usuario=?, password=MD5(?), edad=?");
        stmt.setString(1, request.getParameter("usuario"));
        stmt.setString(2, request.getParameter("password"));
        stmt.setInt(3, Integer.parseInt(request.getParameter("edad")));
        stmt.executeUpdate();
        %>
        <br>
        <div class="alert alert-success" role="alert">
            <h3>Se ha ingresado el usuario correctamente</h3>
        </div>
        <%
    }catch(Exception e){
        %>
        <div class="alert alert-danger" role="alert">
            <h3>No se registro el usuario</h3>
        </div>
        <%      
    }finally{
        %>
        <br>
        <div class="shadow-lg p-3 mb-5 bg-white rounded"><a class="btn btn-primary btn-block" href="index.jsp">Regresar</a></div>
        <%

    }
%>
    </body>
</html>
