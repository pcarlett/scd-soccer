------------------------------------------------------
--
-- processo timer
--
--
--
------------------------------------------------------
with Player_Package;		use Player_Package;
with Manager_Package;		use Manager_Package;
with Ball;      		use Ball;
with Ball_Controller;      		use Ball_Controller;
with Ada.Numerics.Discrete_Random;
with Ada.Numerics.Elementary_Functions;
use  Ada.Numerics.Elementary_Functions;

package Timer is 

	protected type T is
				
		entry Increment;
				
		-- ritorna il valore del tempo di gioco
		function GetTime return Integer;
		
		-- ritorna il tempo toale per la partita
		function GetTotalTime return Integer;

		private
		
			TotalTime : Integer := 45000;
			Timing : Integer := 0;
			
	end T;
	
    subtype Timer is T;

	-- tipo access al tipo timecount	
	type Timer_Access is access all T;    

end Timer;