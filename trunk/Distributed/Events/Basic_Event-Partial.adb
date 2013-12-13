--------------------------------------------------------------------------------
-- Partial body: Child event type
--------------------------------------------------------------------------------
with Ada.Text_IO;	use Ada.Text_IO;
with Ada.Exceptions;
with Printer;
with Printer2;
package body Basic_Event.Partial is
    function Create (ID: Integer; A: Actions) return Event_Ptr is 
        E: Partial_Ptr := new Partial_Event;
    begin
		E.ID := ID;
        E.A := A;
        return Event_Ptr(E);
    end Create;

    procedure Simulate(Id: in Integer; E: in Partial_Event) is 
    begin
		case Id is
			when 1 =>
				Printer.Print (E.ID, E.A);
			when 2 =>
				Printer2.Print (E.ID, E.A);
			when others =>
				Put_Line ("Error occurred in Printer redirection.");
		end case;
		exception
			when Error: others =>
				Put_Line(Ada.Exceptions.Exception_Information(Error));
    end Simulate;
end Basic_Event.Partial;