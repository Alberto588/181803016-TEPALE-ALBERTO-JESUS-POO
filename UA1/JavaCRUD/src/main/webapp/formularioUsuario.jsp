<%-- 
    Document   : formularioUsuario
    Created on : 12 jun. 2020, 8:47:06
    Author     : Alberto
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String titulo="Agregar usuario";
    int id=0;
    String usuario="";
    
    String archivo="agregarUsuario.jsp";
    if(request.getParameter("id")!= null){
        id=Integer.parseInt(request.getParameter("id"));
        titulo="Editar Usuario";
        
        Connection conexion = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        archivo="editarUsuario.jsp";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "usuarios", "usu123");
            stmt=conexion.prepareStatement("SELECT * FROM usuario WHERE id_usuario=?");
            stmt.setInt(1,id);
            rs=stmt.executeQuery();
            rs.next();
            usuario=rs.getString("usuario");
            System.out.println("");
            rs.getString("password");
        }catch(Exception e){
            out.println("Error: "+e);
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Usuario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <h1><%out.println(titulo);%></h1>
            <br>
            <form action="<%=archivo%>" method="POST">
                <div class="form-row">
                    <div class="col">
                        <input type="text" value="<%=usuario%>" class="form-control" placeholder="Nombre" name="usuario" required/>
                    </div>
                    <%
                    if(id==0){
                            %>
                        <div class="col">
                            <input type="password" class="form-control" placeholder="Contraseña" name="password" required/>
                        </div>
                            <%
                    }else{
                    %>
                        <input type="hidden" method="POST" class="form-control" value="<%=id%>" name="id" required/>
                    <%
                    }
                    %>
                    
                    <div class="col">
                        <input type="submit" class="btn btn-success btn-block"  value="Enviar"/>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
