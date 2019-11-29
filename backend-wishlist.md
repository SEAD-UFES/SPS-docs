# Wishlist

## Promises
A maioria das promisses está usando o estilo método .then, porém há alguns casos em que usamos async/await. O ideal é dicidirmos por um estilo ou outro, e refatormos a base de código para que somente esse estilo seja usado. No caso de decidirmos continuar com o estilo .then, precisamos modificar os casos de "promise hell" para usar encadeamentos de .then, e tratar os erros com um .catch final, ao invés do estilo atual aque é then( succeed-function, fail-function ). Mudar para async/await resolve esse problema, mas implica em refatorar uma maior parte do código do que manter o estilo .then.

## Barrar Duplicação de Nome Processo
O backend está permitindo criar mais de um processo seletivo com o mesmo ano e número, é necessário checar se já existe essa combinação número/ano e barrar a criação de uma nova. Outra validação interessante de criar junto com essa é a que garante que todos os números de processo terão três dígitos (001, 002, etc).

## Simplificação de Permissões
Atualmente as permissões de acesso estão divididas em várias tabelas (Papel, Tipo de Papel, Permissão, Ação, Alvo). É possível remover uma ou duas dessas tabelas.

Ações/Action só contem os elementos para os verbos HTTP GET, PUT, DELETE e POST. Um Enum no banco faria essa função sem perdas, até porque put/get/delete/post são auto explicativos.

Permições/Permissions tem uma entrada para cada ação: acessar chamada, apagar chamada, criar chamada, editar chamada, listar chamadas... essas permissões poderiam ser centralizadas em uma só entrada na tabela de permissões, usando-se flags para cada uma das ações citadas.

## Padronizar Erros e Códigos de Retorno
Os erros de cada rota estão na pasta /app/errors e muitos deles não seguem um padrão de numeração para o tipo de erro, nem as mensagens. Também é importante evitar que mensagens internas do sistema sejam enviadas para o usuário final em caso de erro. 

## Refatorar a Autenticação
Há muita lógica nas rotas e nos middlewares de autenticação. É necessário refatorar o código para quebrar a complexidade em problemas menores, e mover as funções para algum dos módulos em `/app/helpers`, ou criar novos módulos. Usar alguma biblioteca também poderia deixar o código mais legível (o que é um bom caso para testar o lodash).

## Padronização de Nomenclatura DB & Backend
Propriedades e nomes de tabelas no banco de dados. Pessoalmente, prefiro nomes de tabelas todos em letras minusculas, separados_por_underline, no singular. 

Propriedades como **selectiveProcess_id** não deveriam existir, por misturarem camelCase (padrão no Javascript) com snake_case, que costuma ser mais comum em bancos de dados.
De qualquer forma é necessário **escolher um padrão** e usar ele sempre. Modificando o banco para conformar com esse padrão.

Isso inclui corrigir as confusões de usar uma palavra singular em um lugar e plural em outro (SelectiveProcess, SelectiveProcesses, Call, Calls).

## Publications -> fileUpload
As mensagens de erro retornadas por fileUpload não estão no mesmo padrão do resto das mensagens de erro do sistema. É interessante usar o mesmo modo de retorno de erros que as outras rotas/modelos usam. 

## Retorno de Criação de Item (rotas POST)
Algumas rotas retornam o id do novo elemento, outras só retornam um código de que a criação ocorreu sem problemas. Padronizar para todos retornarem o novo id. 

## Barrar Acesso a Processos Ocultos 
Se certificar que um usuário não consiga acessar um processo seletivo caso não tenha a permissão para acessá-lo. Caso o usuário não consiga listar um processo, ele também não deve ser capaz de acessar a página dele (se tentar acessar direto pela url, um erro de 'não tem a permissão necessária' deve ser retornado).


