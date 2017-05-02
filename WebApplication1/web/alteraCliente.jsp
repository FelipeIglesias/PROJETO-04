<%-- 
    Document   : alteraCliente
    Created on : 01/05/2017, 18:42:20
    Author     : Felipe
--%>

<%@page import="br.com.fatecpg.cadastro.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Alterar Cliente</h1>
        <fildset>
                <legend><h3>Altere os valores do cliente</h3></legend>
                <form>
                    <%
                        String novoNome = request.getParameter("novoNome");
                        String novoCpf = request.getParameter("novoCpf");
                        String novoRg = request.getParameter("novoRg");
                        String novoEmail = request.getParameter("novoEmail");
                        String novoTelefone = request.getParameter("novoTelefone");
                        String novoEndereco = request.getParameter("novoEndereco");                        
                    %>
                    
                    <%try{
                        if(request.getParameter("confirmar")!=null){
                            Database.alteraCliente(Database.getCliente().get(Database.pegaIndice), novoNome, novoCpf, novoRg, novoEmail, novoTelefone, novoEndereco);
                            response.sendRedirect("home.jsp");
                        }
                    }catch(Exception ex){ %>
                        <div style="color: red;">
                            Erro: <%= ex.getMessage()%>
                        </div>
                    <%}%>
                    Nome: <br>
                    <input type="text" name="novoNome" value="<%=Database.clt.getNome()%>"/><br>
                    CPF: <br> 
                    <input type="text" name="novoCpf" value="<%=Database.clt.getCpf()%>"/><br>
                    RG: <br>
                    <input type="text" name="novoRg" value="<%=Database.clt.getRg()%>"/><br>
                    Email: <br>
                    <input type="text" name="novoEmail" value="<%=Database.clt.getEmail()%>"/><br>
                    Telefone: <br>
                    <input type="text" name="novoTelefone" value="<%=Database.clt.getTelefone()%>"/><br>
                    Endereço: <br>
                    <input type="text" name="novoEndereco" value="<%=Database.clt.getEndereco()%>"/><br>*/
                    <input type="submit" name="confirmar" value="Confirmar"/><br>
                </form>
            </fildset>
        
    </body>
</html>
