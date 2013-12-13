------------------------------------------------------
--
-- classe principale del gioco lato client
--
--
--
------------------------------------------------------

package body Client is

	-- F : Field_Access;
	-- B : Ball_Access;
	-- Tm : TimeCount_Access;
    -- Tmr : Timer_Access;
    
    -- debug
    -- BP, PP : Position;

	procedure Start is

		-- il client deve solo inizializzare l'interfaccia grafica
		-- andando a prendere i dati direttamente dal server
        
		begin

            -- messaggio Start client
            Ada.Text_IO.Put_Line("*** - Client Start - ***");

			-- GetVariables(F, B, Tm, Tmr);
                        
            ---------------------------------------
            -- Check for Debug Players Positions --
            ---------------------------------------
    		-- BP := F.GetPosition(0);
            -- Ada.Text_IO.Put_Line("Ball " & Integer'Image(BP.ID) & ": Row " & Integer'Image(BP.Row) & " - Col " & Integer'Image(BP.Col));
    		-- for i in 1..22 loop
    		-- 	if (i < 12) then
    		-- 		PP := F.GetPosition(i);
            --      Ada.Text_IO.Put_Line("-C- Integer: " & Integer'Image(i) & " Player " & Integer'Image(PP.ID) & ": Row " & Integer'Image(PP.Row) & " - Col " & Integer'Image(PP.Col));
    		-- 	else
    		-- 		PP := F.GetPosition(i);
            --      Ada.Text_IO.Put_Line("-C- Integer: " & Integer'Image(i) & " Player " & Integer'Image(PP.ID) & ": Row " & Integer'Image(PP.Row) & " - Col " & Integer'Image(PP.Col));
    		-- 	end if;
    		-- end loop;

            Ada.Text_IO.Put_Line("*** - Client Connected and Initialized - ***");
                        
			-- lancio dell'interfaccia grafica
			Gtk.Main.Set_Locale;
			Gtk.Main.Init;
			-- Display_Package.References(F, B, Tm, Tmr);
			Display_Package.Init;
            Ada.Text_IO.Put_Line("*** - Client Loading - ***");
			Gtk.Main.Main;
            Ada.Text_IO.Put_Line("*** - Client Loaded - ***");

	end Start;

end Client;
