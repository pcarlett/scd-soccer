--------------------------------------------------------------------------------
-- Event Generator: Process that simulates soccer match and generates 
--                  notifications to Event Manager
--------------------------------------------------------------------------------
with Event_Manager;
package Event_Generator is

    task type E_Generator is
        entry Start(Ptr: in Event_Manager.E_Manager_Acc);
    end E_Generator;

	type E_Generator_Acc is access all E_Generator;

end Event_Generator;