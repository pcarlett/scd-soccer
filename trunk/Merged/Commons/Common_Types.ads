--------------------------------------------------------------------------------
-- Common Types: Package that contains common types used by system 
--------------------------------------------------------------------------------
package Common_Types is

	pragma Pure;

    type Actions is (Goal, Fault, Offside, Ball_Out, Penalty);
	
	type Move is (Up, Down, Forwd, Backwd);
	
	-- dichiarazione dei ruoli dei giocatori
	type Role is (STK, LFW, CFW, RFW, LMF, CMF, RMF, LDF, CDF, RDF, GKP);
	
	type Team is (Blue, Red);
	
	type Position is record
		ID : Integer;
		Row : Integer;
		Col : Integer;
	end record;
	
	type Score is record
		T1 : Integer;
		T2 : Integer;
	end record;
	
	-- gestione della lista di posizioni come array
	type PositionList is array (0..22) of Position;
	
	type Strategy is (Attack, Middle, Defense);
	
	type Module is (Mod442, Mod352, Mod343, Mod451);
	
end Common_Types;