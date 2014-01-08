--------------------------------------------------------------------------------
-- Summary: Child event type
--------------------------------------------------------------------------------
with Common_Types;	use Common_Types;
package Basic_Event.Summary is
    
	type Summary_Event is new Event with private; 
    type Summary_Ptr is access all Summary_Event'Class;
	
    function Create(A: Actions) return Event_Ptr; 
    procedure Simulate(Id: in Integer; E: in Summary_Event);
		
private
    type Summary_Event is new Event with
        record 
	        A : Actions;
        end record;
end Basic_Event.Summary;