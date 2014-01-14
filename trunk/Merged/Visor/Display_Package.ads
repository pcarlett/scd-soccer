------------------------------------------------------
--
-- processo di visualizzazione del campo 
-- interfaccia con le classi GTK+
--
--
------------------------------------------------------
with Common_Types;		use Common_Types;
with Vector_Package;	use Vector_Package;
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

	-- procedura 
	procedure References(V : in Vector_Access);

	-- procedura per inizializzare il display
	procedure Init;
				
end Display_Package;