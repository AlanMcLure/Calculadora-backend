<%-- 
    Document   : resultado.jsp
    Created on : 25 sept 2023, 12:20:06
    Author     : a023855458l
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculadora Backend</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <%
            String operador1Str = request.getParameter("op1");
            String operador2Str = request.getParameter("op2");
            String operadorCalculo = request.getParameter("opcalculo");
            
            boolean valid = true; // Variable para rastrear si la entrada es válida
            
            // Expresión regular para verificar si es un número entero
            String regexEntero = "^\\d+$";
            
            // Verificar si operador1 es un número entero
            if (!operador1Str.matches(regexEntero)) {
                valid = false;
            }
            
            // Verificar si operador2 es un número entero
            if (!operador2Str.matches(regexEntero)) {
                valid = false;
            }
            
            // Verificar si el operador es válido
            if (!("+".equals(operadorCalculo) || "-".equals(operadorCalculo) || "*".equals(operadorCalculo) || "/".equals(operadorCalculo))) {
                valid = false;
            }
            
            double resultado = 0;
            
            if (valid) {
                int operador1 = Integer.parseInt(operador1Str);
                int operador2 = Integer.parseInt(operador2Str);
            
                if ("+".equals(operadorCalculo)) {
                    resultado = operador1 + operador2;
                } else if ("-".equals(operadorCalculo)) {
                    resultado = operador1 - operador2;
                } else if ("*".equals(operadorCalculo)) {
                    resultado = operador1 * operador2;
                } else if ("/".equals(operadorCalculo)) {
                    if (operador2 != 0) {
                        resultado = (double) operador1 / operador2;
                    } else {
                        valid = false; // División por cero
                    }
                }
            }
        %>
        
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="card-title text-center">Calculadora</h1>
                            <% if (valid) { %>
                                    <p class="text-center">Resultado: <%= resultado %></p>
                            <%  } else { %>
                                    <p class="text-center text-danger">Error: Por favor, ingrese valores numéricos válidos y un operador válido.</p>
                            <%  } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
