package java.br.com.fatecpg;

import java.util.ArrayList;

/*@author Felipe*/
public class Database {
    private static ArrayList<Fornecedores> fornecedores;
    public static ArrayList<Fornecedores> getFornecedores(){
        if(fornecedores == null){
            fornecedores = new  ArrayList<>();
            Fornecedores f1 = new Fornecedores();
            f1.setFornecedores("Novinho Alimentos LTDA","Novinho","00.776.574/0001-56","novpg@gmail.com","13 3455-6697","Praça 19 de Janeiro");
            Fornecedores f2 = new Fornecedores();
            f2.setFornecedores("Olatunde Eventos LTDA","Olatunde Eventos","00.766.533/0001-51","oooevent@gmail.com","13 3466-9997","MALU");
            fornecedores.add(f1);
            fornecedores.add(f2);
        }
        return fornecedores;
    }
    
    
}
