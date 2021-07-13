CREATE PROCEDURE Pacientes_Fecha
    (
        @fecha DATE
    )
AS
    DECLARE @paciente VARCHAR(50);
    DECLARE @centro VARCHAR(40);
	DECLARE @total INT = 0;
    DECLARE cursor_centro CURSOR FOR
        SELECT
            cen.nombre
        FROM Centro AS cen
    
    OPEN cursor_centro;

    FETCH NEXT FROM cursor_centro
        INTO @centro
    WHILE @@FETCH_STATUS = 0
        BEGIN
			PRINT @centro + ' / ' + CAST(@fecha as varchar(20))
			DECLARE cursor_paciente CURSOR FOR
				SELECT
					pac.nombre + ' ' + pac.apellido
				FROM Paciente as pac
				JOIN Paciente_Vacuna_Centro as pvc ON pvc.cedula_pac = pac.cedula_pac
				JOIN Centro as cen ON cen.cod_cen = pvc.cod_cen
				WHERE pvc.fecha_cita = @fecha
				AND cen.nombre = @centro

			OPEN cursor_paciente;

			FETCH NEXT FROM cursor_paciente
				INTO @paciente
			WHILE @@FETCH_STATUS = 0
				BEGIN
					PRINT @paciente

					SET @total = @total+1
					FETCH NEXT FROM cursor_paciente 
						INTO @paciente
				END
			DEALLOCATE cursor_paciente

			PRINT CHAR(13)+CHAR(10)
            FETCH NEXT FROM cursor_centro
                INTO @centro
        END
    DEALLOCATE cursor_centro
	PRINT CHAR(13)+CHAR(10)
	PRINT 'TOTAL DE PACIENTES: ' + CAST(@total as VARCHAR)
RETURN

declare @mifecha date
set @mifecha = '2021-09-25'

exec Pacientes_Fecha @mifecha