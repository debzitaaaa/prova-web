@import java.util.*;
@param Integer qtdCategorias
@param Integer qtdDespesas
@param String total

@param String active
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Início | Minhas Despesas</title>
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
        <p class="eyebrow">Organização financeira</p>
        <h1>Para onde foi meu dinheiro? 🤔</h1>
        <p class="subtitle">Cadastre categorias e registre cada gasto do mês.</p>
    </section>

    <section class="stats">
        <article class="stat-card">
            <div class="stat-top"><span>Categorias</span><span class="stat-icon">🏷️</span></div>
            <strong class="stat-value">${qtdCategorias}</strong>
            <span class="stat-caption">categorias cadastradas</span>
        </article>
        <article class="stat-card">
            <div class="stat-top"><span>Despesas</span><span class="stat-icon">🧾</span></div>
            <strong class="stat-value">${qtdDespesas}</strong>
            <span class="stat-caption">despesas registradas</span>
        </article>
        <article class="stat-card">
            <div class="stat-top"><span>Total registrado</span><span class="stat-icon">💵</span></div>
            <strong class="stat-value">${total}</strong>
            <span class="stat-caption">soma das despesas</span>
        </article>
    </section>

    <section class="card">
        <p class="eyebrow">Comece por aqui</p>
        <h2>Organize seus gastos em poucos passos</h2>
        <p class="subtitle">Primeiro crie uma categoria. Depois, registre uma despesa e escolha onde ela se encaixa.</p>
        <div class="actions">
            <a class="btn" href="/categorias/nova">＋ Criar categoria</a>
            <a class="btn btn-light" href="/despesas/nova">＋ Registrar despesa</a>
        </div>
    </section>
    <p class="footer-note">Minhas Despesas · Controle simples do seu dinheiro</p>
</main>

</body>
</html>
