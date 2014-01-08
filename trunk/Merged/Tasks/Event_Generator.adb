--------------------------------------------------------------------------------
-- Event Generator: Process that simulates soccer match and generates 
--                  notifications to Event Manager
--------------------------------------------------------------------------------
with Ada.Text_IO;		use Ada.Text_IO;
with Common_Types;		use Common_Types;
with Event_Manager;
with Ada.Strings;
with Ada.Numerics.Discrete_Random;
package body Event_Generator is

    type Notification1 is
        record
            A: Actions;
        end record;
        
    type Notification2 is
        record
            ID: Integer;
            A: Actions;
        end record;

    type Notification3 is
        record
            ID: Integer;
            Row: Integer;
            Col: Integer;
        end record;                

    task body E_Generator is
        -- array containing some notifications as full working system could generate
        Data1 : array (1..10) of Notification1;
        Data2 : array (1..10) of Notification2;
        Data3 : array (1..10) of Notification3;
		
	    -- Dice to extract 1 of the 3 arrays of notifications
	    subtype Array_Die is Integer range 1 .. 3;
	    subtype Array_Dice is Integer range Array_Die'First .. Array_Die'Last;
	    package Random_Array_Die is new Ada.Numerics.Discrete_Random (Array_Die);
	    use Random_Array_Die;
	    G: Generator;
	    D1: Array_Dice;
	    -- Dice to extract 1 of the 10 notifications
	    subtype Notif_Die is Integer range 1 .. 10;
	    subtype Notif_Dice is Integer range Notif_Die'First .. Notif_Die'Last;
	    package Random_Notif_Die is new Ada.Numerics.Discrete_Random (Notif_Die);
	    use Random_Notif_Die;
	    D2 : Notif_Dice;
		
		-- Event Manager pointer for communications
		E_Mgr: Event_Manager.E_Manager_Acc;		
    begin
        -- init array of notifications type 1: strings
        Data1( 1) := (A => Ball_Out);
        Data1( 2) := (A => Goal);
        Data1( 3) := (A => Fault);
        Data1( 4) := (A => Offside);
        Data1( 5) := (A => Penalty);
        Data1( 6) := (A => Ball_Out);
        Data1( 7) := (A => Goal);
        Data1( 8) := (A => Fault);
        Data1( 9) := (A => Offside);
        Data1(10) := (A => Penalty);
        
        -- init of array of notifications type 2: actions
        Data2( 1) := (ID => 15, A => Ball_Out);
        Data2( 2) := (ID => 9,  A => Goal);
        Data2( 3) := (ID => 7,  A => Fault);
        Data2( 4) := (ID => 14, A => Offside);
        Data2( 5) := (ID => 7,  A => Penalty);
        Data2( 6) := (ID => 18, A => Ball_Out);
        Data2( 7) := (ID => 9,  A => Goal);
        Data2( 8) := (ID => 11, A => Fault);
        Data2( 9) := (ID => 3,  A => Offside);
        Data2(10) := (ID => 3,  A => Penalty);

        -- init of array of notifications type 3: positions
        Data3( 1) := (ID => 15, Row => 10, Col => 14);
        Data3( 2) := (ID => 9,  Row => 58, Col => 95);
        Data3( 3) := (ID => 7,  Row => 61, Col => 35);
        Data3( 4) := (ID => 14, Row => 14, Col => 49);
        Data3( 5) := (ID => 7,  Row => 84, Col => 28);
        Data3( 6) := (ID => 18, Row => 96, Col => 64);
        Data3( 7) := (ID => 9,  Row => 72, Col => 14);
        Data3( 8) := (ID => 11, Row => 72, Col => 58);
        Data3( 9) := (ID => 3,  Row => 45, Col => 38);
        Data3(10) := (ID => 3,  Row => 36, Col => 76);
        
        accept Start (Ptr: in Event_Manager.E_Manager_Acc) do
            Put ("Event Generator activating...");
			E_Mgr := Ptr;
        end Start;
        Put_Line (" done.");

        Reset (G);  -- Start generators in a unique state in each run
        for I in Integer range 1 .. 100 loop
        	-- Roll a pair of dice; sum and process the results
           	D1 := Random(G); D2 := Random(G);
	  		Put_Line ("E_Gen generating new message type:" & Integer'Image(D1) & ".");
           	case D1 is
            	when 1 =>
                  	E_Mgr.Generate (Data1(D2).A);
              	when 2 =>
                	E_Mgr.Generate (Data2(D2).ID, Data2(D2).A);
            	when 3 =>
            	    E_Mgr.Generate (Data3(D2).ID, Data3(D2).Row, Data3(D2).Col);
            	when others =>
                  	Put_Line ("Error generating notifications: check Event_Generator package.");
           	end case;
           	delay 2.0;
   	 	end loop;
        
    end E_Generator;
    
end Event_Generator;