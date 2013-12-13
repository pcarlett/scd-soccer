--------------------------------------------------------------------------------
-- Address Book: Process that append and manage new events 
--               (talks with Event Manager and Event Display)
--------------------------------------------------------------------------------
with Ada.Text_IO;        use Ada.Text_IO;
package body Address_Book is

        protected Protected_Address_Book is
                entry Protected_Push (E_Ptr: in Basic_Event.Event_Ptr);
                entry Protected_Pop (E_Ptr: out Basic_Event.Event_Ptr);
        end Protected_Address_Book;
        
        protected body Protected_Address_Book is
                entry Protected_Register (E_Ptr: in Basic_Event.Event_Ptr) 
                        when Length < Queue_Size is
                begin
                Data(Tail) := E_Ptr;
                        Put_Line ("E_Que: event pushed in queue.");
                Tail := Tail mod Queue_Size + 1;
                Length := Length + 1;
                end Protected_Register;
                
                entry Protected_Get_Address (E_Ptr: out Basic_Event.Event_Ptr) 
                        when Length > 0 is
                begin
                E_Ptr := Data(Head);
                        Put_Line ("E_Que: event popped out from queue.");
                Head := Head mod Queue_Size + 1;
                Length := Length - 1;
                end Protected_Get_Address;
        end Protected_Address_Book;

        procedure Register (E_Ptr: in Basic_Event.Event_Ptr) is
        begin
                Protected_Address_Book.Protected_Register (E_Ptr);
        end Register;
        
    procedure Get_Address (E_Ptr: out Basic_Event.Event_Ptr) is
        begin
                Protected_Address_Book.Protected_Get_Address (E_Ptr);
        end Get_Address;

end Address_Book;
