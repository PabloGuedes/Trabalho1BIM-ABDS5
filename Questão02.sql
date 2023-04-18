create or replace function novaCirurgia
(
    data_cirurgia date,
    descricao_cirurgia varchar (100),
    codigo_paciente char(10),
    codigo_cirurgia char(10)
)

returns void
as $$
declare
    paciente_id integer;
begin
    select id_paciente into paciente_id from paciente where codigo = codigo_paciente;
    
    if not found then
        raise exception 'Paciente % não encontrado', codigo_paciente;
    end if;
    
    insert into cirurgia (codigo, data_cirurgia, descricao, id_paciente)
values (codigo_cirurgia, data_cirurgia, descricao_cirurgia, paciente_id);

end;
$$
language plpgsql;

drop function novaCirurgia(date, character varying, character, character);

select novaCirurgia('2023-05-05'::DATE, 'Cesária'::VARCHAR, 'P2'::CHAR(10), 'C6'::CHAR(10));