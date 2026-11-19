@import java.util.*
@import br.edu.ifpb.minhasdespesas.model.Categoria
@import br.edu.ifpb.minhasdespesas.model.Despesa
@param List<Categoria> categorias
@param List<Despesa> despesas

@param String active
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categorias | Minhas Despesas</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<header class="topbar">
    <div class="topbar-inner">
        <a class="brand" href="/"><span>💰</span>Minhas Despesas</a>
        <nav class="nav">
            <a href="/" class="${active.equals("inicio") ? "active" : ""}">Início</a>
            <a href="/categorias" class="${active.equals("categorias") ? "active" : ""}">Categorias</a>
            <a href="/categorias/nova" class="${active.equals("nova-categoria") ? "active" : ""}">Nova Categoria</a>
            <a href="/despesas" class="${active.equals("despesas") ? "active" : ""}">Despesas</a>
            <a href="/despesas/nova" class="${active.equals("nova-despesa") ? "active" : ""}">Nova Despesa</a>
        </nav>
    </div>
</header>

<main class="container">
    <section class="page-heading">
        <p class="eyebrow">Seus cadastros</p>
        <h1>Categorias</h1>
        <p class="subtitle">Visualize e acompanhe os grupos usados para classificar seus gastos.</p>
    </section>
    <section class="card">
        <div class="section-head">
            <div>
                <h2>Suas categorias <span class="pill">${categorias.size()} cadastradas</span></h2>
            </div>
            <a class="btn" href="/categorias/nova">＋ Nova categoria</a>
        </div>
        <div class="table-wrap">
            <table>
                <thead><tr><th>#</th><th>Nome</th><th>Descrição</th><th>Limite</th><th>Qtd. despesas</th></tr></thead>
                <tbody>
                @if(categorias.isEmpty())
                    <tr>
                        <td colspan="5" class="empty-state">
                            Nenhuma categoria cadastrada ainda.
                        </td>
                    </tr>
                @else
                    @for(var c : categorias)
                        <tr>
                            <td>${c.getId()}</td>
                            <td><strong>${c.getNome()}</strong></td>
                            <td>${c.getDescricao() == null || c.getDescricao().isBlank() ? "—" : c.getDescricao()}</td>
                            <td>${c.getLimite() == null ? "—" : String.format(java.util.Locale.forLanguageTag("pt-BR"), "R$ %.2f", c.getLimite())}</td>
                            <td>
                    <span class="pill">
                        ${despesas.stream().filter(d -> d.getCategoria() != null && d.getCategoria().getId() == c.getId()).count()}
                    </span>
                            </td>
                        </tr>
                    @endfor
                @endif
                </tbody>
            </table>
        </div>
    </section>
</main>

</body>
</html>
