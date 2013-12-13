------------------------------------------------------
--
-- processo arbitro
--
--
--
------------------------------------------------------
with Field;		use Field;
with Ball;      		use Ball;
with Ball_Controller;      		use Ball_Controller;
with Player_Package;	use Player_Package;

package Referee_Package is
	
	-- controlla se la palla e' uscita dai bordi
	procedure OutOfBorder(F : Field_Access; B : Ball_Access);
	
	task type Referee (F : Field_Access; B : Ball_Access) is

		pragma Priority(3);
		
		entry Goal;
		
		entry Fault;
		
	end Referee;

	-- tipo access al tipo player
	type Referee_Access is access all Referee;

end Referee_Package;
