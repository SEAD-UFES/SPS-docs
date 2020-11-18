<!-- @format -->

# Coordenador\* "create" AppealEvent

- Ator acessa calendário da chamada.
- Ator acessa detalhes so item de calendário.
- Ator escolhe o novo tipo de evento "evento de recurso".
- Ator preenche dados no novo evento (evento de inscrição).
- Ator cria evento e retorna para detalhes do item de calendário.

# Coordenador\* "read" AppealEvent

- Ator acessa página do processo.
- Ator acessa "Eventos de recurso" (Se existe apenas 1, ele é encaminhado para este.) e escolhe o evendo desejado.
- Ator acessa "Evento de recurso" e visualiza recursos que tem permissão para visualizar (pessoais e geral)
- Ator acessa detalhes do recurso desejado.

# Candidato "create" Appeal

- Ator acessa página do processo.
- Ator acessa "Eventos de recurso" (Se existe apenas 1, ele é encaminhado para este.) e escolhe o evendo desejado.
- Ator acessa "Evento de recurso" e visualiza recursos que tem permissão para visualizar (pessoais e geral).
- Ator acessa a opção "Adicionar recurso".
- Ator preenche os campos de recurso (titulo, descrição).
- Ator acessa "criar" e é direcionado para a página anterior.

# Candidato\* "delete" Appeal

- Ator acessa página do processo.
- Ator acessa "Eventos de recurso" (Se existe apenas 1, ele é encaminhado para este.) e escolhe o evendo desejado.
- Ator acessa "Evento de recurso" e visualiza recursos que tem permissão para visualizar (pessoais e geral).
- Ator visualiza na lista de recursos pessoais a opção "excluir"
- Ator é enviado para uma pagina de confirmação.
- Ator confirma e é enviado para a pagina anterior.

# Coordenador\* "reply" Appeal

- Ator acessa página do processo.
- Ator acessa "Eventos de recurso" (Se existe apenas 1, ele é encaminhado para este.) e escolhe o evendo desejado.
- Ator acessa "Evento de recurso" e visualiza recursos que tem permissão para visualizar (pessoais e geral).
- Ator visualiza na lista de recursos geral a opção "responder" em cada recurso. e clica sobre a desejada.
- Ator acessa pagina com detalhes recurso e pode configurar as opções (estado, justificativa).
- Ator faz a avaliação e acessa responder. Depois é direcionado para a pagina anterior.
