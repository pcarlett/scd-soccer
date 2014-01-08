--------------------------------------------------------------------------------
-- Queuer: Process that append and manage new events 
--         (talks with Event Manager and Event Display)
--------------------------------------------------------------------------------
with Ada.Text_IO;	use Ada.Text_IO;
package body Queue is

	protected Protected_Queue is
		entry Protected_Push (E_Ptr: in Basic_Event.Event_Ptr);
		entry Protected_Pop (Id: in Integer; E_Ptr: out Basic_Event.Event_Ptr);
	end Protected_Queue;
	
	protected body Protected_Queue is
		entry Protected_Push (E_Ptr: in Basic_Event.Event_Ptr) 
			when Length1 < Queue_Size and Length2 < Queue_Size is
		begin
			-- queue push
	        Data(Tail) := E_Ptr;
	        Tail := Tail mod Queue_Size + 1;
	        Tail1 := Tail1 mod Queue_Size + 1;
	        Tail2 := Tail2 mod Queue_Size + 1;
	        Length1 := Length1 + 1;
	        Length2 := Length2 + 1;
			Put_Line ("E_Que: event pushed in queue.");
			Put_Line ("L1: " & Integer'Image(Length1) & " L2: " & Integer'Image(Length2));
			Put_Line ("H1: " & Integer'Image(Head1) & " H2: " & Integer'Image(Head2));
			Put_Line ("T1: " & Integer'Image(Tail1) & " T2: " & Integer'Image(Tail2));
		end Protected_Push;
		
		entry Protected_Pop (Id: in Integer; E_Ptr: out Basic_Event.Event_Ptr) 
			when Length1 > 0 or Length2 > 0 is
		begin
			case Id is
				when 1 => 
					E_Ptr := Data(Head1);
					Put_Line ("E_Que: event popped out from queue.");
			        Head1 := Head1 mod Queue_Size + 1;
			        Length1 := Length1 - 1;
				when 2 =>
					E_Ptr := Data(Head2);
					Put_Line ("E_Que: event popped out from queue.");
			        Head2 := Head2 mod Queue_Size + 1;
			        Length2 := Length2 - 1;
				when others =>
					Put_Line ("E_Que: error in popping from queue.");
			end case;
		end Protected_Pop;
	end Protected_Queue;

	procedure Push (E_Ptr: in Basic_Event.Event_Ptr) is
	begin
		Protected_Queue.Protected_Push (E_Ptr);
	end Push;
	
    procedure Pop (Id: in Integer; E_Ptr: out Basic_Event.Event_Ptr) is
	begin
		Protected_Queue.Protected_Pop (Id, E_Ptr);
	end Pop;

end Queue;