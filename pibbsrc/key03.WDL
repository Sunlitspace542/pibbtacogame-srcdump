BMAP  Key03Door_map,	<FNKYDR.pcx>;	//closed Key03Door
BMAP  Key03Door_open1,	<FNKYDR2.pcx>;	//opening Key03Door

SOUND	Key03Door_snd	<gotkey.wav>;

TEXTURE  Key03Door_open_tex {
	SCALE_XY	16.2,18;
	CYCLES 	3;
	BMAPS		Key03Door_map,Key03Door_open1,black_map;
	DELAY	 	1,1,1;
	FLAGS		ONESHOT;
	SOUND		Key03Door_snd;
	SCYCLE	2;
	SVOL		0.3;
	SDIST		20;
}
TEXTURE  Key03Door_close_tex {
	SCALE_XY	16.2,18;
	CYCLES 	3;
	BMAPS		Black_map,Key03Door_open1,Key03Door_map;
	DELAY 	1,1,1;
	FLAGS		ONESHOT;
	SOUND		Key03Door_snd;
	SCYCLE	1;
	SVOL		0.1;
	SDIST		20;
}
///////////////////////////////////
// ACTIONS
///////////////////////////////////

ACTION Key03Door_open{
	SET MY.TEXTURE,Key03Door_open_tex;
	BRANCH	texKey03Door_open;
}
ACTION Key03Door_close{
	SET MY.TEXTURE,Key03Door_close_tex;
	BRANCH	texKey03Door_close;
}
ACTION texKey03Door_open {
	SET MY.DIST,10;
	SET MY.TRANSPARENT, 1;
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texKey03Door_checkopen;
}
ACTION	texKey03Door_checkopen {
	SET MY.PASSABLE,1;	//now the player may pass the Key03Door
}
ACTION texKey03Door_close {
	SET MY.DIST,5;
	SET MY.PASSABLE,0;	//close the Key03Door again
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texKey03Door_checkclose;
}
ACTION	texKey03Door_checkclose {
	SET MY.TRANSPARENT, 0;
}

////////////////////////////////////////////////////////////////////
// The Key
////////////////////////////////////////////////////////////////////

SOUND	Key03Doorgotthekey,	<gotkey.wav>;
BMAP	Key03Doorkey_map,	<key3.pcx>;

SKILL   Key03DoorHavekey { VAL 0; }

TEXTURE  Key03Doorkey_tex {
        SCALE_XY        40,40;
        BMAPS           Key03Doorkey_map;
}
THING Key03Doorkey {
        TEXTURE Key03Doorkey_tex;
        HEIGHT		1.5;
	DIST		4;
        IF_NEAR		Key03DoorTakethekey;
}
STRING str_Key03DoorTakeTheKey, "Come to me... Mr. Key.";
ACTION  Key03DoorTakethekey {
        PLAY_SOUND	Key03DoorGotthekey,0.6;
        SET	MY.INVISIBLE,1;      // can't see the key anymore
        SET	MY.PASSABLE,1;       // walk through the key now
        SET	Key03DoorHavekey,1;
	SET	text_TxtMsg.STRING, str_Key03DoorTakeTheKey;
	CALL	a_ResetText;
}
////////////////////////////////////////////////////////////////////
// The Locked Key03Door
////////////////////////////////////////////////////////////////////

WALL  Locked_Key03Door{
	TEXTURE	Key03Door_open_tex;
	FLAGS		SAVE;
	OFFSET_Y	93;
	DIST		5;
	IF_NEAR	Key03DoorCheckforkey;
	IF_FAR	Key03Door_close;
}

STRING str_Key03DoorLocked,"The door is locked. 
Oh well, what else is new?";
STRING str_Key03DoorUnlocked,"Open sesame.";

ACTION  Key03Doorcheckforkey {
        IF_EQUAL    Key03DoorHavekey,0;
		GOTO Key03DoorIsLocked;

Key03DoorIsUnlocked:
	SET	text_TxtMsg.STRING, str_Key03DoorUnlocked;
	CALL	a_ResetText;
        BRANCH      Key03Door_open;

Key03DoorIsLocked:
	SET	text_TxtMsg.STRING, str_Key03DoorLocked;
	CALL	a_ResetText;
        END;
}