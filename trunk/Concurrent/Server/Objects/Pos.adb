with Ada.Numerics.Elementary_Functions;

package body Pos is

    function "-" (A, B : Pos) return Integer is
    	X, Y, Z : Integer;
    begin
    	X := abs (A.Row - B.Row);
    	Y := abs (A.Col - B.Col);
    	Z := Integer( Ada.Numerics.Elementary_Functions.Sqrt (Float(X**2) + Float(Y**2)) );
    	return Z;
    end "-";

    function "=" (A, B : Pos) return Boolean is
    	X : Boolean := False;
    begin
    	if (A.Row = B.Row) then
    		if (A.Col = B.Col) then
    			X := True;
    		end if;
    	end if;
    	return X;
    end "=";

    function Near(A, B : Pos) return Boolean is
    	X : Boolean := False;
    begin
    	if ((A.Row = B.Row - 1) or (A.Row = B.Row + 1) or (A.Row = B.Row - 2) or (A.Row = B.Row + 2)) then
    		if ((A.Col = B.Col - 1) or (A.Col = B.Col + 1) or (A.Col = B.Col - 2) or (A.Col = B.Col + 2)) then
    			X := True;
    		end if;
    	end if;
    	return X;
    end Near;
	
end Pos;