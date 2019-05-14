<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ciclismo", "root", "root");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");

     
        // Inserta los datos en la base de datos
        String insercion = "INSERT INTO alumnos VALUES ('"
                + request.getParameter("codalum")
                + "', '" + request.getParameter("nombre")
                + "', '" + request.getParameter("direccion")
                + "', '" + request.getParameter("curso") + "')";
               
        
       
      
    %>
    <script>document.location = "Index.jsp"</script>
  </body>
</html>