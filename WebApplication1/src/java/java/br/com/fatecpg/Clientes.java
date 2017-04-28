package java.br.com.fatecpg;

public class Clientes {
    private String nome;
    private String cpf;
    private String rg;
    private String email;
    private String telefone;
    private String endereco;

    public void setClientes(String nome, String cpf, String rg, String email,
                            String telefone, String endereco){
        
        this.setNome(nome);
        this.setCpf(cpf);
        this.setRg(rg);
        this.setEmail(email);
        this.setTelefone(telefone);
        this.setEndereco(endereco);                       
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    } 
}
