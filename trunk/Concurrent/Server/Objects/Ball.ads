------------------------------------------------------
--
-- gestione della palla
--
--
--
------------------------------------------------------
with Field;        use Field;

package Ball is

	-- dichiarazione di oggetto remoto
	-- pragma Remote_Types;

    type B is tagged limited private;
        
    subtype Ball is B;
        
    type Ball_Access is access all Ball'Class;

    procedure StopMoving (B : access Ball);
		
	-- imposta il proprietario del pallone
	procedure Control (B : access Ball; ID : in Integer);
	
	procedure Movement (F : in out Field_Access; B : access Ball);
	
	procedure Kick (B : access Ball; D : in Integer; S : in Move; Pw : in Integer);
	
	-- ritorna il possessore della palla
	function GetOwner (B : access Ball) return Integer;

	private
        type B is tagged limited record
    		Owner : Integer := 0; -- ID del proprietario della palla
    		Moving : Boolean := False; -- Palla in movimento?
    		Dir : Integer; -- +1 o -1 per la direzione del movimento verso la porta
    		Power : Integer; -- potenza applicata al tiro
    		Step : Move; -- direzione effettiva del lancio (avanti, indietro, su, giu)
        end record;
end Ball;