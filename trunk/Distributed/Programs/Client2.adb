--------------------------------------------------------------------------------
-- Main Server: Main procedure that init server side tasks 
--
--------------------------------------------------------------------------------
with Ada.Text_IO;
with Event_Display;
procedure Client2 is
	E_Dis: Event_Display.E_Display_Acc := new Event_Display.E_Display;
begin
	-- init of display istance
	E_Dis.Start (2);
	-- init of main loop
	loop
		Ada.Text_IO.Put ("*");
		delay 1.0;
	end loop;
		
end Client2;