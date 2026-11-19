package br.edu.ifpb.minhasdespesas.model;

public class Categoria {
    private final int id;
    private final String nome;
    private final String descricao;
    private final Double limite;

    public Categoria(int id, String nome, String descricao, Double limite) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.limite = limite;
    }

    public int getId() { return id; }
    public String getNome() { return nome; }
    public String getDescricao() { return descricao; }
    public Double getLimite() { return limite; }
}
