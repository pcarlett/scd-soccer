------------------------------------------------------
--
-- processo timer
--
--
--
------------------------------------------------------
with Player_Package;		use Player_Package;
with Manager_Package;		use Manager_Package;
with Timer;                 use Timer;
with Ball;      		    use Ball;
with Ball_Controller;      	use Ball_Controller;
with Ada.Numerics.Discrete_Random;
with Ada.Numerics.Elementary_Functions;
use  Ada.Numerics.Elementary_Functions;

package Timer_Controller is 

	task type Timer_Ctrl (T : Timer_Access; T1, T2 : Team_Access; M1, M2 : Manager_Access; B : Ball_Controller_Access) is	

		pragma Priority(10);
					
		entry Start;
			
	end Timer_Ctrl;

    subtype Timer_Controller is Timer_Ctrl;

	-- tipo access al tipo timer
	type Timer_Controller_Access is access all Timer_Ctrl;

end Timer_Controller;