------------------------------------------------------
--
-- classe principale del gioco lato server
--
--
--
------------------------------------------------------
with Field;		use Field;
with Ball;      		use Ball;
with Ball_Controller;   use Ball_Controller;
with Timer;      		use Timer;
with Timer_Controller;	use Timer_Controller;
with Player_Package;	use Player_Package;
with Manager_Package;	use Manager_Package;
with Referee_Package;	use Referee_Package;

package Game is
    
	-- dichiarazione di oggetto remoto
    -- pragma Remote_Types;
	-- pragma Shared_Passive;
	-- pragma Remote_Call_Interface;
        
	Fld : Field'Class;
	Bl : Ball_Access := new B;
	Tm : Timer_Access := new T;
	
	-- inizializzazione del moviment della palla
	T : Ball_Controller_Access := new Ball_Ctrl(Fld, Bl, 40);
		
	-- inizializzazione delle caratteristiche dei giocatori
	TP1 : PropsArray_Access := new PropsArray;
	TP2 : PropsArray_Access := new PropsArray;
		
	-- inizializzazione dell'array di giocatori
	Players : array (1..22) of Player_Access;
		
	-- inizializzazione delle squadre
	T1 : Team_Access := new Team;
	T2 : Team_Access := new Team;
			
	-- manager
	M1 : Manager_Access := new Manager(Fld, T1, TP1);
	M2 : Manager_Access := new Manager(Fld, T2, TP2);
	
	-- referee
	R : Referee_Access := new Referee (Fld, Bl);
	
	-- timer
	Tmr : Timer_Controller_Access;
    
    procedure Play;
    
    function GetField return Field_Access;
       
    function GetBall return Ball_Access;
       
    function GetTimer return Timer_Access;
       
    function GetTimer_Controller return Timer_Controller_Access;
       
end Game;
