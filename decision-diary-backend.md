<!-- @format -->

01 - O problema da pasta de configurações: Dentro do backend temos uma pasta de configurações. Foi detectado que essa
página possui código executável e que altera-lo faria o código parar de funcionar. Ao mesmo tempo, não havia nenhuma
definição ou manual de como a pasta de configurações deveria ser preenchida. Solução: O código executável foi movido
para a fase de inicialização do software e foram criados arquivos de exemplo dentro da pasta de configuração descrevendo
cada um dos arquivos necessários em uma nova instalação.

02 - O problema das rotas não encontradas e body inválido: Quando era solicitada ao backend uma rota que não exista ou o
corpo da requisição não tinha um formato válido, não ocorria um erro, mas o sistema enviava o erro padrão do express.js
que é uma página html. Isso era muito penoso para o frontend que por padrão, esperava receber um objeto JSON. Solução:
Definição de uma rota que representa todas as rotas que não definidas no servidor que devolve uma mensagem de erro
padrão no formato JSON e definição de um middleware na inicialização do express que captura o erro e o substitui por um
objeto JSON.

03 - O problema de validação da api: Validação estava sendo feita sem estrutura e misturada a operações de busca de
dados. Solução: Definição de uma fase de validação de dados (ainda dentro de API) com funções de validação para cada
item enviado uma estrutura de arquivos separada para as funções de validação. Repare que poderíamos usar um middleware
de validação antes do “permission middleware”, mas optamos por manter o código em API.

05 - O problema no padrão de erros: Existiam muitos números de erro diferentes, sem um padrão de referência ou uma
lógica de lançamento. Erros também vinha de fontes diferentes (sequelize database, sequelize model, api error, outros).
O que dificultava o tratamento. Solução: Todos os erros são capturados e lançados pela API. Optamos por prevenir o
lançamento de erros através de uma validação mais eficiente. Também padronizamos e reduzimos os códigos de erro para 4
(Not Found 404, Validation 400, Unauthorized 401, Forbidden 403, Unknown 500) cada um lançado em fase bem definida
dentro da API.

03 - O problema com o middleware de permissão: A ideia de criar uma middleware que filtra permissões de acesso é boa mas
nesse caso existem alguns problemas como, como ter que inferir (modelo, permissão, update condicional) a partir de (URL,
metodo, id) e trabalhar com informações que ainda não haviam sido validadas (o que estava ocorrendo no middleware api).
Solução: Validações de autorização/permissão são serão feitas dentro da API depois da fase de validação.

06 - O problema de libraries acessando models: Algumas funções nos helpers estavam fazendo acesso direto a biblioteca de
modelos de dados. Depois de criados os arquivos de validação separados de API começaram a surgir problemas de sequência
do carregamento de arquivos. Fazendo a biblioteca de models ficar indisponível para alguns elementos do código. Solução:
Foi decidido que todos os arquivos de validação e helpers serão funções simples que exigem entrada do objeto de modelos
para efetuar suas operações.

07 - O problema de muitos modelos agregados em uma mesma response: A equipe do frontend (Fernando) fez pedidos para
agregar alguns modelos nas requisições GET de vários modelos. Apesar de não ser um erro, isso torna o backend menos REST
(O que vem no GET não é exatamente o que eu envio para o POST ou PUT) e menos flexível com relação a escolha dos dados
que desejo carregar. Solução: A equipe do backend está aprendendo a fazer diversas requisições ao backend para buscar as
informações necessárias. Os modelos agregados ainda não foram removidos da API, mas serão quando o front estiver mais
evoluído.

08 - O problema de deletar modelos em cascata: Atualmente todo modelo bloqueia sua deleção no caso da existência de
modelo associados. Assim , seria possível apenas aplicar uma checagem de deleção na API. Mas e se precisarmos aplicar
uma deleção em cascata em algum momento no futuro? Solução: Escolhemos uma estrutura diferente (Um checagem no modelo
antes da deleção) porque dentro do modelo é possível, no ato da deleção, checar as restrições e se estiver tudo certo
com esse modelo, chamar o método de destruição dos modelos relacionados. que por sua vez, também farão uma checagem. Se
houver qualquer restrição a deleção de algum modelo envolvido, toda a transação é desfeita. Então lançamos um erro que
pode ser capturada na api que invocou a deleção do primeiro modelo da cadeia. (Usos elegante de composição)
