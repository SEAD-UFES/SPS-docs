<!-- @format -->

###

Pensar na criação do calendário de eventos.  
Decisão: Tratar eventos (calendars) separadamente ou em uma unica tabela? R: Uma tabela.

###

Reformular auth no backend e no frontend

###

Aplicar paranoid e timestamps nos modelos.

Modificações do banco: (timestamps, deletedAt, isActive, Constraints)

- Criar migration rebuild: (npx sequelize migration:generate --name rebuild-PasswordRecover) Mofificações do modelo:
  (timestamps, paranoid, deleteMethod) Modificações da api: (Delete error, validations)

Modulos para alterar:

- User: ok
- PasswordRecover: ok
- UserRoles: ok
- Ainda faltam os outros...

###

Recriar call usando o novo modelo de container/action/reducer/component

###

Remover Notices do front-end Remover notices do back-end
