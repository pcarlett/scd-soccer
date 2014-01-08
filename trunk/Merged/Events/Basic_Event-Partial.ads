--------------------------------------------------------------------------------
-- Partial: Child event type
--------------------------------------------------------------------------------
with Common_Types;          use Common_Types;
package Basic_Event.Partial is
    
    type Partial_Event is new Event with private;
	
	function Create(ID: Integer; A: Actions) return Event_Ptr; 
    procedure Simulate(Id: in Integer; E: in Partial_Event);
	-- procedure Transfer (E: access Partial_Event; E2: access Partial_Event);

private
    type Partial_Ptr is access all Partial_Event; 
    type Partial_Event is new Event with
        record
            ID: Integer;
            A: Actions;
        end record;
end Basic_Event.Partial;