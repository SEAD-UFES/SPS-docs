#Estatísticas Anuais

Todos ano criamos um relatório das atividades realizadas pelo Suporte da SEAD. As etapas abaixo descrevem como conseguir essas informações dos repositórios de desenvolvimento no Git/Github.

Listar todos os commits, mostrando a data.

`git log --pretty=format:"%h%x09%an%x09%ad%x09%s"`

Pegar o hash do último commit do ano anterior.

```
...
8615e55 Wagner Tue Jan 22 16:00:34 2019 -0200  Returning processes without calls
a3696fd Wagner Fri Jan 18 10:48:03 2019 -0200  Some corrections in fields name and relation
26d2e4c edo9k  Tue Jan  8 15:44:24 2019 -0200  Added Call route to routes files
5027b9a edo9k  Wed Dec 26 16:56:27 2018 -0200  Fixed validation and response to list route
...

```

Usar o hash para comparar último commit do ano passado com a HEAD (posição atual do repositório)

`git diff --stat HEAD 5027b9a -- . ':(exclude,top)package-lock.json'`

Que vai dar a quantidade de arquivos modificados, inserções e deleções entre os dois commits.

```
public/files/.gitignore                                                |   2 -
seeders/users.seed.js                                                  |  29 +++
test/me.test.js                                                        |   4 +-
test/users.test.js                                                     |   4 +-
163 files changed, 713 insertions(+), 7072 deletions(-)

```

## Descrição de atividades — branches/features

Com comando abaixo podemos listar todos os branches iniciando com feat. 

`git log --oneline --grep=Merge --since "Dec 31 2018"`

Como os branches tem nomes descritivos, dá pra saber qual era a atividade para qual cada um deles foi criado.

```
41354f0 Merge branch 'feat/add_user_change_password' of https://github.com/SEAD-...
5bb5f14 Merge branch 'feat/add_user_change_password' into feat/add_user_email_ve...
1616592 Merge branch 'feat/graduationtype_create' of https://github.com/SEAD-UFE...
Merge branch 'feat/remove_timestamps_from_results' of https://github.com/SEAD-UF...
```

## O que foi feito em cada branch

### feat/add_delete_to_publications
Adicionando propriedades à publicações que permitem que dados incorretamente deletados possam ser recuperados.

### feat/add_target_seed
Atualizando as regras do sistema de controle de acesso do backend. 

### feat/add_user_change_password
Criando funções que permitem que a recuperação de senhas, e confirmação de usuários por e-mail.

### feat/graduationtype_create
Essa elemento permite a classificação de cursos e treinamentos entre graduação, pós, especialização, aperfeiçoamento, etc.

### feat/improve_access_checks
Aperfeiçoamento nas regras de controle de acesso as partes privadas do sistema (que incluem áreas de administração, áreas somente acessíveis para coordenadores e secretários de curso).

### feat/listing_for_private_selective_processes
Atualizando filtros de processos seletivos na rota de acesso privada (para usuários autenticados).

### feat/vacancy_include_related_models
Incluindo dados relacionados na listagem de tipos de vagas para processos seletivos.

### fix/create_rolepermissions_seed
Recurso que alimenta o sistema de permissões, ligando tipos de usuários à permissões (secretários de cursos, coordenadores, administradores, etc).

### fix/reworking_permission_descriptions_seed
Auterando as descrições de tipo de permissão para o novo padrão. 





