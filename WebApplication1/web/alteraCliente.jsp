<%-- 
    Document   : alteraCliente
    Created on : 01/05/2017, 18:42:20
    Author     : Felipe
--%>

<%@page import="br.com.fatecpg.cadastro.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/menu.jspf" %>

<form>
    <h2>Alterar Dados</h2>
    <fieldset class="row">
        <legend><strong>Altere os dados do cliente</strong></legend>
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
                            Database.alteraCliente(Database.getCliente().get(Database.pegaIndiceC), novoNome, novoCpf, novoRg, novoEmail, novoTelefone, novoEndereco);
                            response.sendRedirect("clientes.jsp");
                        }
                    }catch(Exception ex){ %>
                        <div style="color: red;">
                            Erro: <%= ex.getMessage()%>
                        </div>
                    <%}%>
                    <div class="col s12 m12">        
                        <label for="nome">Nome</label>
                        <input type="text" name="novoNome" value="<%=Database.clt.getNome()%>" required/>
                    </div>
                    <div class="col s12 m6">
                        <label for="cpf">CPF</label>
                        <input type="text" name="novoCpf" value="<%=Database.clt.getCpf()%>" required/>
                    </div>
                    <div class="col s12 m6">
                        <label for="rg">RG</label>
                        <input type="text" name="novoRg" value="<%=Database.clt.getRg()%>" required/>
                    </div>
                    <div class="col s12 m6">
                        <label for="email">Email</label>
                        <input type="email" name="novoEmail" value="<%=Database.clt.getEmail()%>" required/>
                    </div>
                    <div class="col s12 m6">
                        <label for="telefone">Telefone</label>
                        <input type="text" name="novoTelefone" value="<%=Database.clt.getTelefone()%>" required/>
                    </div>
                    <div class="col s12 m12">
                        <label for="edenreco">Endereço</label>
                        <input type="text" name="novoEndereco" value="<%=Database.clt.getEndereco()%>" required/>
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
