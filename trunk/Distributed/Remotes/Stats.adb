--------------------------------------------------------------------------------
-- Stats: class that records any update from current game and stores it on 
--        a record type
--------------------------------------------------------------------------------
with Ada.Text_IO;	use Ada.Text_IO;
package body Stats is
	
	protected Protected_Stat is
		procedure Protected_Update (ID: in Integer; A: in Actions);
		procedure Protected_Get_Stats (G1, G2, F1, F2, Off1, Off2, Out1, Out2, P1, P2 : out Integer);
	end Protected_Stat;
	
	protected body Protected_Stat is
		procedure Protected_Update (ID: in Integer; A: in Actions) is
		begin
			case ID is
				when 1..11 =>
					case A is
						when Goal => Stat(1) := Stat(1) + 1;
						when Fault => Stat(2) := Stat(2) + 1;
						when Offside => Stat(3) := Stat(3) + 1;
						when Ball_Out => Stat(4) := Stat(4) + 1;
						when Penalty => Stat(5) := Stat(5) + 1;
						when others => Put_Line ("Error occurred in Stat Action registration.");
					end case;	
				when 12..22 =>
					case A is
						when Goal => Stat(6) := Stat(6) + 1;
						when Fault => Stat(7) := Stat(7) + 1;
						when Offside => Stat(8) := Stat(8) + 1;
						when Ball_Out => Stat(9) := Stat(9) + 1;
						when Penalty => Stat(10) := Stat(10) + 1;
						when others => Put_Line ("Error occurred in Stat Action registration.");
					end case;	
				when others =>
					Put_Line ("Error occurred in Stat ID registration.");
			end case;
		end Protected_Update;
	
		procedure Protected_Get_Stats (G1, G2, F1, F2, Off1, Off2, Out1, Out2, P1, P2 : out Integer) is
		begin
			G1 := Stat(1);		G2 := Stat(6);
			F1 := Stat(2);		F2 := Stat(7);
			Off1 :=	Stat(3);	Off2 := Stat(8);
			Out1 := Stat(4);	Out2 := Stat(9);
			P1 := Stat(5);		P2 := Stat(10);
		end Protected_Get_Stats;
	end Protected_Stat;

	procedure Update (ID: in Integer; A: in Actions) is
	begin
		Protected_Stat.Protected_Update (ID, A);
	end Update;
	
    procedure Get_Stats (G1, G2, F1, F2, Off1, Off2, Out1, Out2, P1, P2 : out Integer) is
	begin
		Protected_Stat.Protected_Get_Stats (G1, G2, F1, F2, Off1, Off2, Out1, Out2, P1, P2);
	end Get_Stats;
		
end Stats;