<%-- 
    Document   : alteraFornecedor
    Created on : 02/05/2017, 00:17:49
    Author     : João
--%>

<%@page import="br.com.fatecpg.cadastro.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/menu.jspf" %>

<form>
    <h2>Alterar Dados</h2>
    <fieldset class="row">
    <legend><strong>Altere os dados do fornecedor</strong></legend>
    <br>
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
                    
                    <div class="col s12 m12">
                        <i class="material-icons">account_circle</i>
                        <label for="nome">Nome</label>
                        <input type="text" name="novoNome" value="<%=Database.forn.getNome()%>" required/>
                    </div>
                    <div class="col s12 m6">
                        <i class="material-icons">assignment_ind</i>
                        <label for="cnpj">CNPJ</label>
                        <input type="text" name="novoCnpj" value="<%=Database.forn.getCnpj()%>" required/>
                    </div>
                    <div class="col s12 m6">
                        <i class="material-icons">perm_identity</i>
                        <label for="razaoSocial">Razão Social</label>
                        <input type="text" name="novaRazaoSocial" value="<%=Database.forn.getRazaoSocial()%>" required/>
                    </div>
                    <div class="col s12 m6">
                        <i class="material-icons ">email</i>
                        <label for="email">Email</label>
                        <input type="email" name="novoEmail" value="<%=Database.forn.getEmail()%>" required/>
                    </div>
                    <div class="col s12 m6">
                        <i class="material-icons ">phone</i>
                        <label for="telefone">Telefone</label>
                        <input type="text" name="novoTelefone" value="<%=Database.forn.getTelefone()%>" required/>
                    </div>
                    <div class="col s12 m12">
                        <i class="material-icons ">location_on</i>
                        <label for="nome">Endereço</label>
                        <input type="text" name="novoEndereco" value="<%=Database.forn.getEndereco()%>" required/>
                    </div>
                    <div class="col s12 m12 center-align">
                        <input class="btn btn-large waves-effect waves-light" type="submit" name="confirmar" value="Confirmar"/>
                    </div>
            </fildset>
        </form>
    </div>
    <%@include file="WEB-INF/jspf/rodape.jspf" %>
</body>
</html>
