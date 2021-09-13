<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualizacao de Usuarios</title>
    </head>
    <body>
        <%@ page import="com.crudjspjava.dao.UsuarioDao, com.crudjspjava.bean.*, java.util.*" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
        <h1>Listagem de Usuarios</h1>
        
        <%
            String pageid = request.getParameter("page");
            int id = Integer.parseInt(pageid);
            int total = 5;
            
            if(id==1){}
            else {
                id = id - 1;
                id = id * total + 1;
            }
            
            List<Usuario> list = UsuarioDao.getRecords(id, total);
            request.setAttribute("list", list);
        %>
        
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Password</th>
                <th>Email</th>
                <th>Sexo</th>
                <th>País</th>
                <th>Editar</th>
                <th>Excluir</th>
            </tr>
            <c:forEach items="${list}" var="usuario" >
                <tr>
                    <td>${usuario.getId()}</td>
                    <td>${usuario.getNome()}</td>
                    <td>${usuario.getPassword()}</td>
                    <td>${usuario.getEmail()}</td>
                    <td>${usuario.getSexo}</td>
                    <td>${usuario.getPais()}</td>
                    <td><a href="editform.jsp?id=${usuario.getId()}">Editar</a></td>
                    <td><a href="deleteusuario.jsp?id=${usuario.getId()}">Excluir</a></td>
                </tr>
        </table>
       <br>
       <a href="viewusuarios.jsp?page=1"></a>
       <a href="viewusuarios.jsp?page=2"></a>
       <a href="viewusuarios.jsp?page=3"></a>
       <br>
       <a href="addusuarioform.jsp">Adicionar novo Usuario</a>
    </body>
</html>
