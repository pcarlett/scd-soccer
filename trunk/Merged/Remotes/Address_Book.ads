--------------------------------------------------------------------------------
-- Address Book: Process that append and manage new events 
--               (talks with Event Manager)
--------------------------------------------------------------------------------
package Address_Book is
        
        pragma Remote_Call_Interface;

        procedure Register (E_Ptr: in Basic_Event.Event_Ptr);
    procedure Get_Address (E_Ptr: out Basic_Event.Event_Ptr);
        
        pragma Asynchronous (Register);
        
        private
            Queue_Size : constant := 3;
            subtype Queue_Range is Positive range 1 .. Queue_Size;
            Length : Natural range 0 .. Queue_Size := 0;
            Head, Tail : Queue_Range := 1;
            Data : array (Queue_Range) of Basic_Event.Event_Ptr;
end Address_Book;
