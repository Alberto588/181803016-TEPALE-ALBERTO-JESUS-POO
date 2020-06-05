<%-- 
    Document   : index
    Created on : 22 may. 2020, 8:33:10
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TareaFinal</title>
    </head>
    <body>
        <h1>El programa que debio ser y no fue(Sin try, sin Javascript, sin problemas de GlassFish)</h1>
        
        <%
            if(request.getParameter("numero") != null && "prueba".equals(request.getParameter("numero"))== false){
                %>
                <h1>El ciclo del valor ingresado es: </h1>
        <%
                int numero=Integer.parseInt(request.getParameter("numero"));
                for(int i=0;i<=numero;i++){
                    out.println(i+" ");
                }%>
                <form> 
                    <input type="hidden" name="numero" value="prueba"/>
                    <input type="submit" value="Regresar"/>
                </form>
                <%
            }else{
                %>
                <form> 
                    <input type="number" name="numero" required/>
                    <input type="submit" value="Enviar"/>
                </form>
                <h1>No has ingresado un número </h1>
            <%}
        %>
    </body>
</html>
