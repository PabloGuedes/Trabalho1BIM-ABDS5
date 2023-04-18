create or replace function desempenhoMedicos
(
  data_inicio date,
  data_fim date
) returns setof RECORD as $$
declare
  registro RECORD;
begin
  for registro in select m.nome, count(a.id_atende)
                 from atende a
                 inner join medico m on m.id_medico = a.id_medico
                 where a.data between data_inicio and data_fim
                 group by m.nome
                 order by count(a.id_atende) desc
  loop
    return next registro;
  end loop;
  return;
end;

$$ 
language plpgsql;

select * from desempenhoMedicos('2022-01-01', '2023-12-31') as (nome varchar, qtd bigint);
