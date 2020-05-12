
declare @cont int,
	    @tab int
set @cont = 0
set @tab = 5

while (@cont<=10)
begin 
	print cast(@cont as nvarchar) +  ' X ' + cast(@tab as nvarchar ) +  ' = ' + cast( @cont*@tab as nvarchar)
	set @cont=@cont + 1
end 	



declare @val1 int,
		@val2 int,
		@mod int
set @val1 = 1 
set @val2 = 10

while (@val1<=@val2)
begin 
	set @mod=@val1%2
	if @mod	= 0
		begin 
			print'O numero '+cast(@val1 as nchar(2))+' È par '
			set @val1 = @val1+ 1
		end 
	else 
	  begin 
		print 'O numero'+cast(@val1 as nchar(2))+'È impar'
		set @val1=@val1+ 1
	end
end

use curso;


create table dim_data (
id_dim_data int identity(1,1) not null primary key 
data date not null,
ano smallint not null,
mes smallint not null,
dia smallint not null,
dia_semana smallint not null,
dia_ano smallint not null,
ano_bissexto char(1) not null,
dia util char(1) not null
fim_semana char(1) not null,
feriado char(1) not null,
nome_feriado varchar(30)null,
nome_dia_semana varchar(15) not null,
nome_dia__semana_abrev char (3) not null,
nome_mes varchar(15) not null,
nome_mes_abrev char(3) not null,
quinzena smallint not null,
bimestre smallint not null,
trimestre smallint not null, 
semestre smallint not null,
mr_semana_mes smallint not null,
nr_semana_ano smallint not null,
estacao_ano varchar(15) not null,
data_por_extenso varchar(15) not null,
evento varchar(50) null
)