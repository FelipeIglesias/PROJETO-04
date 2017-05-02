<%-- 
    Document   : alteraFornecedor
    Created on : 02/05/2017, 00:17:49
    Author     : João
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
        <h1>Alterar Fornecedor</h1>
        <fildset>
                <legend><h3>Novo</h3></legend>
                <form>
                    
                    <%
                        String novoNome = request.getParameter("novoNome");
                        String novoCnpj = request.getParameter("novoCnpj");
                        String novaRazaoSocial = request.getParameter("novaRazaoSocial");
                        String novoEmail = request.getParameter("novoEmail");
                        String novoTelefone = request.getParameter("novoTelefone");
                        String novoEndereco = request.getParameter("novoEndereco");                        
                    %>
                    
                    <%try{
                        if(request.getParameter("confirmar")!=null){
                            Database.alteraFornecedor(Database.getFornecedores().get(Database.pegaIndiceF), novoNome, novoCnpj, novaRazaoSocial, novoEmail, novoTelefone, novoEndereco);
                            response.sendRedirect("fornecedor.jsp");
                        }
                    }catch(Exception ex){ %>
                    
                        <div style="color: red;">
                            Erro: <%= ex.getMessage()%>
                        </div>
                    <%}%>
                    
                    Nome: <br>
                    <input type="text" name="novoNome" value="<%=Database.forn.getNome()%>"/><br>
                    CNPJ: <br>
                    <input type="text" name="novoCnpj" value="<%=Database.forn.getCnpj()%>"/><br>
                    Razão Social: <br>
                    <input type="text" name="novaRazaoSocial" value="<%=Database.forn.getRazaoSocial()%>"/><br>
                    Email: <br>
                    <input type="text" name="novoEmail" value="<%=Database.forn.getEmail()%>"/><br>
                    Telefone: <br>
                    <input type="text" name="novoTelefone" value="<%=Database.forn.getTelefone()%>"/><br>
                    Endereço: <br>
                    <input type="text" name="novoEndereco" value="<%=Database.forn.getEndereco()%>"/><br>
                    <input type="submit" name="confirmar" value="Confirmar"/><br>
                </form>
            </fildset>
    </body>
</html>
