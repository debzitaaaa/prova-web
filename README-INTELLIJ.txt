COMO ABRIR NO INTELLIJ IDEA

1. Extraia o arquivo ZIP em uma pasta do computador.
2. Abra o IntelliJ IDEA.
3. Clique em File > Open.
4. Selecione a pasta "minhas-despesas" extraída (a pasta que contém pom.xml).
5. Aguarde o Maven baixar as dependências.
6. Confira se o IntelliJ está usando JDK 17:
   File > Project Structure > Project SDK > 17.
7. Abra:
   src/main/java/br/edu/ifpb/minhasdespesas/MinhasDespesasApplication.java
8. Clique no triângulo verde ao lado do método main e escolha Run.
9. Abra http://localhost:8080 no navegador.

PÁGINAS
- /
- /categorias/nova
- /categorias
- /despesas/nova
- /despesas

IMPORTANTE
- Os dados ficam em listas na memória, sem banco de dados.
- Ao parar e iniciar novamente a aplicação, os cadastros são apagados.
- Primeiro cadastre uma categoria; depois cadastre despesas.
- Projeto preparado para Java 17, Spring Boot 3 e JTE.
