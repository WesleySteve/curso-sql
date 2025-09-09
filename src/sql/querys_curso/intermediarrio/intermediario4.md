campos de telefone

prioridades de valores nos campos de uma tabela

1 - tel
2 - telefone
3 - telefone2
4 - phone
5 - celular
6 - wpp

COALESCE(tel, telefone, telefone2, phone, celular, wpp, 0) AS telefone

COALESCE -> retorna o primeiro valor não nulo
