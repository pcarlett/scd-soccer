--------------------------------------------------------------------------------
-- Event Display: Process that receive events from queues and put them in 
--                a buffer or display them from command line
--------------------------------------------------------------------------------
with Common_Types;	use Common_Types;
with Basic_Event;
with Queue;
package Event_Display is

    task type E_Display is
        entry Start (Id: in Integer);
        -- entry Display (E: in Basic_Event.Event);
        -- entry Display;
    end E_Display;
	
    type E_Display_Acc is access all E_Display;
	
end Event_Display;
