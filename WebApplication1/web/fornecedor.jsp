<%-- 
    Document   : home
    Created on : 28/04/2017, 19:12:00
    Author     : felipe
--%>
<%@page import="br.com.fatecpg.cadastro.Cliente"%>
<%@page import="br.com.fatecpg.cadastro.Fornecedores"%>
<%@page import="br.com.fatecpg.cadastro.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>POO</h1>
        <div>
            <fildset>
                <legend><h3>Novo</h3></legend>
                <form>
                    Nome: <br>
                    <input type="text" name="nome"/><br>
                    CNPJ: <br>
                    <input type="text" name="cnpj"/><br>
                    Razão Social: <br>
                    <input type="text" name="razaoSocial"/><br>
                    Email: <br>
                    <input type="text" name="email"/><br>
                    Telefone: <br>
                    <input type="text" name="telefone"/><br>
                    Endereço: <br>
                    <input type="text" name="endereco"/><br>
                    <input type="submit" name="incluir" value="Incluir"/><br>
                </form>
            </fildset>
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
        <div>
            <table border="1">
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
                            <input type="submit" name="excluir" value="Excluir"/>
                            <input type="submit" name="alterar" value="Alterar">
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
