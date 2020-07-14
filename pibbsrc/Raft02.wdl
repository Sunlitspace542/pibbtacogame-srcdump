SOUND	snd_Raft02, 	<alphabee.wav>; //must be a short sound
BMAP 	map_Raft02Floor,	<metal1.pcx>;
BMAP  	map_Raft02Ceil,	<brick05.pcx>;

TEXTURE tex_Raft02Floor
{	SCALE_XY	17.7,33;
	BMAPS 		map_Raft02Floor;
	AMBIENT		0.1;
}

TEXTURE tex_Raft02Ceil
{	SCALE_XY	17.7,33;
	BMAPS 		map_Raft02Ceil;
	AMBIENT		0.1;
}
SKILL	sk_Raft02_ON {VAL 0;}
REGION 	reg_Raft02{
	FLOOR_HGT	0;
	CEIL_HGT	40;
	FLOOR_TEX	black_tex;
	CEIL_TEX	tex_Raft02Ceil;
	FLAGS		SAVE,STICKY;

	SKILL5		-0.25;		//Raft02 down Speed in steps per tick
	SKILL6		0.25;		//Raft02 up Speed in steps per tick
	SKILL7		190;		//number of ticks to move
	SKILL8		0;		//Raft02 tick counter

	//IF_ENTER	act_RaftCrouch;
	//IF_LEAVE	act_Stand;	

	//IF_ENTER	act_Raft02_Start;
	EACH_TICK	act_Raft02_Start;
}

//*************************************************************************************
//*************************************************************************************
//*************************************************************************************

ACTION	act_Raft02_Start
{	SET		THERE.EACH_TICK,act_Raft02_DownTick;
	IF_BELOW	THERE.SKILL8,1; 			//up or down?
		SET	THERE.EACH_TICK,act_Raft02_UpTick;
}

ACTION	act_Raft02_UpTick
{	IF_EQUAL sk_Raft02_ON,0; END;//Mike KEY for this Raft02
	IF_NEQUAL THERE.SEEN, 1; END;
	SET THERE.SEEN, 0;
	IF_EQUAL	THERE.VISIBLE,1;			//if elevator is visible
		SET	RENDER_MODE,1;				//must rerender constantly
	//PLAY_SOUND	snd_Raft02, 0.3;

	ADD		THERE.SKILL8, 1;			//increment counter
	SHIFT		THERE, 0, THERE.SKILL6;			//move region
	ADD		THERE.CEIL_OFFS_Y,THERE.SKILL6;		//move texture
	ADD		THERE.FLOOR_OFFS_Y,THERE.SKILL6;	//move texture
	
	IF_BELOW	THERE.SKILL8,THERE.SKILL7;		//at top yet?
		END;						//not at top yet
	
	SET	THERE.EACH_TICK,act_Raft02_DownTick;
	
}

ACTION	act_Raft02_DownTick
{	IF_EQUAL sk_Raft02_ON,0; END;//Mike KEY for this Raft02
	IF_NEQUAL THERE.SEEN, 1; END;
	SET THERE.SEEN, 0;
	IF_EQUAL	THERE.VISIBLE,1;			//if elevator is visible
		SET	RENDER_MODE,1;				//must rerender constantly
	//PLAY_SOUND	snd_Raft02, 0.3;

	ADD		THERE.SKILL8, -1;			//decrement counter	
	SHIFT		THERE, 0, THERE.SKILL5;			//move region
	ADD		THERE.CEIL_OFFS_Y,THERE.SKILL5;		//move texture
	ADD		THERE.FLOOR_OFFS_Y,THERE.SKILL5;	//move texture
	IF_ABOVE	THERE.SKILL8,0; 			//at bottom yet?
		END;							
	SET	THERE.EACH_TICK,act_Raft02_UpTick;
}


/////////////////////////////////////////////////
//
/////////////////////////////////////////////////
//wall switch to open the door

SOUND	snd_Raft02Lock_On, 	<gotkey.wav>; //switch turn on sound
SOUND	snd_Raft02Lock_Off, 	<gotkey.wav>; //switch turn off sound

BMAP 	map_Raft02Lock_On,	<switch.pcx>;
BMAP  	map_Raft02Lock_Off,	<switch01.pcx>;

TEXTURE tex_SwitchRaft02_Off
{	SCALE_XY	42.3,51.1;
	BMAPS 		map_Raft02Lock_Off;	
	AMBIENT		.4;
}

TEXTURE tex_SwitchRaft02_On
{	SCALE_XY	42.3,51.1;
	BMAPS 		map_Raft02Lock_On;
	AMBIENT		.4;
}

/////////////////////////////////////////////////
WALL wall_SwitchRaft02
{	TEXTURE		tex_SwitchRaft02_Off;
	DIST		4.0;	
	OFFSET_Y	51;
	FLAGS 	  	SAVE;
	IF_NEAR		act_SwitchRaft02_Toggle;	
}
STRING  str_SwitchRaft02On," The first raft is on.";
STRING  str_SwitchRaft02Off," The first is off.";

ACTION	act_SwitchRaft02_Toggle
{	SET		MY.IF_NEAR,	NULL;
	SET		MY.IF_FAR,	act_ResetRaft02Toggle;
	RULE		MY.DIST = MY.DIST*1.5;
	IF_EQUAL	sk_Raft02_ON, 0; 		//Mike KEY for this Raft02
		GOTO	unlockdoor;
lockdoor:
	SET		text_TxtMsg.STRING, str_SwitchRaft02Off;
	CALL		a_ResetText;
	PLAY_SOUND	snd_Raft02Lock_Off, 0.3;
	SET		MY.TEXTURE, 		tex_SwitchRaft02_Off;
	SET		sk_Raft02_ON,0;		//Mike KEY for this Raft02
	END;
unlockdoor:
	SET		text_TxtMsg.STRING, str_SwitchRaft02On;
	CALL		a_ResetText;
	PLAY_SOUND	snd_Raft02Lock_On, 0.3;
	SET		MY.TEXTURE, 		tex_SwitchRaft02_On;
	SET		sk_Raft02_ON,1;		//Mike KEY for this Raft02
	END;
}
ACTION	act_ResetRaft02Toggle
{	SET		MY.IF_NEAR,	act_SwitchRaft02_Toggle;
	RULE		MY.DIST = MY.DIST/1.5;
}

