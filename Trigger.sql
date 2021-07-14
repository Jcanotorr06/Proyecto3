CREATE TRIGGER Proxima_Dosis
ON 
	Paciente_Vacuna_Centro
FOR
	INSERT, UPDATE
AS
	declare
		@fecha_dosis date,
		@proxima_cita date,
		@cantidad int,
		@dosis int,
		@dias int
		select 
			@cantidad = vac.cant_dosis,
			@dosis = ins.dosis,
			@dias = vac.TiempoEntreDosis,
			@fecha_dosis = ins.fecha_vacuna
		from inserted as ins
		join Vacuna as vac on vac.cod_vac = ins.cod_vac
		if @dosis < @cantidad and @fecha_dosis is not null
			begin
				select @proxima_cita = DATEADD(DAY,@dias, @fecha_dosis)
				insert into Paciente_Vacuna_Centro
					select 
						cedula_pac, cod_vac, cod_cen, @dosis+1, @proxima_cita, null 
					from inserted
			end
