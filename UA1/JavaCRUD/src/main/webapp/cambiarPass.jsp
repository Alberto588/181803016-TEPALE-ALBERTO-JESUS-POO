<%-- 
    Document   : cambiarPass
    Created on : 19 jun. 2020, 17:59:37
    Author     : Alberto
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambio contraseña</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
<%
    Connection conexion=null;
    PreparedStatement stmt=null;
    ResultSet rs=null;
    try{
        int idUsuario=0;
        boolean valor=false;
        
        String anterior=request.getParameter("anteriorPass");
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "usuarios", "usu123");
        stmt = conexion.prepareStatement("select id_usuario from usuario where id_usuario=? and password=MD5(?)");
        stmt.setInt(1,Integer.parseInt(request.getParameter("id")));
        stmt.setString(2, request.getParameter("anteriorPass"));
        rs = stmt.executeQuery();
        
        while(rs.next()){
            valor=true;
        }
        
        String nuevo1=request.getParameter("nuevaPass1");
        String nuevo2=request.getParameter("nuevaPass2");
        
        if(valor == true){
            if(nuevo1.equals(nuevo2)){
                stmt=conexion.prepareStatement("UPDATE usuario SET password=MD5(?) where ?=id_uuario");
                stmt.setString(1, nuevo1);
                stmt.setInt(2,Integer.parseInt(request.getParameter("id")));
                stmt.executeUpdate();
                %>
                <br>
                <div class="alert alert-success" role="alert">
                    <h3>Se ha actualizado la contraseña</h3>
                </div>
                <%
            }else{
                %>
                <br>
                <div class="alert alert-danger" role="alert">
                    <h3>No coinciden las nuevas contraseñas</h3>
                </div>
                <%
            }
        }else{
            %>
            <br>
            <div class="alert alert-warning" role="alert">
                <h3>La contraseña no coincide con la base de datos</h3>
            </div>
            <%
        }
        
    }catch(Exception e){
        %>
        <div class="alert alert-danger" role="alert">
            <h3>No se puedo realizar el registro</h3>
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
