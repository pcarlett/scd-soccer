------------------------------------------------------
--
-- processo di visualizzazione del campo 
-- interfaccia con le classi GTK+
--
--
------------------------------------------------------
with Pos;               use Pos;
with Field;		        use Field;
with Ball;      		use Ball;
with Ball_Controller;   use Ball_Controller;
with Timer;     		use Timer;
with Timer_Controller;  use Timer_Controller;
with Server;        	use Server;
with Gtk.Window;	 	use Gtk.Window;
with Gtk.Drawing_Area;	use Gtk.Drawing_Area;
with Glib;				use Glib;
with Gtk.Button;		use Gtk.Button;
with Gtk.Enums;			use Gtk.Enums;
with Gtk.Widget;		use Gtk.Widget;
with Gdk;				use Gdk;
use type Glib.Gint;
	
package Display_Package is

	type Gtk_Drawing_Area is access all Gtk_Drawing_Area_Record'Class;	

	-- procedura per disegnare il contenuto del campo
	procedure Draw_Content (Pixmap : Gdk.Gdk_Drawable);

	-- funzione per il buffer
	function Draw_Buffer (Area : Gtk.Drawing_Area.Gtk_Drawing_Area) return Boolean;

	-- procedura per uscire dal gioco
	procedure Quitter (Button : access Gtk.Button.Gtk_Button_Record'Class);

	-- procedura per chiudere i processi
	procedure Quit (Win : access Gtk.Window.Gtk_Window_Record'Class);

	-- procedura per inizializzare le variabili
	procedure References(F : in Field_Access; B : in Ball_Access; Tmr : out Timer_Controller_Access; Tm : out Timer_Access);

	-- procedura per inizializzare il display
	procedure Init;
				
end Display_Package;