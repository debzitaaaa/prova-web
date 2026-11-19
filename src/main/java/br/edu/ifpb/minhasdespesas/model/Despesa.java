package br.edu.ifpb.minhasdespesas.model;

import java.time.LocalDate;

public class Despesa {
    private final int id;
    private final String descricao;
    private final double valor;
    private final LocalDate data;
    private final String formaPagamento;
    private final Categoria categoria;

    public Despesa(int id, String descricao, double valor, LocalDate data,
                   String formaPagamento, Categoria categoria) {
        this.id = id;
        this.descricao = descricao;
        this.valor = valor;
        this.data = data;
        this.formaPagamento = formaPagamento;
        this.categoria = categoria;
    }

    public int getId() { return id; }
    public String getDescricao() { return descricao; }
    public double getValor() { return valor; }
    public LocalDate getData() { return data; }
    public String getFormaPagamento() { return formaPagamento; }
    public Categoria getCategoria() { return categoria; }
}
