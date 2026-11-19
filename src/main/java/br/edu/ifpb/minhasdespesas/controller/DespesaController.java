package br.edu.ifpb.minhasdespesas.controller;

import br.edu.ifpb.minhasdespesas.model.Categoria;
import br.edu.ifpb.minhasdespesas.model.Despesa;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Controller
public class DespesaController {
    private final List<Categoria> categorias = new ArrayList<>();
    private final List<Despesa> despesas = new ArrayList<>();
    private int proximoIdCategoria = 1;
    private int proximoIdDespesa = 1;

    private final NumberFormat moeda =
            NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));
    private final DateTimeFormatter formatoData =
            DateTimeFormatter.ofPattern("dd/MM/yyyy");

    @GetMapping("/")
    public String inicio(Model model) {
        model.addAttribute("active", "inicio");
        model.addAttribute("qtdCategorias", categorias.size());
        model.addAttribute("qtdDespesas", despesas.size());
        model.addAttribute("total", moeda.format(calcularTotal()));

        return "index";
    }

    @GetMapping("/categorias/nova")
    public String novaCategoria(Model model) {
        model.addAttribute("active", "nova-categoria");

        return "categoria-form";
    }

    @PostMapping("/categorias")
    public String salvarCategoria(
            @RequestParam String nome,
            @RequestParam(required = false, defaultValue = "") String descricao,
            @RequestParam(required = false) Double limite) {

        categorias.add(new Categoria(
                proximoIdCategoria++, nome.trim(), descricao.trim(), limite));
        return "redirect:/categorias";
    }

    @GetMapping("/categorias")
    public String listarCategorias(Model model) {

        model.addAttribute("active", "categorias");

        model.addAttribute("categorias", categorias);
        model.addAttribute("despesas", despesas);

        return "categorias";
    }

    @GetMapping("/despesas/nova")
    public String novaDespesa(Model model) {
        model.addAttribute("active", "nova-despesa");
        model.addAttribute("categorias", categorias);

        return "despesa-form";
    }
    @PostMapping("/despesas")
    public String salvarDespesa(
            @RequestParam String descricao,
            @RequestParam double valor,
            @RequestParam String data,
            @RequestParam(defaultValue = "Pix") String formaPagamento,
            @RequestParam int categoriaId) {

        Categoria categoriaEscolhida = categorias.stream()
                .filter(c -> c.getId() == categoriaId)
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Categoria não encontrada."));

        despesas.add(new Despesa(
                proximoIdDespesa++, descricao.trim(), valor,
                LocalDate.parse(data), formaPagamento, categoriaEscolhida));
        return "redirect:/despesas";
    }

    @GetMapping("/despesas")
    public String listarDespesas(Model model) {
        model.addAttribute("active", "despesas");
        model.addAttribute("despesas", despesas);
        model.addAttribute("categorias", categorias);

        return "despesas";
    }

    @PostMapping("/despesas/excluir/{id}")
    public String excluirDespesa(@PathVariable int id) {
        despesas.removeIf(d -> d.getId() == id);
        return "redirect:/despesas";
    }

    private double calcularTotal() {
        return despesas.stream().mapToDouble(Despesa::getValor).sum();
    }
}
