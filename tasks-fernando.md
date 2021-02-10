<!-- @format -->

### Coisas para resolver:

### Passo para frente:

Criar sistema de Recursos.

### Tarefas para o futuro (Passo para trás):

- Remover o botão "inscrever-se" de "inscription-event" quando o periodo de inscrição não estiver ativo.
- Fazer o "create" usar o parametro id na queryString e mudar o local de declaração da rota create.
- Problema de navegação (voltar/carregar em pontos estranhos da pagina). Talvez sempre colocar o foco no topo?
- Reformular auth no backend e no frontend
- Fazer actions devolverem promises para usar 'then' ao inves de 'callback' ?
- Criar um reducer para a id da url para não precisar colocar ele como parametro em mapStateToProps? (tem mais do que
  parece)
- Mudar o formato de options (colocar options em cascata) { withVacancy:{ withAssignment: true } }
- implementar um controle de seeds para que seja possivel inplementa-las e remove-las como se faz com as migrations (o
  sequelize permite, mas tem que estudar)
  - Implementar uma mascara para o CPF.

### Lembretes:

- npx sequelize model:generate --name User --attributes firstName:string
- npx sequelize migration:generate --name rebuild-PasswordRecover
- npx sequelize seed:generate --name demo-user

- npx sequelize db:seed --seed 00000000000000-seed-name
