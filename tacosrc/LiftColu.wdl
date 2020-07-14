SOUND	snd_Column_Lift1, 	<alphabee.wav>; //must be a short sound
BMAP 	map_Column_LiftFloor,	<stone02.pcx>;
BMAP  	map_Column_LiftCeil,	<brick05.pcx>;

TEXTURE tex_Lift_Column_Floor
{	SCALE_XY	17.7,33;
	BMAPS 		map_Column_LiftFloor;
	AMBIENT		.3;
}

TEXTURE tex_Lift_Column_Ceil
{	SCALE_XY	17.7,33;
	BMAPS 		map_Column_LiftCeil;
	AMBIENT		.3;
}

REGION reg_Lift_Column
{
	FLOOR_HGT 	0;
	CEIL_HGT  	40;
	FLOOR_TEX 	tex_Lift_Column_Floor;
	CEIL_TEX  	tex_Lift_Column_Ceil;
	FLAGS 	  	SAVE;

	SKILL3	  	2.5;	//height of lower level of elevator in steps
	SKILL4		9;	//height upper level in steps
	SKILL6		0.2;	//Elevator Speed in steps per tick

	IF_ENTER	act_Lift_Column_Start;
}
REGION reg_Lift_Column2
{
	FLOOR_HGT 	0;
	CEIL_HGT  	40;
	FLOOR_TEX 	tex_Lift_Column_Floor;
	CEIL_TEX  	tex_Lift_Column_Ceil;
	FLAGS 	  	SAVE;

	SKILL3	  	1;	//height of lower level of elevator in steps
	SKILL4		17;	//height upper level in steps
	SKILL6		0.2;	//Elevator Speed in steps per tick

	IF_ENTER	act_Lift_Column_Start;
}

REGION reg_Lift_Maze
{
	FLOOR_HGT 	0;
	CEIL_HGT  	40;
	FLOOR_TEX 	tex_Lift_Column_Floor;
	CEIL_TEX  	tex_Lift_Column_Ceil;
	FLAGS 	  	SAVE;

	SKILL3	  	-10;	//height of lower level of elevator in steps
	SKILL4		3;	//height upper level in steps
	SKILL6		0.2;	//Elevator Speed in steps per tick

	IF_ENTER	act_Lift_Column_Start;
}


//*************************************************************************************
//*************************************************************************************
//*************************************************************************************
SKILL sk_Lift_Column_Speed{}

ACTION	act_Lift_Column_Start
{	SET		THERE.EACH_TICK,act_Lift_Column_DownTick;
	IF_BELOW	THERE.FLOOR_HGT,THERE.SKILL4; 		//up or down?
		SET	THERE.EACH_TICK,act_Lift_Column_UpTick;
}

ACTION	act_Lift_Column_UpTick
{	SET	sk_Lift_Column_Speed, THERE.SKILL6;
	RULE	sk_Lift_Column_Speed = TIME_CORR * sk_Lift_Column_Speed;
	ADD	THERE.FLOOR_HGT, sk_Lift_Column_Speed;
	IF_EQUAL	THERE.HERE,1;				//is player in elevator?
		RULE PLAYER_Z = PLAYER_Z + 0.5 * sk_Lift_Column_Speed;
	
	IF_EQUAL	THERE.VISIBLE,1;			//if elevator is visible
		SET	RENDER_MODE,1;				//must rerender constantly
	PLAY_SOUND	snd_Column_Lift1, 0.3;

	IF_BELOW	THERE.FLOOR_HGT,THERE.SKILL4; 		//at top yet?
		END;						//not at top yet

	SET	THERE.FLOOR_HGT,THERE.SKILL4;			//nominal value
	SET	THERE.EACH_TICK,NULL;
	
}

ACTION	act_Lift_Column_DownTick
{	SET	sk_Lift_Column_Speed,THERE.SKILL6;
	RULE	sk_Lift_Column_Speed = -TIME_CORR * sk_Lift_Column_Speed;
	ADD	THERE.FLOOR_HGT, sk_Lift_Column_Speed;
	IF_EQUAL	THERE.HERE,1;				//is player in elevator?
		RULE PLAYER_Z = PLAYER_Z + 0.8* sk_Lift_Column_Speed;
	
	IF_EQUAL	THERE.VISIBLE,1;			//if elevator is visible
		SET	RENDER_MODE,1;				//must rerender constantly
	PLAY_SOUND	snd_Column_Lift1, 0.3;

	IF_ABOVE	THERE.FLOOR_HGT,THERE.SKILL3; 		//at bottom yet?
		END;						//not at bottom yet

	SET	THERE.FLOOR_HGT,THERE.SKILL3;			//nominal value
	SET	THERE.EACH_TICK,NULL;
}

