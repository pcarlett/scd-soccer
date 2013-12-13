--------------------------------------------------------------------------------
-- Main Queue Server: Main procedure that init queue server side tasks 
--
--------------------------------------------------------------------------------
with PolyORB.Parameters;
with Ada.Text_IO;
with Queue;
procedure Queuer is
begin
	-- init of main loop
	loop
		Ada.Text_IO.Put ("*");
		delay 1.0;
	end loop;
end Queuer;