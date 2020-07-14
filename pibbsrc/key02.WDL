BMAP  Key02Door_map,	<FNKYDR.pcx>;	//closed Key02Door
BMAP  Key02Door_open1,	<FNKYDR2.pcx>;	//opening Key02Door

SOUND	Key02Door_snd	<gotkey.wav>;

TEXTURE  Key02Door_open_tex {
	SCALE_XY	16.2,18;
	CYCLES 	3;
	BMAPS		Key02Door_map,Key02Door_open1,black_map;
	DELAY	 	1,1,1;
	FLAGS		ONESHOT;
	SOUND		Key02Door_snd;
	SCYCLE	2;
	SVOL		0.3;
	SDIST		20;
}
TEXTURE  Key02Door_close_tex {
	SCALE_XY	16.2,18;
	CYCLES 	3;
	BMAPS		Black_map,Key02Door_open1,Key02Door_map;
	DELAY 	1,1,1;
	FLAGS		ONESHOT;
	SOUND		Key02Door_snd;
	SCYCLE	1;
	SVOL		0.1;
	SDIST		20;
}
///////////////////////////////////
// ACTIONS
///////////////////////////////////

ACTION Key02Door_open{
	SET MY.TEXTURE,Key02Door_open_tex;
	BRANCH	texKey02Door_open;
}
ACTION Key02Door_close{
	SET MY.TEXTURE,Key02Door_close_tex;
	BRANCH	texKey02Door_close;
}
ACTION texKey02Door_open {
	SET MY.DIST,15;
	SET MY.TRANSPARENT, 1;
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texKey02Door_checkopen;
}
ACTION	texKey02Door_checkopen {
	SET MY.PASSABLE,1;	//now the player may pass the Key02Door
}
ACTION texKey02Door_close {
	SET MY.DIST,10;
	SET MY.PASSABLE,0;	//close the Key02Door again
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texKey02Door_checkclose;
}
ACTION	texKey02Door_checkclose {
	SET MY.TRANSPARENT, 0;
}

////////////////////////////////////////////////////////////////////
// The Key
////////////////////////////////////////////////////////////////////

SOUND	Key02Doorgotthekey,	<gotkey.wav>;
BMAP	Key02Doorkey_map,		<key2.pcx>;

SKILL   Key02DoorHavekey { VAL 0; }

TEXTURE  Key02Doorkey_tex {
        SCALE_XY        40,40;
        BMAPS           Key02Doorkey_map;
}
THING Key02Doorkey {
	TEXTURE Key02Doorkey_tex;
	DIST		4;
      HEIGHT	2;  
	IF_NEAR	Key02DoorTakethekey;
}
STRING str_Key02DoorTakeTheKey, "A shiny SILVER key.";
ACTION  Key02DoorTakethekey {
        PLAY_SOUND	Key02DoorGotthekey,0.6;
        SET        MY.INVISIBLE,1;      // can't see the key anymore
        SET        MY.PASSABLE,1;       // walk through the key now
        SET        Key02DoorHavekey,1;
	SET	text_TxtMsg.STRING, str_Key02DoorTakeTheKey;
	CALL	a_ResetText;

}
////////////////////////////////////////////////////////////////////
// The Locked Key02Door
////////////////////////////////////////////////////////////////////

WALL  Locked_Key02Door{
	TEXTURE	Key02Door_open_tex;
	FLAGS		SAVE;
	OFFSET_Y	93;
	DIST		10;
	IF_NEAR	Key02DoorCheckforkey;
	IF_FAR	Key02Door_close;
}

STRING str_Key02DoorLocked,"A SILVER key might help here.";
STRING str_Key02DoorUnlocked,"Thanks Mr. SILVER key.";

ACTION  Key02Doorcheckforkey {
        IF_EQUAL    Key02DoorHavekey,0;
		GOTO Key02DoorIsLocked;

Key02DoorIsUnlocked:
	SET	text_TxtMsg.STRING, str_Key02DoorUnlocked;
	CALL	a_ResetText;
        BRANCH      Key02Door_open;

Key02DoorIsLocked:
	SET	text_TxtMsg.STRING, str_Key02DoorLocked;
	CALL	a_ResetText;
        END;
}