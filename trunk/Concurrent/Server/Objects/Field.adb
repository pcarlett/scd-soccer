-- with Ada.Text_IO;					use Ada.Text_IO;

package body Field is

	-- funzione per la definizione dei limiti di movimento dei ruoli
	procedure RoleLimit(Dir : in Integer; R : in Role; A,B,C,D : out Integer) is
	begin
		if (Dir = 1) then
			case R is
				when STK => A := 38; 	B := 248; 	C := 166; 	D := 315;
				when LFW => A := 0; 	B := 210; 	C := 104; 	D := 315;
				when CFW => A := 53; 	B := 210; 	C := 151; 	D := 315;
				when RFW => A := 103; 	B := 210; 	C := 204; 	D := 315;
				when LMF => A := 0; 	B := 68; 	C := 90; 	D := 248;
				when CMF => A := 45; 	B := 105; 	C := 159; 	D := 210;
				when RMF => A := 114; 	B := 68; 	C := 204; 	D := 248;
				when LDF => A := 0; 	B := 0; 	C := 100; 	D := 135;
				when CDF => A := 30; 	B := 0; 	C := 174; 	D := 113;
				when RDF => A := 104; 	B := 0; 	C := 204; 	D := 135;
				when GKP => A := 53; 	B := 0; 	C := 151; 	D := 50;
			end case;
		else
			case R is
				when STK => A := 38;   B := 315 - 248;  C := 166; 	D := 315 - 315;
				when LFW => A := 100;  B := 315 - 210;  C := 204; 	D := 315 - 315;
				when CFW => A := 53;   B := 315 - 210;  C := 151; 	D := 315 - 315;
				when RFW => A := 0;    B := 315 - 210;  C := 100; 	D := 315 - 315;
				when LMF => A := 114;  B := 315 - 68; 	C := 204; 	D := 315 - 248;
				when CMF => A := 45;   B := 315 - 105;  C := 159; 	D := 315 - 210;
				when RMF => A := 0;    B := 315 - 68; 	C := 90;  	D := 315 - 248;
				when LDF => A := 104;  B := 315 - 0; 	C := 204; 	D := 315 - 135;
				when CDF => A := 30;   B := 315 - 0; 	C := 174; 	D := 315 - 113;
				when RDF => A := 0;    B := 315 - 0; 	C := 100;  	D := 315 - 135;
				when GKP => A := 53;   B := 315 - 0; 	C := 151; 	D := 315 - 50;
			end case;
		end if;
	end RoleLimit;	
		
	-- protected body Field is 
	
	-- funzione per inizializzare le posizioni
	procedure InitField (F : in out Field_Access) is
		P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11,
		P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22 : Position;
	begin
		-- crea le posizioni
        P0 := (0, 102, 157);
		P1 := (1, 102, 10); P2 := (2, 41, 50); P3 := (3, 71, 50); P4 := (4, 133, 50);
		P5 := (5, 163, 50); P6 := (6, 41, 110); P7 := (7, 71, 110); P8 := (8, 133, 110);
		P9 := (9, 163, 150); P10 := (10, 68, 150); P11 := (11, 136, 150);
		P12 := (12, 102, 305); P13 := (13, 41, 265); P14 := (14, 71, 265);
		P15 := (15, 133, 265); P16 := (16, 163, 265);
		P17 := (17, 41, 205); P18 := (18, 71, 205); P19 := (19, 133, 205);
		P20 := (20, 163, 205); P21 := (21, 68, 165); P22 := (22, 136, 165);
					
		-- inizializza gli ID, la riga e la colonna
		F.PList(1) := P1; F.PList(2) := P2; F.PList(3) := P3; F.PList(4) := P4; F.PList(5) := P5; F.PList(6) := P6;
		F.PList(7) := P7; F.PList(8) := P8; F.PList(9) := P9; F.PList(10) := P10; F.PList(11) := P11;
		F.PList(12) := P12; F.PList(13) := P13; F.PList(14) := P14; F.PList(15) := P15; F.PList(16) := P16; F.PList(17) := P17;
		F.PList(18) := P18; F.PList(19) := P19; F.PList(20) := P20; F.PList(21) := P21; F.PList(22) := P22;
		
		-- inizializza la posizione della palla
		-- Ball := (0, 102, 157);
        F.PList(0) := P0;
	end InitField;
		
	-- funzione per leggere lo stato del campo
	function GetPositions (F : in Field_Access) return PositionList is
	begin
		return F.PList;
	end GetPositions;
		
	-- funzione per la posizione di un giocatore specifico
	function GetPosition (F : in Field_Access; ID : in Integer) return Position is
		P : Position;
	begin
		for i in 0..22 loop
			if (F.PList(i).ID = ID) then
				P := F.PList(i);
			end if;
		end loop;
		return P;
	end GetPosition;
		
	-- procedura per il controllo della possibilita' di movimento se intersezione libera
	function CheckCell(F : in Field_Access; Pos : in Position) return Boolean is
		Flag : Boolean := True;
	begin
		for i in F.PList'Range loop 
			if (Pos = F.PList(i)) then
				Flag := False;
				exit;
			end if;
		end loop;
		return Flag;
	end CheckCell;		
		
	-- procedura per la modifica dello stato del campo su un oggetto protetto
	procedure SetPosition (F : in out Field_Access; ID : in Integer; M : in Move; Dir : in Integer) is
	begin
		for i in 1..22 loop -- 
			if (F.PList(i).ID = ID) then
				case M is
					when Up =>
						F.PList(i).Row := F.PList(i).Row - 1;
					when Down =>
						F.PList(i).Row := F.PList(i).Row + 1;
					when Forwd =>
						if (Dir = 1) then
							F.PList(i).Col := F.PList(i).Col + 1;
						else
							F.PList(i).Col := F.PList(i).Col - 1;
						end if;
					when Backwd =>
						if (Dir = 1) then
							F.PList(i).Col := F.PList(i).Col - 1;
						else
							F.PList(i).Col := F.PList(i).Col + 1;
						end if;
					when others =>
						null;
				end case;
			end if;
		end loop;
	end SetPosition;
	
	-- procedura per la modifica dello stato del campo su un oggetto protetto
	procedure SetPosition (F : in out Field_Access; ID : in Integer; P : in Position) is
	begin
		for i in 1..22 loop
			if (F.PList(i).ID = ID) then
				F.PList(i).Row := P.Row;
				F.PList(i).Col := P.Col;
			end if;
		end loop;
	end SetPosition;
		
	-- funzione per il test del movimento
	function CheckMovement(Dir : in Integer; M : in Move; PRole : in Role; Pos : in Position) return Boolean is
		A, B, C, D : Integer;
		Flag : Boolean := False; -- con True allora movimento completo: problema di integrita'
		TempPos : Position;
	begin
		RoleLimit (Dir, PRole, A, B, C, D);
		case M is
			when Up =>
				TempPos := Pos;
				TempPos.Row := TempPos.Row - 1;
				if (TempPos.Row < A and CheckCell(TempPos)) then
					Flag := True;
				end if;
			when Down =>
				TempPos := Pos;
				TempPos.Row := TempPos.Row + 1;
				if (TempPos.Row < C and CheckCell(TempPos)) then
					Flag := True;
				end if;
			when Forwd =>
				if (Dir = 1) then
					TempPos := Pos;
					TempPos.Col := TempPos.Col + 1;
					if (TempPos.Col < D and CheckCell(TempPos)) then
						Flag := True;
					end if;
				else
					TempPos := Pos;
					TempPos.Col := TempPos.Col - 1;
					if (TempPos.Col > D and CheckCell(TempPos)) then
						Flag := True;
					end if;
				end if;
			when Backwd =>
				if (Dir = 1) then
					TempPos := Pos;
					TempPos.Col := TempPos.Col - 1;
					if(TempPos.Col > B and CheckCell(TempPos)) then
						Flag := True;
					end if;
				else
					TempPos := Pos;
					TempPos.Col := TempPos.Col + 1;
					if(TempPos.Col < B and CheckCell(TempPos)) then
						Flag := True;
					end if;
				end if;
			when others =>
				null;
		end case;
		return Flag;
	end CheckMovement;

	-- funzione per testare se il compagno e' avanzato
	function Forward(To, From : Position; Dir : Integer) return Boolean is
		Flag : Boolean := False;
		Var : Integer := 0;
	begin
		if (Dir = 1) then
			if (To.Col >= (From.Col - Var)) then
				Flag := True;
			end if;
		else
			if (To.Col <= (From.Col + Var)) then
				Flag := True;
			end if;
		end if;
		return Flag;
	end Forward;
	
	-- funzione per la restituzione della posizione della porta
	procedure GetGoalPosition (F : access Field_Access; D : in Integer; A : out Position; B : out Position) is
	begin
		if (D = 1) then
			A := G1_P1;
			B := G1_P2;
		else
			A := G2_P1;
			B := G2_P2;
		end if;
	end GetGoalPosition;
	
	procedure ResetPosition (F : access Field_Access; ID : in Integer; P : Position) is
	begin
		for i in 1..22 loop
			if (F.PList(i).ID = ID) then
				F.PList(i).Row := P.Row;
				F.PList(i).Col := P.Col;
			end if;
		end loop;
	end ResetPosition;

	-- funzione per testare se la palla e' in campo
	function IsBallPlayable (F : access Field_Access) return Boolean is
		Test1 : Boolean := False;
		Test2 : Boolean := False;
		Test3 : Boolean := False;
	begin
		if (F.PList(0).Row >= 0 and F.PList(0).Row <= 204) then
			Test1 := True;
		end if;
		if (F.PList(0).Col >= 0 and F.PList(0).Col <= 315) then
			Test2 := True;
		end if;
		if (Test1 and Test2) then
			Test3 := True;
		end if;
		return Test3;
	end IsBallPlayable;
	
	-- funzione per testare se la palla e' uscita lateralemente
	function OverVerticalLimit (F : access Field_Access) return Boolean is
		Test : Boolean := False;
	begin
		if (F.PList(0).Row < 0 or F.PList(0).Row > 204) then
			Test := True;
		end if;
		return Test;
	end OverVerticalLimit;
	
	-- funzione per testare se la palla e' uscita dal fondo
	function OverHorizzontalLimit (F : access Field_Access) return Boolean is
		Test : Boolean := False;
	begin
		if (F.PList(0).Col < 0 or F.PList(0).Col > 315) then
			Test := True;
		end if;
		return Test;
	end OverHorizzontalLimit;
	
	-- procedura per restituire la palla al portiere
	procedure BallToKeeper (F : access Field_Access) is
	begin
		if (F.PList(0).Col < 0) then
			F.PList(0) := GetPosition(1);
		else
			F.PList(0) := GetPosition(12);
		end if;
	end BallToKeeper;
	
	-- funzione per testare se la palla e' in rete
	procedure GoalReached (F : access Field_Access; B : in out Boolean) is
		Goal : Boolean := False;
	begin
		if (F.PList(0).Row > 92 and F.PList(0).Row < 112) then
			if (F.PList(0).Col <= 0) then
				Result2 := Result2 + 1;
			else
				Result1 := Result1 + 1;
			end if;				
			Goal := True;
		end if;
		B := Goal;
	end GoalReached;
	
	-- funzione per riposizionare la palla
	procedure LateralReposition (F : access Field_Access)  is
	begin
		if (F.PList(0).Row <= 0) then
			F.PList(0).Row := 1;
		elsif (F.PList(0).Row >= 204) then
			F.PList(0).Row := 203;
		end if;
	end LateralReposition;
	
	-- procedura per impostare il risultato
	procedure SetScore (F : access Field_Access; I : in Integer) is
	begin
		if (I = 1) then
			Result1 := Result1 + 1;
		else
			Result2 := Result2 + 1;
		end if;
	end SetScore;
	
	-- procedura per ottenere il risultato parziale del match
	function GetScore(F : access Field_Access; I : Integer) return Integer is
	begin
		if (I = 1) then
			return Result1;
		else
			return Result2;
		end if;
	end GetScore;
	
    -- procedure My_Write (Stream : access Ada.Streams.Root_Stream_Type'Class;
    --                     Item   : in F) is
    -- begin
    --    Natural'Write (Stream, Item.Balance);
    -- end My_Write;
    -- 
    -- procedure My_Read (Stream : access Ada.Streams.Root_Stream_Type'Class;
    --                    Item   : out F) is
    -- begin
    --    Natural'Read (Stream, Item.Balance);
    -- end My_Read;
	
end Field;
