with Ada.Real_Time;		use	Ada.Real_Time;

package body Ball_Controller is

	task body Ball_Controller is
		-- B: palla
		Current_Period : Time_Span := Milliseconds(S);
		Next_Cycle : Time := Clock + Current_Period;
	begin
		-- inizializza il movimento della palla
		accept Start;

		loop
			----------------------
			-- muove il pallone --
			----------------------
			Movement(F, B);
			
			---------------------------------------------
			-- termina il ciclo di gioco del giocatore --
			---------------------------------------------
			select
				accept Stop;
				exit;
	         else
				null;
			end select;
	        
			---------------------------------
			-- definisce il prossimo ciclo --
			---------------------------------
			Next_Cycle := Next_Cycle + Current_Period;
			delay until Next_Cycle;
			
		end loop;
	end Ball_Controller;

end Ball_Controller;
