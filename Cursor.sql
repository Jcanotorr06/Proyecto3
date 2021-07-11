CREATE PROCEDURE Pacientes_Fecha
    (
        @fecha DATE
    )
AS
    DECLARE @paciente VARCHAR(50);
    DECLARE @centro VARCHAR(40);
	DECLARE @total INT = 0;
    DECLARE cursor_centro_paciente_fecha CURSOR FOR
        SELECT
            cen.nombre, pac.nombre + ' ' + pac.apellido,  pvc.fecha_cita
        FROM Centro AS cen
        JOIN Paciente_Vacuna_Centro AS pvc ON pvc.cod_cen = cen.cod_cen
        JOIN Paciente AS pac ON pac.cedula_pac = pvc.cedula_pac
        WHERE pvc.fecha_cita = @fecha;
    
    OPEN cursor_centro_paciente_fecha;

    FETCH NEXT FROM cursor_centro_paciente_fecha
        INTO @centro, @paciente, @fecha
    WHILE @@FETCH_STATUS = 0
        BEGIN
			PRINT @centro + ' / ' + CAST(@fecha as varchar(20))
			PRINT @paciente

			SET @total = @total + 1

            FETCH NEXT FROM cursor_centro_paciente_fecha
                INTO @centro, @paciente, @fecha;
        END
    
    DEALLOCATE cursor_centro_paciente_fecha
	PRINT CHAR(13)+CHAR(10)
	PRINT 'TOTAL DE PACIENTES: ' + CAST(@total as VARCHAR)
RETURN

declare @mifecha date
set @mifecha = '2021-09-25'

exec Pacientes_Fecha @mifecha