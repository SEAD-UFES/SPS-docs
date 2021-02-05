<!-- @format -->

# PetitionEvent:

- Calendários podem ter apenas um evento do tipo PetitionEvent
- O inscriptionEvent deve pertencer a mesma chamada que o novo PetitionEvent
- Só pode ser deletado se não tiver outros items ativos associados a ele.

# Petition:

- Um recurso só pode se referir a uma inscrição do inscriptionEvent associado ao PetitionEvent.
- Apenas um usuário com permissão "petition_list" e "petition_read" pode listar recursos de outros usuários.
- Um recurso só pode ser criado pelo canditado, que só pode inserir (petitionEvent, inscription, title, description).
- Um recurso só pode ser criado dentro em um item de calendário em andamento.
- Um recurso só pode ser deletado se: Não respondido e com calendário em andamento.

# PetitionReply:

- Um recurso só pode ser respondido um vez (apenas uma resposta)
- Apenas usuários com permissão podem responder a recursos.
- Uma respota a recurso não pode ser deletada.
