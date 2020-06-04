<!-- @format -->

# Events (Calendars)

## Definição:

São eventos que podem acontecer durante uma chamada, exemplos, Periodo de inscrição, publicação de resultado, periodo de
recursos, periodo de entrevistas.

## Campos:

- id
- call_id
- calendar_id (Calendar do qual este calendar depende)
- name
- start
- end
- ready

## Regras:

- Eventos não podem iniciar antes da data de inicio da chamada.
- Eventos não podem terminar depois do fim da chamada.
- Inicio de um evento deve ocorrer antes do encerramento do evento.
- Eventos do tipo 'inscrições' e 'recurso' devem possuir data de encerramento obrigatóriamente.
- Eventos do tipo 'publicação' devem possuir end === null. (Já que não possuem um periodo)
- Eventos possuem
- Eventos podem possuir os seguintes estados (waiting, running, late, done)
- - Waiting pode acontecer quando:
- - - ready = false && start > agora
- - - ready = true && start > agora
- - Running pode acontecer quando:
- - - ready = true && start < agora && end > agora
- - late ocorre quando
- - - ready = false && start < agora && end === null
- - done ocorre quando
- - - ready = true && start < agora && end == null (para eventos sem end)
- - - ready = true && start < agora && end < agora (para eventos com end)
