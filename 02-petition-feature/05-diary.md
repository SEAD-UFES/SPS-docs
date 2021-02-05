<!-- @format -->

### 2020-11-17

- Nome da aplicação alterado de "appeal" para "petition" por conta de um erro de carregamento do consign. "appeal" dava
  conflito com o cwd "app" do consign.

### 2020-11-23

- Problema de data na versão do node-js (11), estava mostrando a timezone errada para o brasil/sao_paulo. Atualizado
  para (14) e resolveu.
- Necessário apagar/recompilar node_modules por causa do bcrypt (no windows pelo menos)

### 2020-12-22

- Adicionando novo filtro em inscriptions, para baixar apenas as inscrições do usuário.
