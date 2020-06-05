<%-- 
    Document   : index
    Created on : 23 may. 2020, 13:10:25
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IMC de una persona</title>
    </head>
    <body>
        <h1>Programa que cálcula el IMC(Indice de Masa Corporal)</h1>
        <%
            if(request.getParameter("kilo") != null && request.getParameter("metros") != null ){ 
                double k=Double.parseDouble(request.getParameter("kilo"));
                double m=Double.parseDouble(request.getParameter("metros"));
                
                double IMC=0;
                
                IMC=k/(m*m);%>
                <br><h2>El indice de masa corporal es de:</h2>
            <%
                out.println(IMC);
                %>
                <form> 
                    <input type="hidden" name="volver" value="regresar"/>
                    <input type="submit" value="Regresar"/>
                </form>
        <%  
            }else{%>
                <form> 
                    <h3>Teclea tu peso en kilogramos: </h3>
                    <input type="number" name="kilo" required step="0.01" <p>   kg.</p> 

                    <h3>Teclea tu altura en metros: </h3>
                    <input type="number" name="metros" required step="0.01" <p> m.</p>
                    <input type="submit" value="Enviar"/>
                </form>
                <%
            }
        %>
    </body>
</html>
