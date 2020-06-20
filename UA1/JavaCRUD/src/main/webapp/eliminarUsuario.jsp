<%-- 
    Document   : eliminarUsuario
    Created on : 19 jun. 2020, 20:20:59
    Author     : Alberto
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id=0;
    String usuario="";
    boolean valor=false;
    
    
        Connection conexion = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
    if(request.getParameter("id")!= null){
        id=Integer.parseInt(request.getParameter("id"));
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "usuarios", "usu123");
            stmt=conexion.prepareStatement("SELECT * FROM usuario WHERE id_usuario=?");
            stmt.setInt(1,id);
            rs=stmt.executeQuery();
            rs.next();
            usuario=rs.getString("usuario");
            
            while(rs.next()){
                valor=true;
            }
        }catch(Exception e){
            %>
            <div class="alert alert-danger" role="alert">
                <h3>Error: No se pudo eliminar el usuario</h3>
            </div>
            <% 
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Eliminar usuario</title>
    </head>
    <body>
        <h1>Eliminar usuario</h1>
        <h3><i>¿Desea eliminar al usuario....</i></h3>
        <div class="container">
            <h1></h1>
            <br>
            <form action="eliminacionUsuario.jsp" method="get" texr-alig>
                <div class="form-row">
                    <h4>Usuario: </h4>
                    <div class="col">
                        <input class="text-center" type="text" value="<%=usuario%>" class="form-control" readonly/>
                    </div>
                    
                    <input type="hidden" method="POST" class="form-control" value="<%=id%>" name="id" required/>
                    
                    <div class="col">
                        <input type="submit" class="btn btn-danger btn-block"  value="Eliminar"/>
                    </div>
                    
                    <div class="col">
                        <div><a class="btn btn-warning btn-block" href="index.jsp">Cancelar</a></div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
