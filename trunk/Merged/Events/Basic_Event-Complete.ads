--------------------------------------------------------------------------------
-- Complete: Child event type
--------------------------------------------------------------------------------
package Basic_Event.Complete is
    
    type Complete_Event is new Event with private;
	
    function Create(ID: Integer; R: Integer; C: Integer) return Event_Ptr; 
    procedure Simulate(Id: in Integer; E: in Complete_Event);

private
    type Complete_Ptr is access all Complete_Event; 
    type Complete_Event is new Event with
        record
            ID: Integer;
            Row: Integer;
            Col: Integer;
        end record;
end Basic_Event.Complete;