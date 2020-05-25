<!-- @format -->

# Problemas com datetime no backend

- api.create e api.update estavam devolvendo os objetos com datas em formato diferente dos formatos enviados.
- Se uma data sem HH:mm:ss for enviada para o banco, ela é recebida como UTC(0) então ela é gravada no banco com 3 horas
  a menos.

# Soluções:

- Solução 01: fazer o model.reload() em create/update para recolher os parametros corretos.
- - Isso faz uma nova query no banco (ruim)
- - Isso ordena os atributos (bom)
- - Isso insere itens que eventualmente não tenham default value (bom)
- - Isso transforma as dates em dateStrings (bom)
- - Isso padroniza a resposta no C.R.U.
- Solução 02: Forçar a validação da data no formato "YYYY-MM-DD HH:mm:ss"
- - Isso torna a entrada no backend menos flexivel (Irrelevante)
- - Isso impede a entrada de datas que podem criar problemas no banco. (bom)

# Oservações:

- O que faz as datas virem no mesmo formato em que entraram é dateString:true em config.
- Se colocar dateString:false em config, todas as datas passam a vir em formato date UTC(0) (com 3 horas a mais).
- É preciso estudar isso melhor para entender completamente o problema.

# Por que dessa forma?

- Foi a forma que encontrei.
- Preciso entender melhor as consequências se quiser migrar para um modelo full UTC.
