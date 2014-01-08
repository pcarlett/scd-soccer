--------------------------------------------------------------------------------
-- Stats: class that records any update from current game and stores it on 
--        a record type
--------------------------------------------------------------------------------
with Common_Types;	use Common_Types;
package Stats is
	
	pragma Remote_Call_Interface;
			
	procedure Update (ID: in Integer; A: in Actions);
	procedure Get_Stats (G1, G2, F1, F2, Off1, Off2, Out1, Out2, P1, P2 : out Integer);
	
	pragma Asynchronous (Update);
	
private
	Stat_Size : constant := 10;
	subtype Stat_Range is Positive range 1..Stat_Size;
	Stat : array (Stat_Range) of Integer; 
end Stats;