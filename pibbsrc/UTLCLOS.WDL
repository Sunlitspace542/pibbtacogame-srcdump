BMAP  UtilClosDoor_map,		<Door01.pcx>;	//closed UtilClosDoor
BMAP  UtilClosDoor_open1,	<Door02.pcx>;	//opening UtilClosDoor

SOUND	UtilClosDoor_snd	<gotkey.wav>;

TEXTURE  UtilClosDoor_open_tex {
	SCALE_XY	21,15.8;
	CYCLES 	2;
	BMAPS	UtilClosDoor_map,UtilClosDoor_open1;
	DELAY	 1,1;
	FLAGS	ONESHOT;
	SOUND	UtilClosDoor_snd;
	SCYCLE	2;
	SVOL	0.3;
	SDIST	20;
}
TEXTURE  UtilClosDoor_close_tex {
	SCALE_XY	21,15.8;
	CYCLES 	2;
	BMAPS	UtilClosDoor_open1,UtilClosDoor_map;
	DELAY 	1,1;
	FLAGS	ONESHOT;
	//SOUND	UtilClosDoor_snd;
	SCYCLE	1;
	SVOL	0.1;
	SDIST	20;
}
///////////////////////////////////
// ACTIONS
///////////////////////////////////

ACTION UtilClosDoor_open{
	SET MY.TEXTURE,UtilClosDoor_open_tex;
	BRANCH	texUtilClosDoor_open;
}
ACTION UtilClosDoor_close{
	SET MY.TEXTURE,UtilClosDoor_close_tex;
	BRANCH	texUtilClosDoor_close;
}
ACTION texUtilClosDoor_open {
	SET MY.DIST,6;
	SET MY.TRANSPARENT, 1;
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texUtilClosDoor_checkopen;
}
ACTION	texUtilClosDoor_checkopen {
	SET MY.PASSABLE,1;	//now the player may pass the UtilClosDoor
}
ACTION texUtilClosDoor_close {
	SET MY.DIST,3;
	SET MY.PASSABLE,0;	//close the UtilClosDoor again
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texUtilClosDoor_checkclose;
}
ACTION	texUtilClosDoor_checkclose {
	SET MY.TRANSPARENT, 0;
}


////////////////////////////////////////////////////////////////////
// The Key
////////////////////////////////////////////////////////////////////

SOUND	UtilClosDoorgotthekey,	<gotkey.wav>;
BMAP	UtilClosDoorkey_map,	<cup1.pcx>;

SKILL   UtilClosDoorHavekey { VAL 0; }

TEXTURE  UtilClosDoorkey_tex {
        SCALE_XY        40,40;
        BMAPS           UtilClosDoorkey_map;
}
THING UtilClosDoorkey {
        TEXTURE UtilClosDoorkey_tex;
        DIST             4;
        IF_NEAR          UtilClosDoorTakethekey;
}
ACTION  UtilClosDoorTakethekey {
        PLAY_SOUND   UtilClosDoorGotthekey,0.6;
        SET        MY.INVISIBLE,1;      // can't see the key anymore
        SET        MY.PASSABLE,1;       // walk through the key now
        SET        UtilClosDoorHavekey,1;
}

/////////////////////////////////////////////////
//The Switch
/////////////////////////////////////////////////
SOUND	snd_UtilClosDoorLock_On, 	<gotkey.wav>; //switch turn on sound
SOUND	snd_UtilClosDoorLock_Off, 	<gotkey.wav>; //switch turn off sound

BMAP 	map_UtilClosDoorLock_On,	<switch.pcx>;
BMAP  map_UtilClosDoorLock_Off,	<switch01.pcx>;

TEXTURE tex_SwitchUtilClosDoor_Off
{	SCALE_XY	42.3,51.1;
	BMAPS 	map_UtilClosDoorLock_Off;	
	AMBIENT	.4;
}
TEXTURE tex_SwitchUtilClosDoor_On
{	SCALE_XY	42.3,51.1;
	BMAPS 	map_UtilClosDoorLock_On;
	AMBIENT	.4;
}
/////////////////////////////////////////////////
WALL wall_SwitchUtilClosDoor
{	TEXTURE	tex_SwitchUtilClosDoor_Off;
	DIST		4.0;	
	FLAGS 	SAVE;
	IF_NEAR	act_SwitchUtilClosDoor_Toggle;	
}
STRING  str_SwitchUtilClosDoorOn," You opend the utility closet door.";
STRING  str_SwitchUtilClosDoorOff," The utility closet door is locked";

ACTION	act_SwitchUtilClosDoor_Toggle
{	IF_EQUAL	Locked_UtilClosDoor01.SKILL1, 0;
		GOTO	unlockdoor;
lockdoor:
	SET		text_TxtMsg.STRING,	str_SwitchUtilClosDoorOff;
	CALL		a_ResetText;
	PLAY_SOUND	snd_UtilClosDoorLock_Off, 0.3;
	SET		MY.TEXTURE,			tex_SwitchUtilClosDoor_Off;
	SET		Locked_UtilClosdoor01.SKILL1,  	0;
	SET      	UtilClosDoorHavekey,0;
	END;
unlockdoor:
	SET		text_TxtMsg.STRING, str_SwitchUtilClosDoorOn;
	CALL		a_ResetText;
	PLAY_SOUND	snd_UtilClosDoorLock_On, 0.3;
	SET		MY.TEXTURE, 		tex_SwitchUtilClosDoor_On;
	SET		Locked_UtilClosDoor01.SKILL1, 	1;
	SET      	UtilClosDoorHavekey,1;
	END;
}
////////////////////////////////////////////////////////////////////
// The Locked UtilClosDoor
////////////////////////////////////////////////////////////////////

WALL  Locked_UtilClosDoor01{
	TEXTURE	UtilClosDoor_open_tex;
	FLAGS		SAVE;
	DIST		15;
	IF_NEAR	UtilClosDoorCheckforkey;
	IF_FAR	UtilClosDoor_close;
}
ACTION  UtilClosDoorcheckforkey {
        IF_EQUAL    UtilClosDoorHavekey,0;
                    END;
        BRANCH      UtilClosDoor_open;
}