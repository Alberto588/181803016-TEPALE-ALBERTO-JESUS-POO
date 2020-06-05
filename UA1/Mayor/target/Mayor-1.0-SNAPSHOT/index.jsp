<%-- 
    Document   : index
    Created on : 27 may. 2020, 8:14:28
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solicitar numero</title>
    </head>
    <body>
        <h1>Ingrese el numero de números que desea ingresar:</h1>
        
        <form action="solicita.jsp"> 
            <input type="number" name="numero" required/>
            <input type="submit" value="Enviar el número"/>
        </form>
    </body>
</html>
