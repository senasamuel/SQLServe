declare @minhaVariavel varchar(100)
declare meu_cursor 
cursor local for select nome from alunos 
open meu_cursor 
fetch next from meu_cursor into @minhavariavel 
while(@@fetch_status = 0)
	begin
	print @minhaVariavel +' Fetch_status->' +cast(@@fetch_status as varchar(10))
	
	fetch next from meu_curso into @minhaVariavel 
end
print 'Fetch_status-> ' +cast(@@fetch_status as varchar(10))
close meu_cursor 
deallocate meu_cursor 



use curso 

declare @codPessoa int,
		@primeiroNome varchar(50),
		@sobrenome varchar (50),
		@nomeCompleto varchar(100)
		
declare cursor1 cursor for 
	select codPessoa,
		nome,
		sobrenome
from 	clifor 

open cursor1

fetch next from cursor1 into @codpessoa, @primeiroNome, @sobreNome 
 
while @@fetch_status  = 0
	begin
	
		update clifor 
		set nomeCompleto =@primeiroNome + ' ' +@sobreNome
		where codPessoa = @codPessoa 
		fetch next from cursor1 into @codPessoa, @primeiroNome, @sobreNome 
	
	end 

close curso1

deallocate cursor1 	
		
	

select * from clifor 


create table cli_nome(

cod_cliente int not null, 
nome_completo varchar (100) not null
)	
	
select * from cli_nome 






declare @codCliente int,
		@primeiroNome varchar (30),
		@sobreNome varchar (60),
		@nomeCompleto varchar(90)
		
declare cursor1 cursor for 
select employeeId, firstName, lastName from northwnd.dbo.employees 

open cursor1

fetch next from cursor1 into @codCliente, @primeiroNome,@sobreNome 

while @@fetch_status  = 0
begin

insert into cli_nome values (@codCliente, @primeiroNome + ' '+ @sobreNome )
fetch next from cursor1 into @codCliente, @primeiroNome, @sobrenome 
end 

close cursor1 

deallocate cursor1 
	

select * from cli_nome


create table tabela_clientes (
nome_cliente varchar(200 ),
cpf_cliente varchar(200 )
 )

 insert into tabela_clientes values 
 ('Fabio', null),
 ('Jorge',21322323423),
 ('Jack',null),
 ('Peter',22211129889)


 select * from tabela_clientes 



declare 
	@nome_cliente varchar(200),
	@cpf_cliente varchar(20)
	
declare nome_do_cursor cursor for 

select nome_cliente, cpf_cliente 
from 
tabela_clientes 

open nome_do_cursor 
fetch next from nome_do_cursor 

into @nome_cliente, @cpf_cliente

while @@fetch_status = 0

begin 
if (@cpf_cliente is null)
	begin 
	update tabela_clientes set cpf_cliente  = 'Atualizar cpf' where cpf_cliente is null
	end 
fetch next from nome_do_cursor
into @nome_cliente, @cpf_cliente
end 	
	
	
select * from tabela_clientes 	
	

create table contaPagParc (
idCap int,
dtVenc date,
parcela int 
)

select * from contapagparc

insert into contapagparc values ('1',getdate()+30, '')
insert into contapagparc values ('1',getdate()+45,'')
insert into contapagparc values ('1', getdate()+60,'')

insert into contapagparc values ('2', getdate()+15,'')
insert into contapagparc values('2',getdate()+20,'')
insert into contapagparc values ('2',getdate()+25,'')



declare @idCap as int 
declare @dtVenc as date 
declare @cont as int = 0
declare @idCap_aux as int 

declare cursorparc cursor for 
	select idcap,dtvenc from contapagparc 
	order by idcap, dtvenc asc
	
	open cursorparc 
		fetch next from cursorparc into @idcap,@dtvenc 
		
		while @@fetch_status = 0
		begin
			if @idcap_aux<>@idcap
			begin
			set @cont=1;
			set @idcap_aux=@idcap;
			end 
			else 
			begin 
				set @cont=@cont+1
				set @idcap_aux=@idcap;
			end 
			update contapagparc set parcela=@cont 

			where idcap=@idcap
			and dtvenc=@dtvenc;

	fetch next from 	cursorparc into @idcap,@dtvenc
	end 
	close cursorparc
	deallocate cursorparc 


	select * from contapagparc			
