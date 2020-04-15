<!-- @format -->

Modificações do banco: (timestamps, deletedAt, isActive, Constraints)

- Criar migration rebuild: (npx sequelize migration:generate --name rebuild-PasswordRecover) Mofificações do modelo:
  (timestamps, paranoid, deleteMethod) Modificações da api: (Delete error, validations)

Modulos para alterar:

- User: ok
- PasswordRecover: ok
- UserRoles: ok
