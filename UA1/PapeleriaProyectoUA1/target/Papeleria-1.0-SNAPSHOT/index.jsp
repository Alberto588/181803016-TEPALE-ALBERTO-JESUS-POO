<%-- 
    Document   : index
    Created on : 3 jun. 2020, 21:39:35
    Author     : Alberto
--%>

<%@page import="java.sql.*"%>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Papelería</title>
    </head>
    <body>
        <h1 style="text-align:center; color:blue;"> CRUD Papelería</h1>

        <%
            Connection conexion = null;//Variable para la conexion
            Statement stmt = null; //objeto sql
            ResultSet rs = null;//realizar consultas

            try {
                Class.forName("com.mysql.jdbc.Driver");

                conexion = DriverManager.getConnection("jdbc:mysql://localhost/papeleriaCRUD", "root", "");

                stmt = conexion.createStatement();
                rs = stmt.executeQuery("Select idProducto,nombreProducto,precioUnitario,"
                        + "unidades,descuento,marca from productos,marcas where productos.idMarca=marcas.idMarca");

        %>
        <h2>Lista de los productos</h2>
        <table style="width:80%; text-align:center;">
            <tr>
                <th>idProducto</th>
                <th>nombreProducto</th> 
                <th>precioUnitario</th>
                <th>unidades</th> 
                <th>descuento</th>
                <th>marca</th>
            </tr>
            <%
            while (rs.next()) {
            %>
            <tr>
                <td><%out.println(rs.getString(1));%></td>
                <td><%out.println(rs.getString(2));%></td>
                <td><%out.println("$ "+rs.getString(3));%></td>
                <td><%out.println(rs.getString(4));%></td>
                <td><%out.println(rs.getString(5)+" %");%></td>
                <td><%out.println(rs.getString(6));%></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            out.println("<br>");
            rs = stmt.executeQuery("Select * from marcas");
            out.println("<br>");
        %>
        <br>
        <h2>Lista de las marcas</h2>
        <table style="width:80%; text-align:center;">
            <tr>
                <th>idMarca</th>
                <th>marca</th>
            </tr>
            <%
            while (rs.next()) {
            %>
            <tr>
                <td><%out.println(rs.getString(1));%></td>
                <td><%out.println(rs.getString(2));%></td>
            </tr>
            <%
            }
        %>
        </table>
        <%

            } catch (Exception e) {
                out.println("Error: " + e);
            }
%>
    </body>
</html>
