<%-- 
    Document   : formularioPass
    Created on : 19 jun. 2020, 17:39:54
    Author     : Alberto
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id=Integer.parseInt(request.getParameter("id"));
    String usuario="";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Editar contraseña</title>
    </head>
    <body>
        <h1>Editar contraseña</h1>
        <div class="container">
            <h1></h1>
            <br>
            <form action="cambiarPass.jsp" method="get">
                <div class="form-row">
                    <div class="col">
                        <input type="password" class="form-control" placeholder="Contraseña anterior" name="anteriorPass" required/>
                    </div>
                    
                    <div class="col">
                        <input type="password" class="form-control" placeholder="Nueva contraseña" name="nuevaPass1" required/>
                    </div>
                    
                    <div class="col">
                        <input type="password" class="form-control" placeholder="Confirmar contraseña" name="nuevaPass2" required/>
                    </div>
                    
                    <input type="hidden" method="POST" class="form-control" value="<%=id%>" name="id" required/>
                    
                    <div class="col">
                        <input type="submit" class="btn btn-success btn-block"  value="Enviar"/>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
