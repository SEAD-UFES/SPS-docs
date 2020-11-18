<!-- @format -->

# PetitionEvent:

- Calendários podem ter apenas um evento do tipo PetitionEvent
- O inscriptionEvent deve pertencer a mesma chamada que o novo PetitionEvent

# Petition:

- Apenas um usuário com permissão "petition_list" e "petition_real" pode listar recursos de outros usuários.
- Um recurso só pode se referir a uma inscrição do inscriptionEvent associado ao PetitionEvent.
- Um recurso só pode ser criado pelo canditado, que só pode inserir (petitionEvent, inscription, title, description).
- Um recurso só pode ser criado dentro do prazo para recurso.
- Um recurso só pode ser deletado se: Não respondido e Dentro do periodo de recurso.

# PetitionReply:

- Um recurso só pode ser respondido um vez (apenas uma resposta)
- Apenas usuários com permissão podem responder a recursos.
- Uma respota a recurso não pode ser deletada.
