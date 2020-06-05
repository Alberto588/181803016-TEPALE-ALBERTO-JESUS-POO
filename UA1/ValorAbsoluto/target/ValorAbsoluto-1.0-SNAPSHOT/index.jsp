<%-- 
    Document   : index
    Created on : 23 may. 2020, 15:08:04
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Valor Absoluto</title>
    </head>
    <body>
        <h1>Programa que calcula el valor absoluto de cualquier número</h1>
        <%
            if(request.getParameter("numero")!= null && "regresar".equals(request.getParameter("numero"))== false){
                double num=Double.parseDouble(request.getParameter("numero"));
                
                if(num >= 0){
                    %>
                    <h2>El valor absoluto es: </h2>
                <%
                    out.println(num);
                }else{
                    num=num*-1;
                    %>
                    <h2>El valor absoluto es: </h2>
                    <%
                    out.println(num);
                }
                %>
                    <form> 
                        <input type="hidden" name="numero" value="regresar"/>
                        <input type="submit" value="Regresar"/>
                    </form>
                <%
            }else{%>
                <form>
                    <h2>Teclea un número: </h2>
                    <input type="number" name="numero" required step="0.01"/>
                    <input type="submit" value="Enviar"/>
                </form>
            <%
            }
        %>
</body>
</html>
