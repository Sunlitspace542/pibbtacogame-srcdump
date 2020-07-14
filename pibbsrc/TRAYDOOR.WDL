BMAP  TrayDoor_map,	<Metal1.pcx>;	//closed TrayDoor
BMAP  TrayDoor_open1,	<black.pcx>;	//opening TrayDoor

SOUND	TrayDoor_snd	<gotkey.wav>;

TEXTURE  TrayDoor_open_tex {
	SCALE_XY	16,16;
	CYCLES 	2;
	BMAPS	TrayDoor_map,TrayDoor_open1;
	DELAY	 1,1;
	FLAGS	ONESHOT;
	SOUND	TrayDoor_snd;
	SCYCLE	2;
	SVOL	0.3;
	SDIST	20;
}
TEXTURE  TrayDoor_close_tex {
	SCALE_XY	16,16;
	CYCLES 	2;
	BMAPS	TrayDoor_open1,TrayDoor_map;
	DELAY 	1,1;
	FLAGS	ONESHOT;
	SOUND	TrayDoor_snd;
	SCYCLE	1;
	SVOL	0.1;
	SDIST	20;
}
///////////////////////////////////
// ACTIONS
///////////////////////////////////

ACTION TrayDoor_open{
	SET MY.TEXTURE,TrayDoor_open_tex;
	BRANCH	texTrayDoor_open;
}
ACTION TrayDoor_close{
	SET MY.TEXTURE,TrayDoor_close_tex;
	BRANCH	texTrayDoor_close;
}
ACTION texTrayDoor_open {
	SET MY.DIST,6;
	SET MY.TRANSPARENT, 1;
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texTrayDoor_checkopen;
}
ACTION	texTrayDoor_checkopen {
	SET MY.PASSABLE,1;	//now the player may pass the TrayDoor
}
ACTION texTrayDoor_close {
	SET MY.DIST,4;
	SET MY.PASSABLE,0;	//close the TrayDoor again
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texTrayDoor_checkclose;
}
ACTION	texTrayDoor_checkclose {
	SET MY.TRANSPARENT, 0;
}

////////////////////////////////////////////////////////////////////
// The Key
////////////////////////////////////////////////////////////////////

SOUND	TrayDoorgotthekey, <gotkey.wav>;
BMAP	TrayDoorkey_map,      <cup1.pcx>;

SKILL   TrayDoorHavekey { VAL 0; }

TEXTURE  TrayDoorkey_tex {
        SCALE_XY        40,40;
        BMAPS           TrayDoorkey_map;
}
THING TrayDoorkey {
        TEXTURE TrayDoorkey_tex;
        DIST             4;
        IF_NEAR          TrayDoorTakethekey;
}
ACTION  TrayDoorTakethekey {
        PLAY_SOUND   TrayDoorGotthekey,0.6;
        SET        MY.INVISIBLE,1;      // can't see the key anymore
        SET        MY.PASSABLE,1;       // walk through the key now
        SET        TrayDoorHavekey,1;
}

/////////////////////////////////////////////////
//The Switch
/////////////////////////////////////////////////
//wall switch to open the door

SOUND	snd_TrayDoorLock_On, 	<gotkey.wav>; //switch turn on sound
SOUND	snd_TrayDoorLock_Off, 	<gotkey.wav>; //switch turn off sound

BMAP 	map_TrayDoorLock_On,	<switch.pcx>;
BMAP	map_TrayDoorLock_Off,	<switch01.pcx>;

TEXTURE tex_SwitchTrayDoor_Off
{	SCALE_XY	42.3,51.1;
	BMAPS 	map_TrayDoorLock_Off;	
	AMBIENT	.4;
}

TEXTURE tex_SwitchTrayDoor_On
{	SCALE_XY	42.3,51.1;
	BMAPS 	map_TrayDoorLock_On;
	AMBIENT	.4;
}

/////////////////////////////////////////////////
WALL wall_SwitchTrayDoor
{	TEXTURE	tex_SwitchTrayDoor_Off;
	DIST		4.0;	
	FLAGS 	SAVE;
	IF_NEAR	act_SwitchTrayDoor_Toggle;	
}
STRING  str_SwitchTrayDoorOn,"You unlocked the lunch tray door.";
STRING  str_SwitchTrayDoorOff,"You locked the lunch tray door.";

ACTION	act_SwitchTrayDoor_Toggle
{	IF_EQUAL	Locked_TrayDoor01.SKILL1, 0;
		GOTO	unlockdoor;
lockdoor:
	SET		text_TxtMsg.STRING, str_SwitchTrayDoorOff;
	CALL		a_ResetText;
	PLAY_SOUND	snd_TrayDoorLock_Off, 0.3;
	SET		MY.TEXTURE, 		tex_SwitchTrayDoor_Off;
	SET		Locked_Traydoor01.SKILL1,  	0;
	SET      	TrayDoorHavekey,0;
	END;
unlockdoor:
	SET		text_TxtMsg.STRING, str_SwitchTrayDoorOn;
	CALL		a_ResetText;
	PLAY_SOUND	snd_TrayDoorLock_On, 0.3;
	SET		MY.TEXTURE, 		tex_SwitchTrayDoor_On;
	SET		Locked_TrayDoor01.SKILL1, 	1;
	SET      	TrayDoorHavekey,1;
	END;
}

////////////////////////////////////////////////////////////////////
// The Locked TrayDoor
////////////////////////////////////////////////////////////////////

WALL  Locked_TrayDoor01{
	TEXTURE	TrayDoor_open_tex;
	FLAGS	SAVE;
	DIST	5;
	IF_NEAR	TrayDoorCheckforkey;
	IF_FAR	TrayDoor_close;
}

STRING str_TrayDoorLocked,"Hmmm, the tray door is locked.";
STRING str_TrayDoorUnlocked,"Cool, the tray door is open.";

ACTION  TrayDoorcheckforkey {
        IF_EQUAL    TrayDoorHavekey,0;
		GOTO TrayDoorIsLocked;

TrayDoorIsUnlocked:
	SET	text_TxtMsg.STRING, str_TrayDoorUnlocked;
	CALL	a_ResetText;
        BRANCH      TrayDoor_open;

TrayDoorIsLocked:
	SET	text_TxtMsg.STRING, str_TrayDoorLocked;
	CALL	a_ResetText;
        END;
}
