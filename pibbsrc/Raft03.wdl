SOUND	snd_Raft03, 	<alphabee.wav>; //must be a short sound
BMAP 	map_Raft03Floor,	<metal1.pcx>;
BMAP  map_Raft03Ceil,	<brick05.pcx>;

TEXTURE tex_Raft03Floor
{	SCALE_XY	17.7,33;
	BMAPS 	map_Raft03Floor;
	AMBIENT	0.1;
}

TEXTURE tex_Raft03Ceil
{	SCALE_XY	17.7,33;
	BMAPS 	map_Raft03Ceil;
	AMBIENT	0.1;
}
SKILL	sk_Raft03_ON {VAL 0;}
REGION reg_Raft03{
	FLOOR_HGT	0;
	CEIL_HGT	40;
	FLOOR_TEX	black_tex;
	CEIL_TEX	tex_Raft03Ceil;
	FLAGS		SAVE,STICKY;

	SKILL5	0.15;			//Raft03 down Speed in steps per tick
	SKILL6	-0.15;			//Raft03 up Speed in steps per tick
	SKILL7	285;			//number of ticks to move
	SKILL8	0;			//Raft03 tick counter

	//IF_ENTER	act_RaftCrouch;
	//IF_LEAVE	act_Stand;	

	//IF_ENTER	act_Raft03_Start;
	EACH_TICK	act_Raft03_Start;
}

//*************************************************************************************
//*************************************************************************************
//*************************************************************************************

ACTION	act_Raft03_Start
{	SET		THERE.EACH_TICK,act_Raft03_DownTick;
	IF_BELOW	THERE.SKILL8,1; 				//up or down?
		SET	THERE.EACH_TICK,act_Raft03_UpTick;
}

ACTION	act_Raft03_UpTick
{	IF_EQUAL sk_Raft03_ON,0; END;//Mike KEY for this Raft03
	IF_NEQUAL THERE.SEEN, 1; END;
	SET THERE.SEEN, 0;

	IF_EQUAL	THERE.VISIBLE,1;			//if elevator is visible
		SET	RENDER_MODE,1;			//must rerender constantly
	//PLAY_SOUND	snd_Raft03, 0.3;

	ADD		THERE.SKILL8, 1;			//increment counter
	SHIFT		THERE, 0, THERE.SKILL6;		//move region
	ADD		THERE.CEIL_OFFS_Y,THERE.SKILL6;		//move texture
	ADD		THERE.FLOOR_OFFS_Y,THERE.SKILL6;	//move texture

	IF_BELOW	THERE.SKILL8,THERE.SKILL7;	//at top yet?
		END;						//not at top yet
	
	SET	THERE.EACH_TICK,act_Raft03_DownTick;
}

ACTION	act_Raft03_DownTick
{	IF_EQUAL sk_Raft03_ON,0; END;//Mike KEY for this Raft03
	IF_NEQUAL THERE.SEEN, 1; END;
	SET THERE.SEEN, 0;

	IF_EQUAL	THERE.VISIBLE,1;			//if elevator is visible
		SET	RENDER_MODE,1;			//must rerender constantly
	//PLAY_SOUND	snd_Raft03, 0.3;

	ADD		THERE.SKILL8, -1;			//decrement counter
	SHIFT		THERE, 0, THERE.SKILL5;		//move region
	ADD		THERE.CEIL_OFFS_Y,THERE.SKILL5;		//move texture
	ADD		THERE.FLOOR_OFFS_Y,THERE.SKILL5;	//move texture

	IF_ABOVE	THERE.SKILL8,0; 			//at bottom yet?
		END;							
	SET	THERE.EACH_TICK,act_Raft03_UpTick;
}
/////////////////////////////////////////////////
//
/////////////////////////////////////////////////
//wall switch to open the door

SOUND	snd_Raft03Lock_On, 	<gotkey.wav>; //switch turn on sound
SOUND	snd_Raft03Lock_Off, 	<gotkey.wav>; //switch turn off sound

BMAP 	map_Raft03Lock_On,	<switch.pcx>;
BMAP  	map_Raft03Lock_Off,	<switch01.pcx>;

TEXTURE tex_SwitchRaft03_Off
{	SCALE_XY	42.3,51.1;
	BMAPS 		map_Raft03Lock_Off;	
	AMBIENT		.4;
}
TEXTURE tex_SwitchRaft03_On
{	SCALE_XY	42.3,51.1;
	BMAPS 		map_Raft03Lock_On;
	AMBIENT		.4;
}
/////////////////////////////////////////////////
WALL wall_SwitchRaft03
{	TEXTURE		tex_SwitchRaft03_Off;
	DIST		4.0;	
	OFFSET_Y	51;
	FLAGS 	  	SAVE;
	IF_NEAR		act_SwitchRaft03_Toggle;	
}
STRING  str_SwitchRaft03On," The second raft is on.";
STRING  str_SwitchRaft03Off," The second is off.";

ACTION	act_SwitchRaft03_Toggle
{	SET		MY.IF_NEAR,	NULL;
	SET		MY.IF_FAR,	act_ResetRaft03Toggle;
	RULE		MY.DIST = MY.DIST*1.5;
	IF_EQUAL	sk_Raft03_ON, 0; 		//Mike KEY for this Raft03
		GOTO	unlockdoor;
lockdoor:
	SET		text_TxtMsg.STRING, str_SwitchRaft03Off;
	CALL		a_ResetText;
	PLAY_SOUND	snd_Raft03Lock_Off, 0.3;
	SET		MY.TEXTURE, 		tex_SwitchRaft03_Off;
	SET		sk_Raft03_ON,0;		//Mike KEY for this Raft03
	END;
unlockdoor:
	SET		text_TxtMsg.STRING, str_SwitchRaft03On;
	CALL		a_ResetText;
	PLAY_SOUND	snd_Raft03Lock_On, 0.3;
	SET		MY.TEXTURE, 		tex_SwitchRaft03_On;
	SET		sk_Raft03_ON,1;		//Mike KEY for this Raft03
	END;
}
ACTION	act_ResetRaft03Toggle
{	SET		MY.IF_NEAR,	act_SwitchRaft03_Toggle;
	RULE		MY.DIST = MY.DIST/1.5;
}

