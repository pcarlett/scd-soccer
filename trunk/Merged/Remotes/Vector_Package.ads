------------------------------------------------------
--
-- vettore del campo di gioco
--
--
--
------------------------------------------------------
with Common_Types;			use Common_Types;
package Vector_Package is

	protected type Vector is
		
		-- funzione per inizializzare le posizioni
		procedure InitVector;
		
		-- funzione per leggere lo stato del campo
		function GetPositions return PositionList;
	
		-- funzione per la posizione di un giocatore specifico
		function GetPlayerPosition (ID : in Integer) return Position;
		
		-- procedura per settare la nuova posizione nel vettore

		-- funzione per ottenere la posizione della palla
		function GetBallPosition return Position;
		
		-- procedura per ottenere il risultato parziale del match
		function GetScore(I : Integer) return Integer;	

		private

			-- dimensioni del campo standard (variabili in base all'inizializzatore)
			NumRows : Integer := 204;
			NumCols : Integer := 315;

			-- variabile contenente il risultato del match
			Result1 : Integer := 0;
			Result2 : Integer := 0;

			-- posizionamento iniziale del pallone
			Ball : Position := (0, 103, 157);
			
			-- posizione delle porte
			G1_P1 : Position := (30, 92, 315);
			G1_P2 : Position := (31, 112, 315);

			G2_P1 : Position := (32, 92, 0);
			G2_P2 : Position := (33, 112, 0);
			
			-- array di posizionamento dei giocatori
			PList : PositionList;

	end Vector;

	type Vector_Access is access Vector;
			
end Vector_Package;