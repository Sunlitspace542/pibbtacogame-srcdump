BMAP  Key01Door_map,	<Door01.pcx>;	//closed Key01Door
BMAP  Key01Door_open1,	<Door02.pcx>;	//opening Key01Door

SOUND	Key01Door_snd	<gotkey.wav>;

TEXTURE  Key01Door_open_tex {
	SCALE_XY	21,15.8;
	CYCLES 	2;
	BMAPS	Key01Door_map,Key01Door_open1;
	DELAY	 1,1;
	FLAGS	ONESHOT;
	SOUND	Key01Door_snd;
	SCYCLE	2;
	SVOL	0.3;
	SDIST	20;
}
TEXTURE  Key01Door_close_tex {
	SCALE_XY	21,15.8;
	CYCLES 	2;
	BMAPS	Key01Door_open1,Key01Door_map;
	DELAY 	1,1;
	FLAGS	ONESHOT;
	//SOUND	Key01Door_snd;
	SCYCLE	1;
	SVOL	0.1;
	SDIST	20;
}
///////////////////////////////////
// ACTIONS
///////////////////////////////////

ACTION Key01Door_open{
	SET MY.TEXTURE,Key01Door_open_tex;
	BRANCH	texKey01Door_open;
}
ACTION Key01Door_close{
	SET MY.TEXTURE,Key01Door_close_tex;
	BRANCH	texKey01Door_close;
}
ACTION texKey01Door_open {
	SET MY.DIST,10;
	SET MY.TRANSPARENT, 1;
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texKey01Door_checkopen;
}
ACTION	texKey01Door_checkopen {
	SET MY.PASSABLE,1;	//now the player may pass the Key01Door
}
ACTION texKey01Door_close {
	SET MY.DIST,5;
	SET MY.PASSABLE,0;	//close the Key01Door again
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texKey01Door_checkclose;
}
ACTION	texKey01Door_checkclose {
	SET MY.TRANSPARENT, 0;}

////////////////////////////////////////////////////////////////////
// The Key
////////////////////////////////////////////////////////////////////

SOUND	Key01Doorgotthekey,	<shiny1.wav>;
BMAP	Key01Doorkey_map,	<key1.pcx>;

SKILL   Key01DoorHavekey { VAL 0; }

TEXTURE  Key01Doorkey_tex {
        SCALE_XY        40,40;
        BMAPS           Key01Doorkey_map;
}
THING Key01Doorkey {
        TEXTURE		Key01Doorkey_tex;
        HEIGHT		1.5;
	DIST		4;
        IF_NEAR		Key01DoorTakethekey;
}

STRING str_Key01DoorTakeTheKey, "I can always use a BRONZE key.";

ACTION  Key01DoorTakethekey {
        PLAY_SOUND	Key01DoorGotthekey,	1;
        SET		MY.INVISIBLE,1;      	// can't see the key anymore
        SET		MY.PASSABLE,1;       	// walk through the key now
        SET		Key01DoorHavekey,1;
	SET		text_TxtMsg.STRING, str_Key01DoorTakeTheKey;
	CALL		a_ResetText;
}
////////////////////////////////////////////////////////////////////
// The Locked Key01Door
////////////////////////////////////////////////////////////////////

WALL  Locked_Key01Door{
	TEXTURE		Key01Door_open_tex;
	FLAGS		SAVE;
	DIST		5;
	IF_NEAR		Key01DoorCheckforkey;
	IF_FAR		Key01Door_close;
}
//ACTION  Key01Doorcheckforkey {
  //      IF_EQUAL    Key01DoorHavekey,0;
    //                END;
      //  BRANCH      Key01Door_open;
//}

STRING str_Key01DoorLocked,"The BRONZE key should work here.";
STRING str_Key01DoorUnlocked,"... and the door swings wide open.";

ACTION  Key01Doorcheckforkey {
        IF_EQUAL	Key01DoorHavekey,0;
			GOTO Key01DoorIsLocked;

Key01DoorIsUnlocked:
	SET		text_TxtMsg.STRING, str_Key01DoorUnlocked;
	CALL		a_ResetText;
        BRANCH		Key01Door_open;

Key01DoorIsLocked:
	SET		text_TxtMsg.STRING, str_Key01DoorLocked;
	CALL		a_ResetText;
        END;
}