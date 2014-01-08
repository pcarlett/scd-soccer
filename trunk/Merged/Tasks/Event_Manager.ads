--------------------------------------------------------------------------------
-- Event Manager: Process that receive notifications, generate events and push
--                them to Event Queuer
--------------------------------------------------------------------------------
with Common_Types;	use Common_Types;
with Queue;
package Event_Manager is

    task type E_Manager is
        entry Start;
        entry Generate (A: in Actions);
        entry Generate (ID: in Integer; A: in Actions);
        entry Generate (ID: in Integer; R: in Integer; C: in Integer);
    end E_Manager;

	type E_Manager_Acc is access all E_Manager;
	
end Event_Manager;