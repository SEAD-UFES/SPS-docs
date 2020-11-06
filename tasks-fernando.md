<!-- @format -->

### Coisas para resolver:

### Passo para frente:

Criar sistema de Recursos.

- Revisar interface a esboçar como serão as telas do sistema de recurso.

### Tarefas para o futuro (Passo para trás):

- Remover o botão "inscrever-se" de "inscription-event" quando o periodo de inscrição não estiver ativo.
- Fazer o "create" usar o parametro id na query e mudar o local de declaração da rota create.
- Problema de navegação (voltar/carregar em pontos estranhos da pagina). Talvez sempre colocar o foco no topo?
- Reformular auth no backend e no frontend
- Fazer actions devolverem promises para usar 'then' ao inves de 'callback' ?
- Criar um reducer para a id da url para não precisar colocar ele como parametro em mapStateToProps? (tem mais do que
  parece)
- Mudar o formato de options (colocar options em cascata) { withVacancy:{ withAssignment: true } }

### Lembretes:

- npx sequelize model:generate --name User --attributes firstName:string
- npx sequelize migration:generate --name rebuild-PasswordRecover
- npx sequelize seed:generate --name demo-user
