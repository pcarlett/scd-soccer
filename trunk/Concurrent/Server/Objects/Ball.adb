with Ada.Real_Time;		use	Ada.Real_Time;

package body Ball is

    procedure StopMoving (B : access Ball) is
	begin
        if (B.Owner = 0 and B.Moving) then
			B.Moving := False;
        end if;
	end StopMoving;
	
	-- imposta il proprietario del pallone 
	procedure Control (B : access Ball; ID : in Integer) is
	begin
        if(B.Owner = 0) then
    		B.Owner := ID;
        end if;
	end Control;
	
	-- gestisce il movimento della palla
	procedure Movement (F : in out Field_Access; B : access Ball) is
	begin
        if(B.Moving and B.Owner = 0) then
    		SetPosition(F, 0, B.Step, B.Dir);
    		B.Power := B.Power - 1;
    		if (B.Power = 0) then
    			B.Moving := False;
    		end if;
        end if;
	end Movement;
		
	procedure Kick (B : access Ball; D : in Integer; S : in Move; Pw : in Integer) is
	begin
        if (B.Owner /= 0) then
    		B.Owner := 0;
    		B.Dir := D;
    		B.Step := S;
    		B.Power := Pw;
    		B.Moving := True;
        end if;
	end Kick;
	
	-- ritorna il possessore della palla
	function GetOwner (B : access Ball) return Integer is
	begin
		return B.Owner;
	end GetOwner;
			
end Ball;
