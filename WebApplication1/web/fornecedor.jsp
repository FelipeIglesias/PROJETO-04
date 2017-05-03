<%-- 
    Document   : home
    Created on : 28/04/2017, 19:12:00
    Author     : felipe
--%>
<%@page import="br.com.fatecpg.cadastro.Cliente"%>
<%@page import="br.com.fatecpg.cadastro.Fornecedores"%>
<%@page import="br.com.fatecpg.cadastro.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/menu.jspf" %>

<form>
    <h2>Novo Fornecedor</h2>
    <fieldset class="row">
        <legend><strong>Dados do Fornecedor</strong></legend>
        <div class="col s12 m12">        
            <label for="nome">Nome</label>
            <input type="text" name="nome" required/>
        </div>
        <div class="col s12 m6">        
            <label for="cnpj">CNPJ</label>
            <input type="text" name="cnpj" required/>
        </div>
        <div class="col s12 m6">        
            <label for="razaoSocial">Razão Social</label>
            <input type="text" name="razaoSocial" required/>
        </div>
        <div class="col s12 m6">        
            <label for="email">Email</label>
            <input type="email" name="email" required/>
        </div>
        <div class="col s12 m6">        
            <label for="nome">Telefone</label>
            <input type="text" name="telefone" required/>
        </div>
        <div class="col s12 m12">        
            <label for="nome">Endereço</label>
            <input type="text" name="endereco" required/>
        </div>
        <div class="col s12 m12 center-align">
            <input class="btn btn-large waves-effect waves-light" type="submit" name="incluir" value="Incluir"/>
        </div>
    </fildset>
</form>

            <%
                try {
                    if (request.getParameter("incluir") != null) {
                        String nome = request.getParameter("nome");
                        String cnpj = request.getParameter("cnpj");
                        String razaoSocial = request.getParameter("razaoSocial");
                        String email = request.getParameter("email");
                        String telefone = request.getParameter("telefone");
                        String endereco = request.getParameter("endereco");

                        Fornecedores f = new Fornecedores();
                        f.setFornecedores(nome, cnpj, razaoSocial, email, telefone, endereco);
                        Database.getFornecedores().add(f);
                        response.sendRedirect(request.getRequestURI());
                    } else if (request.getParameter("excluir") != null) {
                        String id = request.getParameter("id");
                        int i = Integer.parseInt(id);
                        Database.getFornecedores().remove(i);
                        response.sendRedirect(request.getRequestURI());
                    } else if (request.getParameter("alterar")!=null){
                        int i = Integer.parseInt(request.getParameter("id"));
                        Database.pegaIndiceF = i;
                        Database.forn = Database.getFornecedores().get(i);
                        response.sendRedirect("alteraFornecedor.jsp");
                    }
                } catch (Exception ex) {%>
            <div style="color: red;">
                Erro: <%= ex.getMessage()%>
            </div>
            <%}%>
            <br/>
        </div>
        <br>
        <div>
            <table class="centered highlight responsive-table">
                <thead>
                <tr>
                    <th>Indice</th>
                    <th>Nome</th>
                    <th>CNPJ</th>
                    <th>Razao Social</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th>Endereço</th>
                    <th>Comandos</th>
                </tr>
                </thead>
                <%for (int i = 0; i < Database.getFornecedores().size(); i++) {%>
                <%Fornecedores f = Database.getFornecedores().get(i);%>
                <tr>
                    <td><%= i%></td>
                    <td><%= f.getNome()%></td>
                    <td><%= f.getCnpj()%></td>
                    <td><%= f.getRazaoSocial()%></td>
                    <td><%= f.getEmail()%></td>
                    <td><%= f.getTelefone()%></td>
                    <td><%= f.getEndereco()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%=i%>"/>
                            <input type="submit" name="excluir" value="Excluir"
                                   class="btn red waves-effect waves-light"/>
                            <a href="alteraFornecedor.jsp"><input type="submit" 
                                   name="alterar" value="Alterar" class="btn blue waves-effect waves-light">
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
