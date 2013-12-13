with Ada.Text_IO;
with PolyORB.Parameters;

package body Server is
    
	procedure GetVariables (Field : out Field_Access; Ball : out Ball_Access; Time : out Timer_Controller_Access; Timer : out Timer_Access) is
    begin
		Field := F;
		Ball := B;
		Time := Tm;
		Timer := Tmr;
    end GetVariables;
    
    
    --function GetCoordinates(F : in Field_Access; Int : in Integer) return Position is
    function GetCoordinates(F : in Field_Access; Int : in Integer) return Position is
        P : Position;
        -- F : Field_Access;
    begin
        -- F := GetField;
        P := GetPosition(F, Int);
        return P;
    end GetCoordinates;
    
	procedure Start is

		-- la procedura server inizializza il task SERVER che accetta i client
		-- e far partire l'inizializzazione delle componenti

		-- il server inizializza le sue componenti (Field, Ball, Timer, TaskBall, Referee)
		-- e 2 client connessi (Player, Manager, Team, GUI con Gtk)
        
	begin

        -- messaggio Start server
        Ada.Text_IO.Put_Line("*** - Server Init - ***");

        Ada.Text_IO.Put_Line ("");
        Ada.Text_IO.Put_Line ("Server started, embedded name server is at:");
        Ada.Text_IO.Put_Line ("");
        Ada.Text_IO.Put ("export POLYORB_DSA_NAME_SERVICE=");
        Ada.Text_IO.Put_Line (PolyORB.Parameters.Get_Conf ("dsa", "name_service", ""));
        Ada.Text_IO.Put_Line ("");

        for i in 1..10 loop
            Ada.Text_IO.Put (Integer'Image(10 - i + 1));
            delay 0.5;
            Ada.Text_IO.Put (" * ");
            delay 0.5;            
        end loop;
        
        Ada.Text_IO.Put_Line ("");

        Game.Play;
        
        -- messaggio End server
        Ada.Text_IO.Put_Line ("");
        Ada.Text_IO.Put_Line("*** - Server Completed. Up and Running. Waiting for Client - ***");

	end Start;

end Server;
