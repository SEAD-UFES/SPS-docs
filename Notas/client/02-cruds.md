<!-- @format -->

# Observações sobre a definição de interfaces:

## Modelo padrão para desenvolvimento das interfaces:

- create
- - 'create' leva para a página de read do modelo.

- read
- - 'read' de um modelo pode conter 'read' de outros modelos ("single item" e "detail item").
- - - single - Usado para listar elementos que só possuem um dado (name) para exibir. (Ex: permissions de um role?)
- - - detail - usado para listar elemetos que precisam exibir varias informações. (Ex: calls de um process)

- update
- - cada modelo tem seu proprio update.

- delete
- - 'delete' single item será um "x" em uma pilula.
- - 'delete' detail item será um botão.
