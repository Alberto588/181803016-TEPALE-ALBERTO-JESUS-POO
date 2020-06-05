<%-- 
    Document   : index
    Created on : 23 may. 2020, 19:23:08
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Potencia de un numero</title>
    </head>
    <body>
        <h1>Programa que calcula la potencia de un número:</h1>
        <%
            if(request.getParameter("numero") != null && request.getParameter("potencia") != null){
                
                double num=Double.parseDouble(request.getParameter("numero"));
                double pot=Double.parseDouble(request.getParameter("potencia"));;
                double resul=1;
                
                for(int i=0;i<pot;i++){
                    resul=resul*num;
                }
                %>
                <h3>La potencia es: </h3>
                <%
                out.println(resul);
                %>
                <form>
                    <input type="hidden" name="regresar" value="volver"/>
                    <input type="submit" value="Regresar">
                </form>
                <%
                
            }else{%>
                <form>
                    <h3>Teclea un número: </h3>
                    <input type="number" name="numero" required step="0.01"/>
                    <h3>Teclea la potencia:</h3>
                    <input type="number" name="potencia" required step="0.01"/><br>
                    <input type="submit" value="Enviar"/>
                </form>
        
                <%
            }
        %>
        
    </body>
</html>
