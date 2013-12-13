package body Manager_Package is

	procedure ChangeModule (Md : in Module; Pr : PropsArray_Access) is
	begin
		case Md is
			when Mod442 =>
				-- cambia il ruolo dei 10 giocatori
				Pr( 2).SetRole(LDF);
				Pr( 3).SetRole(CDF);
				Pr( 4).SetRole(CDF);
				Pr( 5).SetRole(RDF);
				Pr( 6).SetRole(LMF);
				Pr( 7).SetRole(CMF);
				Pr( 8).SetRole(CMF);
				Pr( 9).SetRole(RMF);
				Pr(10).SetRole(LFW);
				Pr(11).SetRole(RFW);				                    
			when Mod352 =>
				-- cambia il ruolo dei 10 giocatori
				Pr( 2).SetRole(LDF);
				Pr( 3).SetRole(CDF);
				Pr( 4).SetRole(RDF);
				Pr( 5).SetRole(LMF);
				Pr( 6).SetRole(CMF);
				Pr( 7).SetRole(CMF);
				Pr( 8).SetRole(CMF);
				Pr( 9).SetRole(RMF);
				Pr(10).SetRole(LFW);
				Pr(11).SetRole(RFW);				                    
			when Mod343 =>
				-- cambia il ruolo dei 10 giocatori
				Pr( 2).SetRole(LDF);
				Pr( 3).SetRole(CDF);
				Pr( 4).SetRole(RDF);
				Pr( 5).SetRole(LMF);
				Pr( 6).SetRole(CMF);
				Pr( 7).SetRole(CMF);
				Pr( 8).SetRole(RMF);
				Pr( 9).SetRole(LFW);
				Pr(10).SetRole(CFW);
				Pr(11).SetRole(RFW);				                    
			when Mod451 =>
				-- cambia il ruolo dei 10 giocatori
				Pr( 2).SetRole(LDF);
				Pr( 3).SetRole(CDF);
				Pr( 4).SetRole(CDF);
				Pr( 5).SetRole(RDF);
				Pr( 6).SetRole(LMF);
				Pr( 7).SetRole(CMF);
				Pr( 8).SetRole(CMF);
				Pr( 9).SetRole(CMF);
				Pr(10).SetRole(RMF);
				Pr(11).SetRole(STK);				                    
			when others =>
				null;
		end case;
	end ChangeModule;
	
	-- function GetFieldState() return PlayerList;
	
	-- procedure ChangePlayers(A : in Player; B : in Player);
	
	-- procedure ChangeStrategy(A : in Strategy);

	task body Manager is
	
		-- T: team
	
	begin
		------------------------------------
		-- permette al manager di partire --
		------------------------------------
		accept Start;

		loop
			
			-------------------------------------------
			-- termina il ciclo di gioco del manager --
			-------------------------------------------
			select
				accept Stop;
				exit;
	         else
				null;
			end select;
			
		end loop;

	end Manager;
	
end Manager_Package;