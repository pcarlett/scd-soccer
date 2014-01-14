--------------------------------------------------------------------------------
-- Main Server: Main procedure that init server side tasks 
--
--------------------------------------------------------------------------------
with Ada.Text_IO;			use Ada.Text_IO;
with Event_Display;			use Event_Display;
with Display_Package;		use Display_Package;
with Vector_Package;		use Vector_Package;
with Gtk.Main;				use Gtk.Main;

procedure Client1 is
	E_Dis: Event_Display.E_Display_Acc := new Event_Display.E_Display;
	V : Vector_Access;
begin
	-- init of display istance
	E_Dis.Start (1);
	-- init of main loop

	-- lancio dell'interfaccia grafica
	Gtk.Main.Set_Locale;
	Gtk.Main.Init;
	Display_Package.References(V);
	Display_Package.Init;
	Gtk.Main.Main;
		
end Client1;