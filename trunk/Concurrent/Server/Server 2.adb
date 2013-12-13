with Ada.Text_IO;
with PolyORB.Parameters;

package body Server is

	-- inizializzazione dei termini per il client
	procedure GetInit (Field : in out Field_Access; Ball : in out Ball_Access; Time : in out TimeCount_Access; Timer : in out Timer_Access) is
	begin
		Field := F;
		Ball := B;
		Time := Tm;
		Timer := Tmr;
	end GetInit;

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

        for x in 1..10 loop
            Ada.Text_IO.Put(Integer'Image(11 - x));
            delay 0.5;
            Ada.Text_IO.Put(" * ");            
            delay 0.5;
        end loop;

        Ada.Text_IO.Put_Line ("");

        Play;
        
        -- messaggio End server
        Ada.Text_IO.Put_Line("*** - Server Completed. Up and Running - ***");

	end Start;

end Server;
