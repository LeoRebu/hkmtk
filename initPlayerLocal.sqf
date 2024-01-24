_fuckWithChats = {
    systemChat "Doing removeChannel Check";
    if ( hasInterface ) then {
        waitUntil { alive player };
        private _type = typeof player;
        if( _type == "B_officer_F" || _type == "O_officer_F" || _type == "B_Soldier_TL_F" || _type == "B_Soldier_SL_F" || _type == "O_Soldier_TL_F" || _type == "O_Soldier_SL_F"  ) then {
            //nothing
            systemChat "Not removing channels from leader";            
            0 enableChannel false; //global
            1 enableChannel true; //side
            2 enableChannel false; //command
            3 enableChannel false; //group
            5 enableChannel false; //direct        
        } else {
            systemChat "Removing Channels";
            //everybody else
            0 enableChannel false; //global
            1 enableChannel false; //side
            2 enableChannel false; //command
            3 enableChannel false; //group
            5 enableChannel false; //direct            
            //leave vehicle alone so they have something
        };
    };
};

call _fuckWithChats;