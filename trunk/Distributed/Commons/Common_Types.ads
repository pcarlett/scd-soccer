--------------------------------------------------------------------------------
-- Common Types: Package that contains common types used by system 
--------------------------------------------------------------------------------
package Common_Types is

	pragma Pure;

    type Actions is (Goal, Fault, Offside, Ball_Out, Penalty);
	
	type Team is (Blue, Red);

end Common_Types;