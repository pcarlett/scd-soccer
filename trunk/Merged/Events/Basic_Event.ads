--------------------------------------------------------------------------------
-- Basic event type
--------------------------------------------------------------------------------
with Ada.Strings;
package Basic_Event is
    
	pragma Remote_Types;
		
	type Event is abstract tagged limited private;
	type Event_Ptr is access all Event'Class;

	pragma Asynchronous (Event_Ptr);

	function Create return Event_Ptr is abstract;
    procedure Simulate(Id: Integer; E: Event) is abstract;
	
private
    type Event is abstract tagged limited null record;
end Basic_Event;