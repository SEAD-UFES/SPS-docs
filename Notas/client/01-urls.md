<!-- @format -->

# Obeservações sobre URLs

- CRUD padrão
- - /modelo/list
- - /modelo/create
- - /modelo/read/:modelo_id
- - /modelo/update/:modelo_id
- - /modelo/delete/:modelo_id

# Por que?

- Informação da operação explicita.
- Apenas (1) id encontre os outros dados a partir dessa id.

# Operações com modelos relacionados/subordinados?

- Modelos subordinados (process->class>) devem ter um caminho fácil para listagem (que pode ser feita na pagina do
  modelo) e criação.

- sub-modelos relacionados a um modelo ()
- - /modelo/read/:modelo_id/sub-modelo/create (Para criar um sub-modelo com o modelo já definido.)
- - /modelo/read/:modelo_id/sub-modelo/list (Se não for listado na pagina do modelo.)
- - /sub-modelo/read/:sub-modelo_id (É possivel encontrar as outras informações a partir da id.)
- - /sub-modelo/update/:sub-modelo_id (É possivel encontrar as outras informações a partir da id.)
- - /sub-modelo/delete/:sub-modelo_id (É possivel encontrar as outras informações a partir da id.)
