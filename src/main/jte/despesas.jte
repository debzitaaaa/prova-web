@import java.util.*
@import br.edu.ifpb.minhasdespesas.model.Categoria
@import br.edu.ifpb.minhasdespesas.model.Despesa
@param List<Despesa> despesas
@param String total
@param java.time.format.DateTimeFormatter formatoData

@param String active
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Despesas | Minhas Despesas</title>
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
        <p class="eyebrow">Movimentações</p>
        <h1>Despesas</h1>
        <p class="subtitle">Acompanhe os gastos registrados e suas respectivas categorias.</p>
    </section>
    <section class="card">
        <div class="section-head">
            <h2>Suas despesas <span class="pill">${despesas.size()} registradas</span></h2>
            <a class="btn" href="/despesas/nova">＋ Nova despesa</a>
        </div>
        <div class="table-wrap">
            <table>
                <thead><tr><th>Descrição</th><th>Categoria</th><th>Valor</th><th>Data</th><th>Pagamento</th><th>Ação</th></tr></thead>
                <tbody>
                @if(despesas.isEmpty())
                    <tr>
                        <td colspan="6" class="empty-state">
                            Nenhuma despesa cadastrada ainda.
                        </td>
                    </tr>
                @else
                    @for(var d : despesas)
                        <tr>
                            <td>${d.getDescricao()}</td>
                            <td>${d.getCategoria().getNome()}</td>
                            <td>${d.getValor()}</td>
                            <td>${d.getData() == null ? "—" : d.getData().toString()}</td>
                            <td>${d.getFormaPagamento()}</td>
                            <td>
                                <form action="/despesas/excluir/${d.getId()}" method="post">
                                    <button type="submit" class="btn">Excluir</button>
                                </form>
                            </td>
                        </tr>
                    @endfor
                @endif
                </tbody>
            </table>
        </div>
        <div class="table-total"><span>Total registrado</span><strong>${total}</strong></div>
    </section>
</main>

</body>
</html>
