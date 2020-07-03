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

Lista de inscritos: formatar tabela.  
Deletar minha inscrição.  
Pergunta: Onde vou exibir o link para inscrições?  
Tarefa: Revisar comportamento dos breadcrumbs.

###

Lembrete:

- npx sequelize model:generate --name User --attributes firstName:string
- npx sequelize migration:generate --name rebuild-PasswordRecover
- npx sequelize seed:generate --name demo-user

####

Ideias para o futuro:

- Fazer actions devolverem promises para usar 'then' ao inves de 'callback' ?
- Criar um reducer para a id da url para não precisar colocar ele como parametro em mapStateToProps? (tem mais do que
  parece)
- Mudar o formato de options (colocar options em cascata) { withVacancy:{ withAssignment: true } }
- Fazer o "create" usar o parametro id na query e mudar o local de declaração da rota create.

####

Problemas para resolver:

- CalendarRead esta mostrando a lista para "criar eventos" por um breve periodo antes de mostrar o evento que ela
  possui.
