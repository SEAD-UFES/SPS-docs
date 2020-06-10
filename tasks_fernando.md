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

- Nova feature inscrições:
- - Verificar o que temos no backend.
- - Definir o escopo do que será feito:
- - - Operador pode (criar/atualizar/excluir) um inscription-event associado a um calendar.
- - - Usuários logados podem (criar/deletar) inscriptions associadas a um inscription-event.
- - Criar o modelo ER no diagrama do workbench.
- - - Criado
- - Criar interfaces React:
- - - InscriptionEvent C(R)UDL
- - Implementar modelos no backend:
- - Implementar logica React:

Não posso apagar um InscriptionEvent com inscrições ativas.  
Não posso criar uma inscription de um processo que não está em andamento.  
Não posso apagar uma inscription de um inscriptionEvent vencido.  
Inscrições deletadas precisam de uma justificativa.

###

Lembrete:

- npx sequelize model:generate --name User --attributes firstName:string
- npx sequelize migration:generate --name rebuild-PasswordRecover
- npx sequelize seed:generate --name demo-user
