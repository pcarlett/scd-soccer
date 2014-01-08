--------------------------------------------------------------------------------
-- Event Manager: Process that receive notifications, generate events and push
--                them to Event Queuer
--------------------------------------------------------------------------------
with Ada.Text_IO;		use Ada.Text_IO;
with Queue;
with Stats;
with Basic_Event;
with Basic_Event.Summary; 
with Basic_Event.Partial;
with Basic_Event.Complete;
package body Event_Manager is

    task body E_Manager is
        E: Basic_Event.Event_Ptr;
    begin
        accept Start do
            Put ("Event Manager activating...");
        end Start;
        Put_Line (" done.");
        loop
            select
                accept Generate (A: in Actions) do
                    Put_Line ("E_Mgr: Notif 1 received. Generating event.");
                    E := Basic_Event.Summary.Create(A);
                end Generate;
            or
                accept Generate (ID: in Integer; A: in Actions) do
                    Put_Line ("E_Mgr: Notif 2 received. Generating event.");
                    E := Basic_Event.Partial.Create(ID, A);
					Stats.Update (ID, A);
                end Generate;
            or
                accept Generate (ID: in Integer; R: in Integer; C: in Integer) do
                    Put_Line ("E_Mgr: Notif 3 received. Generating event.");
                    E := Basic_Event.Complete.Create(ID, R, C);
                end Generate;
            end select;
            Queue.Push (E);    -- push event to queue
        end loop;
    end E_Manager;
    
end Event_Manager;