<!-- @format -->

# InscriptionEvent

## Definição:

Esse modelo contem as configurações de como o um evento de inscrição vai se comportar.  
Tais regras serão necessárias quando um usuário do sistema tentar se inscrever.

## Campos:

- id,
- calendar_id
- numberOfInscriptionsAllowed
- allowMultipleAssignments
- allowMultipleRegions
- allowMultipleRestrictions

## Regras:

- calendar_id: Um InscriptionEvent só pode ser associado a um calendario sem InscriptionEvents associados.
- numberOfInscriptionsAllowed: Se for 0, permite infinitas inscrições.
