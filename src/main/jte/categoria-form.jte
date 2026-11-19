@import java.util.*;

@param String active
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nova Categoria | Minhas Despesas</title>
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
        <p class="eyebrow">Cadastro</p>
        <h1>Nova categoria</h1>
        <p class="subtitle">Crie uma categoria para organizar melhor suas despesas.</p>
    </section>
    <section class="card">
        <form action="/categorias" method="post">
            <div class="field">
                <label for="nome">Nome *</label>
                <input id="nome" type="text" name="nome" placeholder="Ex.: Alimentação" required maxlength="70">
            </div>
            <div class="field">
                <label for="descricao">Descrição</label>
                <input id="descricao" type="text" name="descricao" placeholder="Ex.: Mercado, restaurante, lanches">
            </div>
            <div class="field">
                <label for="limite">Limite de alerta (R$) <span class="subtitle">· opcional</span></label>
                <input id="limite" type="number" step="0.01" min="0" name="limite" placeholder="Ex.: 400,00">
            </div>
            <div class="actions">
                <button class="btn" type="submit">Salvar categoria</button>
                <a class="btn btn-light" href="/categorias">Cancelar</a>
            </div>
        </form>
    </section>
</main>

</body>
</html>
