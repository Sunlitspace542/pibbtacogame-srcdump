////////////////////////////////////////////////////////
// The Evil Region
////////////////////////////////////////////////////////

BMAP	EvilCEILING01_MAP,	<ceiling.pcx>;
BMAP	Evilfloor01_MAP,	<floor.pcx>;

TEXTURE Evilceiling01_tex 
{	SCALE_XY	16,16;
	BMAPS 		Evilceiling01_map;
}
TEXTURE Evilfloor01_tex 
{	SCALE_XY	16,16;
	BMAPS 		Evilfloor01_map;
}
REGION reg_Evil_lyer
{	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	Evilfloor01_tex;
	CEIL_TEX	Evilceiling01_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	AMBIENT		.3;
}
////////////////////////////////////////////////////////////////////
// The Evil Door trap
////////////////////////////////////////////////////////////////////
BMAP  Edoor01_map,	<bars01.pcx>;	//closed door
BMAP  Edoor02_map,	<bars04.pcx>;	//closed door

SOUND	Edoor_snd	<gotkey.wav>;

TEXTURE  Edoor_open_tex 
{	SCALE_XY	21,15.8;
	CYCLES 	2;
	BMAPS	Edoor01_map,Edoor02_map;
	DELAY	2,2;
	FLAGS	ONESHOT;
	SOUND	Edoor_snd;
	SCYCLE	2;
	SVOL	0.3;
	SDIST	20;
}
TEXTURE  Edoor_close_tex 
{	SCALE_XY	21,15.8;
	CYCLES 	2;
	BMAPS	Edoor02_map,Edoor01_map;
	DELAY 	2,2;
	FLAGS	ONESHOT;
	SOUND	Edoor_snd;
	SCYCLE	1;
	SVOL	0.1;
	SDIST	20;
}

ACTION act_Edoor_open 
{	SET MY.TEXTURE,		Edoor_open_tex;
	SET MY.DIST,		6;
	SET MY.TRANSPARENT, 	1;
	SET MY.PLAY, 		1;
	SET MY.EACH_TICK,	NULL;
	SET MY.EACH_CYCLE,	act_Edoor_checkopen;
}
ACTION	act_Edoor_checkopen 
{	SET MY.PASSABLE,	1;	//now the player may pass the door
}
STRING	str_WontheGame, "You won the Game";
STRING	str_Didnthelp, "that didnt really help";

ACTION  act_Edoor_close 
{	SET MY.TEXTURE,		Edoor_close_tex;
	SET MY.DIST,		4;
	SET MY.PASSABLE,	0;	//close the door again
	SET MY.PLAY, 		1;
	SET MY.EACH_TICK,	NULL;
	SET MY.TRANSPARENT, 	1;
	SET MY.EACH_CYCLE,	NULL;	
	
//check for winning conditions
	IF_BELOW	actor_DoctorEvil01.X,	-400;
		GOTO win;
notwonyet:	
	SET	text_TxtMsg.STRING, 	str_Didnthelp;
	CALL	a_ResetText;
	
	END;
win:
	//open the kid doors here
	SET	sk_EKiddooropened,	1;
	SET	text_TxtMsg.STRING, 	NULL;
	# CALL	a_ResetText;

	PLAY_SOUND	snd_awesome,1;
	SET	wall_EvilSwitchDoorS1.IF_NEAR, NULL;
	SET	wall_EvilSwitchDoorS1.IF_FAR, NULL;
	SET	IF_0,			NULL;
	SET	IF_1,			NULL;
	SET	IF_2,			NULL;
	SET	IF_3,			NULL;
	SET	IF_4,			NULL;
	SET	IF_5,			NULL;
	SET	IF_CTRL,		NULL;
	SET	IF_LEFT,		NULL;
	SET	PANELS.16,		panel_Score;
	RULE	sk_score = 100 * ( ((sk_ZombieKills/65)*0.5) + ((sk_PowerupCnt/33)*0.5) - ((sk_FriendKills/65)*0.5) );
	//MIKE  in the above line change each of the 100s to the number of zombies, powerups and friendlies
	// the 0.5s are weights  and the first two must total to 1... friend weight can be whatever
	//WHAT EVER YOU CHANGE HERE MUST MATCH WITH MOVE.WDL	
	END;
}

WALL  Locked_Edoor01
{	TEXTURE		Edoor_open_tex;
	FLAGS		TRANSPARENT,SAVE;	
}


/////////////////////////////////////////////////
//
/////////////////////////////////////////////////
//wall switch to open the door

SOUND	snd_EvilDoorLockS1_On, 	<gotkey.wav>; //switch turn on sound
SOUND	snd_EvilDoorLockS1_Off, <gotkey.wav>; //switch turn off sound

BMAP 	map_EvilDoorLockS1_On,	<switch.pcx>;
BMAP  	map_EvilDoorLockS1_Off,	<switch01.pcx>;

TEXTURE tex_EvilSwitchDoorS1_Off
{	SCALE_XY	42.3,51.1;
	BMAPS 		map_EvilDoorLockS1_Off;	
	AMBIENT		.4;
}

TEXTURE tex_EvilSwitchDoorS1_On2
{	SCALE_XY	42.3,51.1;
	BMAPS 		map_EvilDoorLockS1_On;
	AMBIENT		.4;
}

/////////////////////////////////////////////////
WALL wall_EvilSwitchDoorS1
{	TEXTURE		tex_EvilSwitchDoorS1_Off;
	DIST		5.0;	
	FLAGS 	  	SAVE;
	IF_NEAR		act_EvilSwitchDoorS1_Toggle;	
}
STRING  str_EvilSwitchDoorS1On," Door is opened";
STRING  str_EvilSwitchDoorS1Off," Door is locked";

ACTION	act_EvilSwitchDoorS1_Toggle
{	RULE		MY.DIST  		= MY.DIST*1.5;
	SET		MY.IF_NEAR,		NULL;
	SET		MY.IF_FAR,		act_resetEvilSwitch;
	IF_EQUAL	MY.SKILL1, 		0;
		GOTO	opendoor;
closedoor:
	SET		text_TxtMsg.STRING, 	str_EvilSwitchDoorS1Off;
	CALL		a_ResetText;
	PLAY_SOUND	snd_EvilDoorLockS1_Off, 	0.3;
	SET		MY.TEXTURE, 		tex_EvilSwitchDoorS1_Off;
	SET		MY.SKILL1,  		0;
	SET		Locked_Edoor01.EACH_TICK,	act_Edoor_close;
	END;
opendoor:
	SET		text_TxtMsg.STRING, 	str_EvilSwitchDoorS1On;
	CALL		a_ResetText;
	PLAY_SOUND	snd_EvilDoorLockS1_On, 	0.3;
	SET		MY.TEXTURE, 		tex_EvilSwitchDoorS1_On2;
	SET		MY.SKILL1, 		1;
	SET		Locked_Edoor01.EACH_TICK,	act_Edoor_open;
	END;
}


ACTION act_resetEvilSwitch
{	SET		MY.IF_FAR,		NULL;
	RULE		MY.DIST  		= MY.DIST/1.5;
	SET		MY.IF_NEAR,		act_EvilSwitchDoorS1_Toggle;
}
