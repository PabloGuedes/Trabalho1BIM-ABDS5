create or replace function verificaDataCirurgia() returns trigger as $$
begin
    if new.data_cirurgia < current_date then
        raise exception 'Não foi possível inserir a cirurgia.';
    end if;
    return new;
end;
$$ language plpgsql;

create trigger trigger_verificaDataCirurgia before insert on cirurgia
for each row execute function verificaDataCirurgia();

select novaCirurgia('2023-01-01'::DATE, 'Rinoplastia'::VARCHAR, 'P3'::CHAR(10), 'C7'::CHAR(10));

drop trigger trigger_verificaDataCirurgia on cirurgia;
