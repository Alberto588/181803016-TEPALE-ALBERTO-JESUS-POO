<%-- 
    Document   : index
    Created on : 20 may. 2020, 10:33:08
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Numeros</title>
    </head>
    <body>
        <h1><b>Bienvenido a este formulario</b></h1>
        <h3>Descripción: Al ingresar un número, imprime desde el número 0, hasta el número que eligas..</h3>
        <%
            int numeros=0;
            if(numeros == 0){
                out.println("NOTA: Usa números mayores a 0");
            }
        %>
        <form>
            <p>Ingresa un número: </p><br>
            <input type="Number" name="numero"/> 
            <input type="submit" value="Enviar"/>
        </form>
        <%
            String nume=request.getParameter("numero");
                
            if(nume != null){
                numeros=Integer.parseInt(nume);
            }
        %>
        <br>
        <p>Impresión de números:</p><br>
        <%
            if(numeros > 0){
                for(int i=0;i<=numeros;i++){
                    out.println(i);
                    out.println("\n");
                }
            }else if(numeros < 0){
                out.println("No puedes usar números negativos");
            }
        %>
        
    </body>
</html>
