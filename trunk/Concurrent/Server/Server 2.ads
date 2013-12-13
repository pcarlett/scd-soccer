------------------------------------------------------
--
-- classe principale del gioco lato server
--
--
--
------------------------------------------------------
with Game;              use Game;
with Field;		use Field;
with Ball;      		use Ball;
with Ball_Controller;      		use Ball_Controller;
with Timer_Package;		use Timer_Package;
with TimeCount_Package; use TimeCount_Package;

package Server is
    
	-- dichiarazione di oggetto remoto
	-- pragma Remote_Types;
	-- pragma Shared_Passive;
	-- pragma Remote_Call_Interface;
    
	procedure GetInit (Field : in out Field_Access; Ball : in out Ball_Access; Time : in out TimeCount_Access; Timer : in out Timer_Access);
    
    procedure Start;
    
end Server;
