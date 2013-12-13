------------------------------------------------------
--
-- classe principale del gioco lato client
--
--
--
------------------------------------------------------
-- with Pos;          use Pos;
-- with Timer_Package;		        use Timer_Package;
-- with Field;		        use Field;
-- with Ball;      		use Ball;
-- with Ball_Controller;      		use Ball_Controller;
with Display_Package;	        use Display_Package;
with Gtk.Main;			        use Gtk.Main;
-- with Server;        	        use Server;
with Ada.Text_IO;

package Client is

	-- dichiarazione di oggetto remoto
	-- pragma Remote_Types;
	-- pragma Shared_Passive;
    -- pragma Remote_Call_Interface;

	procedure Start;

end Client;
