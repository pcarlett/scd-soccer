with Ada.Real_Time;		use Ada.Real_Time;

package body Timer is
	
	protected body T is
		
		-- imposta il proprietario del pallone 
		entry Increment 
			when Timing < 450 is
		begin
			Timing := Timing + 1;
		end Increment;
				
		-- ritorna il timing di gioco
		function GetTime return Integer is
		begin
			return Timing;
		end GetTime;

		-- ritorna il tempo totale del match
		function GetTotalTime return Integer is
		begin
			return TotalTime;
		end GetTotalTime;
				
	end T;
			
end Timer;