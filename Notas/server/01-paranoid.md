<!-- @format -->

# Por que paranoid na deleção?

- Para não deletar material importante nem perder informação.

# Como?

- Coluna isActive virtual na tabela (Para que seja possivel criar uma chave única e permitir itens "unicos" porém com
  apenas 1 ativo por vez.)
- Chave única (Para garantir a integridade do banco de dados.) dentro do segundo {} em define.

```
"uniqueKeys": { "col1_col2_unique": { "fields": ["col1","col2"], customIndex: true } }
```

- Método beforeDestroy no modelo (Para verificar restrições não podem mais ser feitas no banco e ações em modelos
  relacionados que devem ser feitas aqui para permitir composição.)
- Nas chamadas de destroy usar "individualHooks:true" (Para que o hook beforeDestroy seja chamado.)

# Quando?

- Colunas e chaves são necessárias quando se tem um item único (ou combinação única) no banco e se deseja garantir essa
  integridade.
- beforeDestroy e individualHooks devem existir em todos os modelos, para garantir que a deleção seja padronizada em
  todos eles.

# Por que dessa forma?

- Garatir integridade do banco em caso de falha em algum procedimento mais acima. Padronizar o metodo de deleção e
  permitir restrições e operações em cascata.
