<%-- 
    Document   : index
    Created on : 23 may. 2020, 18:50:29
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Palabras</title>
    </head>
    <body>
        <h1>Programa que muestra la palabra en pantalla  el número de veces deseadas</h1>
        <%
            if(request.getParameter("palabra") != null && request.getParameter("numero") != null){
                String palabra=request.getParameter("palabra");
                
                int num=Integer.parseInt(request.getParameter("numero"));
                %>
                <h3>Tu palabra es: </h3>
                <%
                for(int i=0;i<=num;i++){
                    out.println(palabra+"<br>");
                }%>
                <form>
                    <input type="hidden" name="regresar" value="volver"/>
                    <input type="submit" value="Regresar"/>
                </form>
                
                <%
            
            }else{%>
                <form>
                    <h3>Teclea una palabra: </h3>
                    <input type="text" name="palabra" required/>
                    <h3>Teclea el numero de veces que quieres ver la palabra: </h3>
                    <input type="number" name="numero" required/><br>
                    <input type="submit" value="Enviar"/>
                </form>
            <%
            }
        %>
    </body> 
</html>
