<%-- 
    Document   : index
    Created on : 6 jun. 2020, 23:41:15
    Author     : Alberto
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <%
            Connection conexion = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "usuarios", "usu123");
                stmt = conexion.prepareStatement("select * from usuario");
                rs = stmt.executeQuery();
        %>
        <div class="container">
            <table class="table table-striped table-dark">
                <thead class="thead-dark">
                    <tr text-align="left">
                        <td colspan="2"><h2>Usuarios</h2></td>
                        <td><a class="btn btn-success btn-block" href="formularioUsuario.jsp">Agregar Usuario</a></td>
                    </tr>
                    <tr>
                        <th>ID</th>
                        <th>Edad</th>
                        <th>Nombre</th> 
                        <th>Contraseña</th>
                    </tr>
                </thead>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><% out.println(rs.getInt("id_usuario"));%></td>
                    <td><% out.println(rs.getString("edad"));%></td>
                    <td><% out.println(rs.getString("usuario"));%></td>
                    <td><% out.println(rs.getString("password"));%></td>
                    <td><a class="btn btn-warning btn-block" href="formularioUsuario.jsp?id=<%=rs.getInt("id_usuario")%>">Editar usuario</a></td>
                    <td><a class="btn btn-primary btn-block" href="formularioPass.jsp?id=<%=rs.getInt("id_usuario")%>">Editar contraseña</a></td>
                    <td><a class="btn btn-danger btn-block" href="eliminarUsuario.jsp?id=<%=rs.getInt("id_usuario")%>">Eliminar usuario</a></td>
                    <td></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <%
            } catch (Exception e) {
                out.println("Error: " + e);
            }
        %>
    </body>
</html>
