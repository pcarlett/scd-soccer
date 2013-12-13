------------------------------------------------------
--
-- gestione della palla
--
--
--
------------------------------------------------------
with Field;     use Field;
with Ball;      		use Ball;

package Ball_Controller is

	-- dichiarazione di oggetto remoto
	-- pragma Shared_Passive(Ball_Package);

	task type Ball_Controller (F : access Field; B : access Ball_Access; S : Integer) is

		pragma Priority(1);	
		
		entry Start;
		
		entry Stop;
		
	end Ball_Controller;

	type Ball_Controller_Access is access Ball_Controller;

    subtype Ball_Ctrl is Ball_Controller;

end Ball_Controller;