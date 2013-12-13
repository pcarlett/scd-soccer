with Ada.Real_Time;		use Ada.Real_Time;

package body Timer_Controller is
		
	task body Timer_Ctrl is
		
		Current_Period : Time_Span := Milliseconds(1);
		Next_Cycle : Time := Clock + Current_Period;
		
	begin
		-- avvia il timer del gioco e avvia giocatori e controller della palla
		accept Start;

		-- avvia l'esecuzione di taskball e dei giocatori
		B.Start;
		M1.Start;
		M2.Start;
		for i in 1..11 loop
			T1(i).Start;
			T2(i).Start;
		end loop;

		for i in 1..T.GetTotalTime loop

			if (i mod 100 = 0) then
				T.Increment;
			end if;
	
			if (T.GetTime = T.GetTotalTime) then 
				-- termina l'esecuzione di taskball e dei giocatori
				B.Stop;
				M1.Stop;
				M2.Stop;
				for i in 1..11 loop
					T1(i).Stop;
					T2(i).Stop;
				end loop;
				exit;
			end if;
				
			---------------------------------
			-- definisce il prossimo ciclo --
			---------------------------------
			Next_Cycle := Next_Cycle + Current_Period;
			delay until Next_Cycle;
			
		end loop;
			
	end Timer_Ctrl;
		
end Timer_Controller;