with Ada.Text_IO;					use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;

package body Vector_Package is

	protected body Vector is 
	
		-- funzione per inizializzare le posizioni
		procedure InitVector is
			P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11,
			P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22 : Position;
		begin
			-- crea le posizioni
			P1 := (1, 102, 10); P2 := (2, 41, 50); P3 := (3, 71, 50); P4 := (4, 133, 50);
			P5 := (5, 163, 50); P6 := (6, 41, 110); P7 := (7, 71, 110); P8 := (8, 133, 110);
			P9 := (9, 163, 150); P10 := (10, 68, 150); P11 := (11, 136, 150);
			P12 := (12, 102, 305); P13 := (13, 41, 265); P14 := (14, 71, 265);
			P15 := (15, 133, 265); P16 := (16, 163, 265);
			P17 := (17, 41, 205); P18 := (18, 71, 205); P19 := (19, 133, 205);
			P20 := (20, 163, 205); P21 := (21, 68, 165); P22 := (22, 136, 165);
					
			-- inizializza gli ID, la riga e la colonna
			PList(1) := P1; PList(2) := P2; PList(3) := P3; PList(4) := P4; PList(5) := P5; PList(6) := P6;
			PList(7) := P7; PList(8) := P8; PList(9) := P9; PList(10) := P10; PList(11) := P11;
			PList(12) := P12; PList(13) := P13; PList(14) := P14; PList(15) := P15; PList(16) := P16; PList(17) := P17;
			PList(18) := P18; PList(19) := P19; PList(20) := P20; PList(21) := P21; PList(22) := P22;
		
			-- inizializza la posizione della palla
			Ball := (0, 102, 157);
		end InitVector;
	
		-- procedura per la modifica dello stato del campo su un oggetto protetto
		procedure SetPosition (ID : in Integer; R : in Integer; C : in Integer) is
		begin
			for i in 0..22 loop 
				if (PList(i).ID = ID) then
					PList(i).Row := R;
					PList(i).Col := C;
				end if;
			end loop;			
		end SetPosition;

		-- funzione per leggere lo stato del campo
		function GetPositions return PositionList is
		begin
			return PList;
		end GetPositions;
			
		-- funzione per la posizione di un giocatore specifico
		function GetPlayerPosition (ID : in Integer) return Position is
			P : Position;
		begin
			for i in 0..22 loop
				if (PList(i).ID = ID) then
					P := PList(i);
				end if;
			end loop;
			return P;
		end GetPlayerPosition;
			
		-- funzione per la restituzione della posizione del pallone
		function GetBallPosition return Position is
		begin
			return Ball;
		end GetBallPosition;
		
		-- procedura per ottenere il risultato parziale del match
		function GetScore(I : Integer) return Integer is
		begin
			if (I = 1) then
				return Result1;
			else
				return Result2;
			end if;
		end GetScore;
		
	end Vector;
	
end Vector_Package;
