<!-- @format -->

01 - O problema da mistura de conceitos: A arquitetura atual mistura a parte de manipulação de dados, (request data,
redux data, cálculos complexos) com a parte de apresentação das interfaces e isso torna mais difícil separar funções,
efetuar alterações na interface, etc. Solução: Com algum estudo, verificamos como os desenvolvedores react/redux fazem
essa separação (com o uso de containers) e agora temos componentes de lógica (containers ou logic components) e
componentes de apresentação (show components)

02 - O problema dos erros recebidos do backend: O backend enviava muitos códigos de erros diferentes, inclusive em
formatos diferentes, ao mesmo tempo, erros da requisição (JSON errado ou URL errada) não estavam sendo tratados
corretamente. Solução: Estabelecer dentro de “actions” um protocolo de verificação de erros que considera tanto erros
retornados do servidor como erros desconhecidos.

03 - O problema de múltiplas requisições ao backend: No momento, cada página faz apenas uma ou duas requisições ao
backend, pois todo conteúdo está agregado em poucas requests. Após pesquisas em códigos existentes e para manter as
requisições ao front mais “REST”. Mas seria muito custoso fazer uma serie de requisições em cada nova página. Solução:
Optamos por configurar as actions de maneira a disparar outras actions a conteúdos relacionados, que podem ser ativadas
com o uso de flags.

04 - O problema de complexidade dos reducers: Até agora fazíamos acesso diretamente aos reducers, pois o conteúdo estava
agregado como desejado. Mas usando um formato mais simplificado de requisições ao backend, agora cabe ao frontend
construir objetos complexos que são uma combinação dos dados que estão nos reducers. Solução: Criamos no frontend um
módulo de “selectors” que devem permitir composição para criar objetos complexos (Ex: Processos que contém Chamadas que
contêm Ofertas)

05 - O problema de load dos arquivos: Depois de criada a seção de selector o ato de agregar objetos com o uso de funções
criou uma série de problemas de sequência de carregamento. (A precisa de B que precisa A) Solução: É meio difícil
explicar essa. Uso de funções redundantes para navegação dentro do store, distribuição dos reducers por arquivos
diferentes para evitar o problema de sequência de carregamento.
