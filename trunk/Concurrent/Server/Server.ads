------------------------------------------------------
--
-- classe principale del gioco lato server
--
--
--
------------------------------------------------------
with Pos;               use Pos;
with Game;              use Game;
with Field;     		use Field;
with Ball;      		use Ball;
with Ball_Controller;   use Ball_Controller;
with Timer;		        use Timer;
with Timer_Controller;  use Timer_Controller;

package Server is
    
	-- dichiarazione di oggetto remoto
	-- pragma Remote_Types;
	-- pragma Shared_Passive;
	-- pragma Remote_Call_Interface;
        
    F : Field_Access;
    B : Ball_Access;
    Tm : Timer_Controller_Access;
    Tmr : Timer_Access;    
    
	procedure GetVariables (Field : out Field_Access; Ball : out Ball_Access; Time : out Timer_Controller_Access; Timer : out Timer_Access);

    function GetCoordinates(F : in Field_Access; Int : in Integer) return Position;

    procedure Start;
    
end Server;
