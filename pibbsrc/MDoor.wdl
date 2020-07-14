BMAP  mdoor_map,	<fnkydr.pcx>;	//closed door
BMAP  mdoor_open1,	<fnkydr2.pcx>;	
//BMAP  black_map,	<black.pcx>;	//opening door

SOUND	mdoor_snd	<gotkey.wav>;

SKILL   havekey2 { VAL 0; }

TEXTURE mdoor_open_tex {
	SCALE_XY	16,18;
	CYCLES 	3;
	BMAPS	mdoor_map,mdoor_open1,black_map;
	DELAY	 1,1,1;
	FLAGS	ONESHOT;
	SOUND	mdoor_snd;
	SCYCLE	2;
	SVOL	0.3;
	SDIST	20;
}
TEXTURE mdoor_close_tex {
	SCALE_XY	16,18;
	CYCLES 	3;
	BMAPS	black_map,mdoor_open1,mdoor_map;
	DELAY 	1,1,1;
	FLAGS	ONESHOT;
	//SOUND	mdoor_snd;
	SCYCLE	1;
	SVOL	0.1;
	SDIST	20;
}
///////////////////////////////////
// ACTIONS
///////////////////////////////////

ACTION mdoor_open{
	SET MY.TEXTURE,mdoor_open_tex;
	BRANCH	texdoor_open;
}
ACTION mdoor_close{
	SET MY.TEXTURE,mdoor_close_tex;
	BRANCH	texdoor_close;
}


////////////////////////////////////////////////////////////////////
// The Locked Door
////////////////////////////////////////////////////////////////////

WALL  Locked_door02{
	TEXTURE	mdoor_open_tex;
	FLAGS		SAVE;
	DIST		10;
	OFFSET_Y	63;
	IF_NEAR	checkforkey2;
	IF_FAR	mdoor_close;
}

STRING str_MetalDoorLocked,"Hmmm, a huge magnetic door.";
STRING str_MetalDoorUnlocked,"Door opened easy with the power off.";

ACTION  checkforkey2 {
        IF_EQUAL    Havekey2,0;
		GOTO MetalDoorIsLocked;

MetalDoorIsUnlocked:
	SET	text_TxtMsg.STRING, str_MetalDoorUnlocked;
	CALL	a_ResetText;
        BRANCH      mDoor_open;

MetalDoorIsLocked:
	SET	text_TxtMsg.STRING, str_MetalDoorLocked;
	CALL	a_ResetText;
        END;
}

////////////////////////////////////////////////
//Switch
/////////////////////////////////////////////////

SOUND	snd_DoorLockS2_On, 	<gotkey.wav>; //switch turn on sound
SOUND	snd_DoorLockS2_Off, 	<gotkey.wav>; //switch turn off sound

BMAP 	map_DoorLockS2_On,	<switch01.pcx>;
BMAP  	map_DoorLockS2_Off,	<switch.pcx>;

TEXTURE tex_SwitchDoorS2_Off
{	SCALE_XY	42.3,51.1;
	BMAPS 		map_DoorLockS2_Off;	
	AMBIENT		.4;
}

TEXTURE tex_SwitchDoorS2_On2
{	SCALE_XY	42.3,51.1;
	BMAPS 		map_DoorLockS2_On;
	AMBIENT		.3;
}


////////////////////////////////////////////////////////////////////
// The Key
////////////////////////////////////////////////////////////////////

SOUND	mdoor_gotthekey,	<gotkey.wav>;
BMAP	mdoor_key_map,		<cup1.pcx>;

TEXTURE  mdoor_key_tex {
        SCALE_XY        40,40;
        BMAPS           mdoor_key_map;
}
THING mdoor_key {
        TEXTURE mdoor_key_tex;
        DIST             2;
        IF_NEAR          mdoor_takethekey;
}
ACTION  mdoor_takethekey {
        PLAY_SOUND mdoor_gotthekey,0.6;
        SET        MY.INVISIBLE,1;      // can't see the key anymore
        SET        MY.PASSABLE,1;       // walk through the key now
        SET        havekey2,1;
}

/////////////////////////////////////////////////
// Metal Door
/////////////////////////////////////////////////
WALL wall_SwitchDoorS2
{	TEXTURE		tex_SwitchDoorS2_Off;
	DIST		4.0;	
	FLAGS 	  	SAVE;
	IF_NEAR		act_SwitchDoorS2_Toggle;	
}
STRING  str_SwitchDoorS2On,"The magnetic power grid is down.";
STRING  str_SwitchDoorS2Off,"The magnetic power grid is up.";

ACTION	act_SwitchDoorS2_Toggle
{	IF_EQUAL	Locked_door02.SKILL1, 0;
		GOTO	unlockdoor;
lockdoor:
	SET		text_TxtMsg.STRING, str_SwitchDoorS2Off;
	CALL		a_ResetText;
	PLAY_SOUND	snd_DoorLockS2_Off, 0.3;
	SET		MY.TEXTURE, 		tex_SwitchDoorS2_Off;
	SET		Locked_door02.SKILL1,  	0;
	SET      	havekey2,0;
	END;
unlockdoor:
	SET		text_TxtMsg.STRING, str_SwitchDoorS2On;
	CALL		a_ResetText;
	PLAY_SOUND	snd_DoorLockS2_On, 0.3;
	SET		MY.TEXTURE, 		tex_SwitchDoorS2_On2;
	SET		Locked_door02.SKILL1, 	1;
	SET      	havekey2,1;
	END;
}
