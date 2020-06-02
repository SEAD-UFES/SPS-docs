<!-- @format -->

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

Remover Notices do front-end Remover notices do back-end. (Aguardando resultado.)

###

- Nova feature inscrições:
- - Verificar o que temos no backend.
- - Definir o escopo do que será feito:
- - - Operador pode (criar/atualizar/excluir) um inscription-event associado a um calendar.
- - - Usuários logados podem (criar/deletar) inscriptions associadas a um inscription-event.
- - Criar o modelo ER no diagrama do workbench.
- - Criar interfaces React:
- - Implementar modelos no backend:
- - Implementar logica React:

###

- npx sequelize migration:generate --name rebuild-PasswordRecover
- npx sequelize seed:generate --name demo-user
