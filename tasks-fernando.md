<!-- @format -->

### Coisas para resolver:

#### Ajustes para colocar no ar o sistema:

- Colocar o sistema de emails para funcionar.

- (?) Criar um link rápido para o perfil a NavBar? (Sugestão do Marco.)
- (?) Problema de navegação (voltar/carregar em pontos estranhos da pagina). Talvez sempre colocar o foco no topo?
- (?) Remover a coluna pronto para o usuário comum? Alterar o nome?

- Não logado.
- Comum.
- Administrador.

### Passo para frente:

Feature: Inscrições com dados adicionais

- Tipo: Questões de multipla escolha. (escolha unica ou multipla) (Com envio de arquivo(s) opcional.)
- Tipo: Questões discursivas. (Com envio de arquivo(s) opcional.)
- Tipo: Envio de arquivos(s).
- Quando necessário, marcar dado adicional como obrigatório?

### Tarefas para o futuro (Passo para trás):

- Reformular auth no backend e no frontend.
- Remake das paginas (ProcessRead, ProcessList, ProcessCreate, ProcessUpdate) usando a nova arquitetura.
- Problema de navegação (voltar/carregar em pontos estranhos da pagina). Talvez sempre colocar o foco no topo?
- Substituir as chamadas de selectorsV1 pelos selectorsV2.
- Reformular publications usando a nova arquitetura.

### Lembretes:

- npx sequelize model:generate --name User --attributes firstName:string
- npx sequelize migration:generate --name rebuild-PasswordRecover
- npx sequelize seed:generate --name demo-user

- npx sequelize db:seed --seed 00000000000000-seed-name
