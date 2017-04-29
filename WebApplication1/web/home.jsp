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
                <legend><h3>Novo Cliente</h3></legend>
                <form>
                    Nome: <br>
                    <input type="text" name="nome"/><br>
                    CPF: <br>
                    <input type="text" name="cpf"/><br>
                    RG: <br>
                    <input type="text" name="rg"/><br>
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
                        String cpf = request.getParameter("cpf");
                        String rg = request.getParameter("rg");
                        String email = request.getParameter("email");
                        String telefone = request.getParameter("telefone");
                        String endereco = request.getParameter("endereco");

                        Cliente c = new Cliente();
                        c.setCliente(nome, cpf, rg, email, telefone, endereco);
                        Database.getCliente().add(c);
                        response.sendRedirect(request.getRequestURI());
                    } else if (request.getParameter("excluir") != null) {
                        String id = request.getParameter("id");
                        int i = Integer.parseInt(id);
                        Database.getCliente().remove(i);
                        response.sendRedirect(request.getRequestURI());
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
                    <th>CPF</th>
                    <th>RG</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th>Endereço</th>
                    <th>Comandos</th>
                </tr>
                <%for (int i = 0; i < Database.getCliente().size(); i++) {%>
                <%Cliente c = Database.getCliente().get(i);%>
                <tr>
                    <td><%= i%></td>
                    <td><%= c.getNome()%></td>
                    <td><%= c.getCpf()%></td>
                    <td><%= c.getRg()%></td>
                    <td><%= c.getEmail()%></td>
                    <td><%= c.getTelefone()%></td>
                    <td><%= c.getEndereco()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%=i%>"/>
                            <input type="submit" name="excluir" value="Excluir"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
