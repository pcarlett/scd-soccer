package Pos is

    pragma Pure;

    type Pos is record
    	ID : Integer;
    	Row : Integer;
    	Col : Integer;
    end record;

	function "-" (A, B : Pos) return Integer;
	
	function "=" (A, B : Pos) return Boolean;

	function Near(A, B : Pos) return Boolean;

    subtype Position is Pos;

end Pos;