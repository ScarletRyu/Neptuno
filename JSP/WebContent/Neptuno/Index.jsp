

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Base de datos ciclismo</title>
</head>
<body>

<%

    String connectionURL = "jdbc:mysql://localhost/ciclismo";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "root");
    
    Statement s = connection.createStatement();
    ResultSet listado = s.executeQuery("SELECT * FROM alumnos");
%>

<div class="container">
      <div class="row"></div>
      <div class="row s12 m12 l12">
        <div class="card grey lighten-5">
          <h3 class="center">BASE DE DATOS CICLISMO</h3>
          <table class="bordered centered responsive-table">
            <thead><th>Código</th><th>Nombre</th><th>Dirección</th><th>curso</th><th></th><th></th></thead>
              <%
                while (listado.next()) {
              %>
            <tr>
              <td><%=listado.getString("codalum")%></td>
              <td><%=listado.getString("nombre")%></td>
              <td><%=listado.getString("direccion")%></td>
              <td><%=listado.getString("curso")%></td>
             
            <form method="post" action="UpdateAlumno.jsp">
              <input type="hidden" name="codalum" value="<%=listado.getString("codalum")%>">
              <input type="hidden" name="nombre" value="<%=listado.getString("nombre")%>">
              <input type="hidden" name="direccion" value="<%=listado.getString("direccion")%>">
              <input type="hidden" name="telefono" value="<%=listado.getString("curso")%>">
             
              <td>
                <button class="btn waves-effect waves-light center blue" type="submit" name="editar">
                  Editar
                </button>
              </td>
            </form>
            <form method="post" action="BorrarAlumno.jsp">
              <input type="hidden" name="codalum" value="<%=listado.getString("codalum")%>">
              <td>
                <button class="btn waves-effect waves-light center red" type="submit" name="borrar">
                  Borrar
                </button>
              </td>
            </form>
            </tr>
            <%
              }
            %>
            <form method="post" action="AñadirAlumno.jsp">
              <tr>
                <td>
                  <div class="input-field">
                    <input type="number" name="codalum" id="codalum" required>
                    <label for="codalum">código</label>
                  </div>
                </td>
                <td>
                  <div class="input-field">
                    <input type="text" name="nombre" id="nombre">
                    <label for="nombre">nombre</label>
                  </div>
                </td>
                <td>
                  <div class="input-field">
                    <input type="text" name="direccion" id="direccion">
                    <label for="direccion">dirección</label>
                  </div>
                </td>
                <td>
                  <div class="input-field">
                    <input type="number" name="curso" id="curso">
                    <label for="curso">curso</label>
                  </div>
                </td>
                
                <td>
                  <button class="btn waves-effect waves-light center" type="submit" name="aceptar">
                    Añadir
                  </button>
                </td>
              </tr>
            </form>
           
          </table>  
        </div>
      </div>
    </div>

    
     


