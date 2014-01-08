--------------------------------------------------------------------------------
-- Event Display: Process that receive events from queues and put them in 
--                a buffer or display them from command line
--------------------------------------------------------------------------------
with Ada.Text_IO;		use Ada.Text_IO;
with Queue;
with Stats;
with Printer;
with Printer2;
with Basic_Event;
package body Event_Display is

    task body E_Display is
		D_Id: Integer;
        E: Basic_Event.Event_Ptr;
		I: Integer := 0;
		G1, G2, F1, F2, Off1, Off2, Out1, Out2, P1, P2 : Integer := 0;
    begin
        accept Start (Id: in Integer) do
            Put ("Event Display activating...");
			D_Id := Id;
        end Start;
        Put_Line (" done.");
        loop
			Queue.Pop(D_Id, E);
			Put ("E_Dis: ");
			Basic_Event.Simulate(D_Id, E.all);
			I := I + 1;
			if (I mod 5 = 0) then
				Stats.Get_Stats (G1, G2, F1, F2, Off1, Off2, Out1, Out2, P1, P2);
				if (D_Id = 1) then
					Printer.Print (G1, G2, F1, F2, Off1, Off2, Out1, Out2, P1, P2);
				elsif (D_Id = 2) then
					Printer2.Print (G1, G2, F1, F2, Off1, Off2, Out1, Out2, P1, P2);
				end if;
			end if;
        end loop;
    end E_Display;
    
end Event_Display;