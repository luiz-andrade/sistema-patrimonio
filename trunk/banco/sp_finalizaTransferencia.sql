-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fagner Rodrigues Damacena
-- Create date: 2011-04-28
-- Description:	Executa o processo de finalização da transferência.
-- =============================================
ALTER PROCEDURE sp_finalizaTransferencia(@transferenciaId int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Variaveis de controle.
	DECLARE @tipo int;
	DECLARE @origemId int;
	DECLARE @cedenteId int;
	DECLARE @destinoId int;
	DECLARE @receptorId int;
	DECLARE @concluida bit;
	
	-- Recupera informações da Transferência.
	select	@tipo = tipo
			,@origemId   = origemId
			,@cedenteId  = cedenteId
			,@destinoId  = destinoId
			,@receptorId = receptorId
			,@concluida  = concluida
	from transferencia
	where transferenciaId = @transferenciaId
	
	begin try
		-- Verifica se transferência continua em aberto.
		if (@concluida = 0)
		begin
			-- Inicia uma nova transação.
			begin transaction
			
			-- Atualiza localização do bens.
			update bem
			set bem.localId = @destinoId
			from bem inner join transferenciaBem 
						on bem.bemId = transferenciaBem.bemId
			where transferenciaBem.transferenciaId = @transferenciaId
			and bem.localId = @origemId
			
			-- Verifica se a movimentação executada e do tipo transferência.
			if (@tipo = 2)
			begin
				-- Atualiza responsavel pelo local.
				update [local]
				set pessoaId = @receptorId
				where localId = @destinoId; 
			end
			
			-- Atualiza estado da transferência.
			update transferencia
			set concluida = 1
			where transferenciaId = @transferenciaId
					
			-- Commita transação ativas no escopo.
			while (@@TRANCOUNT > 0)
			begin
				commit transaction	
			end
		end
	end try
	begin catch
		-- Cancela transações ativas no escopo.
		while (@@TRANCOUNT > 0)
		begin
			rollback transaction
		end
	end catch

END
GO
