package br.com.fatecpg.cadastro;
import java.util.ArrayList;

public class Database {
    public static Fornecedores forn;
    public static int pegaIndiceF;
    private static ArrayList<Fornecedores> fornecedores;
    public static ArrayList<Fornecedores> getFornecedores(){
        if(fornecedores == null){
            fornecedores = new  ArrayList<>();
            Fornecedores f1 = new Fornecedores();
            f1.setFornecedores("Novinho Alimentos LTDA","Novinho","00.776.574/0001-56",
                    "novpg@gmail.com","13 3455-6697","Praça 19 de Janeiro");
            Fornecedores f2 = new Fornecedores();
            f2.setFornecedores("Olatunde Eventos LTDA","Olatunde Eventos",
                    "00.766.533/0001-51","oooevent@gmail.com","13 3466-9997","MALU");
            fornecedores.add(f1);
            fornecedores.add(f2);
        }
        return fornecedores;
    }
    
    public static Fornecedores alteraFornecedor(Fornecedores f, String nome, 
            String cnpj, String razaoSocial, String email, String telefone, String endereco){     
        f.setNome(nome);
        f.setCnpj(cnpj);
        f.setRazaoSocial(razaoSocial);
        f.setEmail(email);
        f.setTelefone(telefone);
        f.setEndereco(endereco);
        
        return f;
    }
    
    public static Cliente clt;
    public static int pegaIndiceC;
    
    private static ArrayList<Cliente> cliente;
    public static ArrayList<Cliente> getCliente(){
        if(cliente == null){
            cliente = new  ArrayList<>();
            Cliente c1 = new Cliente();
            c1.setCliente("Pedrinho","999.888.777-66","99.888.777-6",
                    "pedrinho@email.com","1111-2222","Rua Um");
            Cliente c2 = new Cliente();
            c2.setCliente("Joãozinho","111.222.333-44","22.333.444-5",
                    "joaozinho@email.com","1234-5678","Rua Dois");
            cliente.add(c1);
            cliente.add(c2);
        }
        return cliente;
    }
    
    public static Cliente alteraCliente(Cliente c, String nome, String cpf, 
            String rg, String email, String telefone, String endereco){     
        c.setNome(nome);
        c.setCpf(cpf);
        c.setRg(rg);
        c.setEmail(email);
        c.setTelefone(telefone);
        c.setEndereco(endereco);
        
        return c;
    }
}
