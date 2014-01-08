--------------------------------------------------------------------------------
-- Main Server: Main procedure that init server side tasks 
--
--------------------------------------------------------------------------------
with Ada.Text_IO;
with Event_Generator;
with Event_Manager;
with Queue;
with Event_Display;
procedure Server is
	E_Gen: Event_Generator.E_Generator_Acc := new Event_Generator.E_Generator;
	E_Mgr: Event_Manager.E_Manager_Acc := new Event_Manager.E_Manager;
begin
	-- init of manager and generator
	E_Mgr.Start;
	E_Gen.Start(E_Mgr);
	-- init of main loop
	loop
		Ada.Text_IO.Put ("*");
		delay 1.0;
	end loop;
end Server;