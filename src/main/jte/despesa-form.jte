@import java.util.*
@import br.edu.ifpb.minhasdespesas.model.Categoria
@import br.edu.ifpb.minhasdespesas.model.Despesa
@param List<Categoria> categorias

@param String active
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nova Despesa | Minhas Despesas</title>
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
        <p class="eyebrow">Lançamento</p>
        <h1>Nova despesa</h1>
        <p class="subtitle">Registre um gasto e vincule-o a uma das suas categorias.</p>
    </section>
    <section class="card">
        @if(categorias.isEmpty())
            <div class="notice">
                <strong>⚠ Você ainda não tem categorias.</strong>
                <p>Cadastre uma categoria primeiro. Depois, ela aparecerá aqui para você selecionar.</p>
                <a class="btn" href="/categorias/nova">Cadastrar categoria</a>
            </div>
        @else
            <form action="/despesas" method="post">
                <div class="field">
                    <label for="descricao">Descrição *</label>
                    <input id="descricao" type="text" name="descricao"
                           placeholder="Ex.: Almoço no restaurante" required>
                </div>

                <div class="form-grid">
                    <div class="field">
                        <label for="valor">Valor (R$) *</label>
                        <input id="valor" type="number" name="valor"
                               step="0.01" min="0.01" placeholder="Ex.: 25,50" required>
                    </div>

                    <div class="field">
                        <label for="data">Data *</label>
                        <input id="data" type="date" name="data" required>
                    </div>

                    <div class="field full">
                        <label for="categoriaId">Categoria *</label>
                        <select id="categoriaId" name="categoriaId" required>
                            <option value="">Selecione uma categoria</option>
                            @for(var c : categorias)
                                <option value="${c.getId()}">
                                    ${c.getId()} · ${c.getNome()}
                                </option>
                            @endfor
                        </select>
                    </div>

                    <div class="field full">
                        <label>Forma de pagamento</label>
                        <div class="radio-row">
                            <label class="radio-option">
                                <input type="radio" name="formaPagamento" value="Pix" checked> Pix
                            </label>
                            <label class="radio-option">
                                <input type="radio" name="formaPagamento" value="Cartão"> Cartão
                            </label>
                            <label class="radio-option">
                                <input type="radio" name="formaPagamento" value="Dinheiro"> Dinheiro
                            </label>
                        </div>
                    </div>
                </div>

                <div class="actions">
                    <button class="btn" type="submit">Salvar despesa</button>
                    <a class="btn btn-light" href="/despesas">Cancelar</a>
                </div>
            </form>
        @endif
    </section>
    
</main>

</body>
</html>
