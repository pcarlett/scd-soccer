--------------------------------------------------------------------------------
-- Printer: it use RCI to print strings on Display partition
--
--------------------------------------------------------------------------------
with Common_Types;		use Common_Types;
-- with Vector_Package;	use Vector_Package;

package Printer is
	
	pragma Remote_Call_Interface;
	
	procedure Print (A: in Actions);
	procedure Print (ID: in Integer; A: in Actions);
	procedure Print (ID: in Integer; R: in Integer; C: in Integer);
	procedure Print (G1, G2, F1, F2, Off1, Off2, Out1, Out2, P1, P2 : in Integer);
	
	procedure Transmit (ID: in Integer; R: in Integer; C: in Integer);
	procedure Transmit (G1, G2, F1, F2, Off1, Off2, Out1, Out2, P1, P2 : in Integer);
	
	pragma Asynchronous (Print);
	
end Printer;