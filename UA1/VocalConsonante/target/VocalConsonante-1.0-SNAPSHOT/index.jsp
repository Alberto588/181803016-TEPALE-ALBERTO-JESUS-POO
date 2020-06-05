<%-- 
    Document   : index
    Created on : 23 may. 2020, 17:29:26
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vocal o consonante</title>
    </head>
    <body>
        <h1>Programa que muestra si la letra ingresada es una vocal o una consonante</h1>
        <%
            if(request.getParameter("letra") != null && "regresar".equals(request.getParameter("letra"))== false){
                String a=request.getParameter("letra");
                
                char c=a.charAt(0);
                
                if('a' == c || 'e'== c || 'i'==c || 'o'==c || 'u'==c || 'A'==c || 'E'==c || 'I'==c || 'O'==c || 'U'==c){
                    %>
                    <h2>El carácter ingresado es una vocal</h2>
                    <%
                }else if('b'==c || 'c'==c || 'd'==c || 'f'==c || 'g'==c || 'h'==c || 'j'==c || 'k'==c || 'l'==c || 'm'==c ||
                        'n'==c || 'p'==c || 'q'==c || 'r'==c || 's'==c || 't'==c || 'u'==c || 'v'==c || 'w'==c || 'x'==c || 'y'==c || 'z'==c  ||
                        'B'==c || 'C'==c || 'D'==c || 'F'==c || 'G'==c || 'H'==c || 'J'==c || 'K'==c || 'L'==c || 'M'==c ||
                        'N'==c || 'P'==c || 'Q'==c || 'R'==c || 'S'==c || 'T'==c || 'U'==c || 'V'==c || 'W'==c || 'X'==c || 'Y'==c || 'Z'==c){%>
                    <h2>Es una consonante </h2>
                <%}else{%>
                    <h2>No es una vocal o consonante </h2>
                    <%
                }
                %>
                    <form> 
                        <input type="hidden" name="letra" value="regresar"/>
                        <input type="submit" value="Regresar"/>
                    </form>
                <%
            }else{
                %>
                <form>
                    <h2>Nota: si escribes más caracteres, solo tomará en cuenta la primera letra</h2>
                    <h2>Teclea una letra: </h2>
                    <input type="text" name="letra" required/>
                    <input type="submit" value="Enviar"/>
                </form>
                    
                <%
            }
        %>
        

    </body>
</html>
