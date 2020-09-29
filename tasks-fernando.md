<!-- @format -->

###

Aplicar paranoid e timestamps nos modelos.

Modificações do banco: (timestamps, deletedAt, isActive, Constraints)

- Criar migration rebuild: (npx sequelize migration:generate --name rebuild-PasswordRecover) Mofificações do modelo:
  (timestamps, paranoid, deleteMethod) Modificações da api: (Delete error, validations)

Modulos para alterar:

- User: ok
- PasswordRecover: ok
- UserRoles: ok
- RoleTypes: ok
- RolePermissions: ok
- Permission: em andamento...
- Ainda faltam os outros...

###

Reformular auth no backend e no frontend

###

Lembrete:

- npx sequelize model:generate --name User --attributes firstName:string
- npx sequelize migration:generate --name rebuild-PasswordRecover
- npx sequelize seed:generate --name demo-user

####

Possiveis bugs:

Pelo que li do código, se você ficar atualizando incrição, o numero de inscrição muda.

####

Ideias para o futuro:

- Fazer actions devolverem promises para usar 'then' ao inves de 'callback' ?
- Criar um reducer para a id da url para não precisar colocar ele como parametro em mapStateToProps? (tem mais do que
  parece)
- Mudar o formato de options (colocar options em cascata) { withVacancy:{ withAssignment: true } }
- Fazer o "create" usar o parametro id na query e mudar o local de declaração da rota create.
