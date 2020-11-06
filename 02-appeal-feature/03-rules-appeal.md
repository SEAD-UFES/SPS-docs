<!-- @format -->

# AppealEvent:

- Calendários podem ter apenas um evento do tipo AppealEvent

# Appeal:

- Apenas um usuário com permissão "appeal_list" e "appeal_real" pode listar recursos de outros usuários.
- Um recurso só pode se referir a uma inscrição do inscriptionEvent associado ao AppealEvent.
- Um recurso só pode ser criado pelo canditado, que só pode inserir (appealEvent, inscription, title, description).
- Um recurso só pode ser deletado se: Não respondido e Dentro do periodo de recurso.
- Um recurso só pode ser respondido um vez, que só pode inserir (status, justification).
- Apenas usuários com permissão podem responder a recursos.
