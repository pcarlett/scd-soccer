--------------------------------------------------------------------------------
-- Printer: it use RCI to print strings on Display partition
--
--------------------------------------------------------------------------------
with Ada.Text_IO;	use Ada.Text_IO;
package body Printer2 is
				
	procedure Print (A: in Actions) is
	begin
		Put_Line ("Summary message: " & Actions'Image(A));
	end Print;
	
	procedure Print (ID: in Integer; A: in Actions) is
	begin
		Put_Line ("Partial message: ID " & Integer'Image(ID) & ": " & Actions'Image(A));
	end Print;
	
	procedure Print (ID: in Integer; R: in Integer; C: in Integer) is
	begin
		Put_Line ("Complete message: ID " & Integer'Image(ID) & ": Row "  
                    & Integer'Image(R) & " - Col " & Integer'Image(C));
	end Print;

	procedure Print (G1, G2, F1, F2, Off1, Off2, Out1, Out2, P1, P2 : in Integer) is
	begin
		Put_Line ("");
		Put_Line (" *-*- Stats of Game -*-* ");
		Put_Line ("Scores   -> Red: " & Integer'Image(G1) & " - Blue: " & Integer'Image(G2));
		Put_Line ("Faults   -> Red: " & Integer'Image(F1) & " - Blue: " & Integer'Image(F2));
		Put_Line ("Offsides -> Red: " & Integer'Image(Off1) & " - Blue: " & Integer'Image(Off2));
		Put_Line ("Ball Out -> Red: " & Integer'Image(Out1) & " - Blue: " & Integer'Image(Out2));
		Put_Line ("Penalties-> Red: " & Integer'Image(P1) & " - Blue: " & Integer'Image(P2));
		Put_Line (" *-*- End of Stats -*-* ");
		Put_Line ("");
	end Print;
	
end Printer2;