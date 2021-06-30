CREATE PROCEDURE Personal
	(
		@fecha date,
		@centro char(13),
		@cant_doctores int output,
		@cant_enfermeras int output,
		@cant_logistico int output
	)
as
	select
		@cant_doctores = COUNT(cen.cedula_col)
	from Colaborador as col
	join Centro_Colaborador as cen on cen.cedula_col = col.cedula_col
	where 
		@fecha = cen.fecha and
		@centro = cen.cod_cen and
		col.rol = 'D'
	select
		@cant_enfermeras = COUNT(cen.cedula_col)
	from Colaborador as col
	join Centro_Colaborador as cen on cen.cedula_col = col.cedula_col
	where 
		@fecha = cen.fecha and
		@centro = cen.cod_cen and
		col.rol = 'E'
	select
		@cant_logistico = COUNT(cen.cedula_col)
	from Colaborador as col
	join Centro_Colaborador as cen on cen.cedula_col = col.cedula_col
	where 
		@fecha = cen.fecha and
		@centro = cen.cod_cen and
		col.rol = 'A'
return

declare
	@mifecha date,
	@micentro char(13),
	@doctores int,
	@enfermeras int,
	@logistico int

set @mifecha = '5/5/1994'
set @micentro = 'CV-12-ES-2753'

exec Personal @mifecha, @micentro, @doctores output, @enfermeras output, @logistico output

select @doctores[Cantidad de Doctores], @enfermeras[Cantidad de Enfermeras], @logistico[Cantidad de Personal de Apoyo Logistico]