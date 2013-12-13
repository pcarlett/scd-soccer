------------------------------------------------------
--
-- campo di gioco
--
--
--
------------------------------------------------------
with Pos;          use Pos;
with Ada.Streams;

package Field is

	-- dichiarazione di oggetto remoto
	-- pragma Remote_Types;
    -- Shared_Passive;
    
	type Move is (Up, Down, Forwd, Backwd);

	-- dichiarazione dei ruoli dei giocatori
	type Role is (STK, LFW, CFW, RFW, LMF, CMF, RMF, LDF, CDF, RDF, GKP);
		
	-- funzione per la definizione dei limiti di movimento dei ruoli
	procedure RoleLimit(Dir : in Integer; R : in Role; A,B,C,D : out Integer);

	type Score is record
		T1 : Integer;
		T2 : Integer;
	end record;
	
	-- gestione della lista di posizioni come array
	type PositionList is array (0..22) of Position;
    	
    type F is tagged limited private;
        
    subtype Field is F;
        
    type Field_Access is access all Field'Class;
		
	-- funzione per inizializzare le posizioni
	procedure InitField (F : access Field);

	-- funzione per leggere lo stato del campo
	function GetPositions (F : in Field_Access) return PositionList;

	-- funzione per la posizione di un giocatore specifico
	function GetPosition (F : in Field_Access; ID : in Integer) return Position;
    
	-- procedura per il controllo della possibilita' di movimento se intersezione libera
	function CheckCell(F : in Field_Access; Pos : in Position) return Boolean;

	-- procedura per la modifica dello stato del campo su un oggetto protetto
	procedure SetPosition (F : in out Field_Access; ID : in Integer; M : in Move; Dir : in Integer);

	-- procedura alternativa per la modifica della posizione
	procedure SetPosition (F : in out Field_Access; ID : in Integer; P : in Position);
	
	-- funzione per testare se il compagno e' avanzato
	function Forward(To, From : Position; Dir : Integer) return Boolean;

	-- funzione per il test del movimento
	function CheckMovement (Dir : in Integer; M : in Move; PRole : in Role; Pos : in Position) return Boolean;
		
	-- funzione per ottenere la posizione della porta avversaria
	procedure GetGoalPosition (F : in Field_Access; D : in Integer; A : out Position; B : out Position);
	
	-- funzione esclusiva dell'arbitro
	procedure ResetPosition (F : in out Field_Access; ID : in Integer; P : Position);

	-- funzione per testare se la palla e' in campo
	function IsBallPlayable (F : in Field_Access) return Boolean;
		
	-- funzione per testare se la palla e' uscita lateralemente
	function OverVerticalLimit (F : in Field_Access) return Boolean;

	-- funzione per testare se la palla e' uscita dal fondo
	function OverHorizzontalLimit (F : in Field_Access) return Boolean;

	-- procedura per restituire la palla al portiere
	procedure BallToKeeper (F : in Field_Access);
		
	-- funzione per riposizionare la palla
	procedure LateralReposition (F : in out Field_Access);

	-- funzione per testare se la palla e' in rete
	procedure GoalReached (B : in out Boolean);
	
	-- procedura per impostare il risultato
	procedure SetScore (F : in out Field_Access; I : in Integer);

	-- procedura per ottenere il risultato parziale del match
	function GetScore(F : in Field_Access; I : Integer) return Integer;

    private

        type F is tagged limited record
    			-- dimensioni del campo standard (variabili in base all'inizializzatore)
    			NumRows : Integer := 204;
    			NumCols : Integer := 315;

    			-- variabile contenente il risultato del match
    			Result1 : Integer := 0;
    			Result2 : Integer := 0;

    			-- posizionamento iniziale del pallone
    			-- Ball : Position := (0, 103, 157);
		
    			-- posizione delle porte
    			G1_P1 : Position := (30, 92, 315);
    			G1_P2 : Position := (31, 112, 315);

    			G2_P1 : Position := (32, 92, 0);
    			G2_P2 : Position := (33, 112, 0);
		
    			-- array di posizionamento dei giocatori
    			PList : PositionList;
        end record;
    
    -- procedure My_Write (Stream : access Ada.Streams.Root_Stream_Type'Class;
    --                     Item   : in F);
    --                     
    -- for Account_Type'Write use My_Write;
    -- 
    -- procedure My_Read (Stream : access Ada.Streams.Root_Stream_Type'Class;
    --                    Item   : out F);
    -- 
    -- for Account_Type'Read use My_Read;
    		        
end Field;
