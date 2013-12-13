--------------------------------------------------------------------------------
-- Event Queuer: Process that append and manage new events 
--               (talks with Event Manager)
--------------------------------------------------------------------------------
with Basic_Event;
package Queue is
	
	pragma Remote_Call_Interface;

	procedure Push (E_Ptr: in Basic_Event.Event_Ptr);
    procedure Pop (Id: in Integer; E_Ptr: out Basic_Event.Event_Ptr);
	
	pragma Asynchronous (Push);
	
	private
	    Queue_Size : constant := 1000;
	    subtype Queue_Range is Positive range 1 .. Queue_Size;
	    Data : array (Queue_Range) of Basic_Event.Event_Ptr;

	    -- Queue_Size2 : constant := 1000;
	    -- subtype Queue_Range2 is Positive range 1 .. Queue_Size2;
	    -- Length : Natural range 0 .. Queue_Size := 0;
		Tail : Queue_Range := 1;		-- Head, Tail : Queue_Range := 1;
		-- Parameters for 1th Queue
	    Length1 : Natural range 0 .. Queue_Size := 0;
	    Head1, Tail1 : Queue_Range := 1;
		-- Parameters for 2nd Queue
	    Length2 : Natural range 0 .. Queue_Size := 0;
	    Head2, Tail2 : Queue_Range := 1;
end Queue;