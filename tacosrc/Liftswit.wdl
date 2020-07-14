/////////////////////////////////////////////////
//
/////////////////////////////////////////////////
//wall switch to open the door

SOUND	snd_LiftStart, 	<gotkey.wav>; //switch turn on sound

BMAP 	map_LiftStartS1_On,	<button1.pcx>;
BMAP  	map_LiftStartS1_Off,	<button2.pcx>;

TEXTURE tex_LiftStartS1_Off
{	SCALE_XY	21,25;
	BMAPS 		map_LiftStartS1_Off;	
	AMBIENT		.4;
}

TEXTURE tex_LiftStartS1_On
{	SCALE_XY	21,25;
	BMAPS 		map_LiftStartS1_On;
	AMBIENT		.4;
}

/////////////////////////////////////////////////
WALL wall_LiftStartS1
{	TEXTURE		tex_LiftStartS1_Off;
	DIST		4.0;	
	FLAGS 	  	SAVE;
	IF_NEAR		act_LiftStart;	
}
STRING  str_LiftStart," Lift started";

ACTION	act_LiftStart
{	SET		MY.TEXTURE,	tex_LiftStartS1_On;
	PLAY_SOUND	Snd_LiftStart, 	0.3;
	RULE		MY.DIST = MY.DIST * 1.5;
	SET 		THERE, 		reg_Lift_Column2;
	CALL		act_Lift_Column_Start;
	SET		text_TxtMsg.STRING, str_LiftStart;
	CALL		a_ResetText;
	WAIT 		100;
	SET		MY.TEXTURE,	tex_LiftStartS1_off;
	
	RULE	MY.DIST = MY.DIST / 1.5;
	
}
/////////////////////////////////////////////////
WALL wall_LiftStartS2
{	TEXTURE		tex_LiftStartS1_Off;
	DIST		4.0;	
	OFFSET_Y	16;
	OFFSET_X	1;
	FLAGS 	  	SAVE;
	IF_NEAR		act_LiftStart2;	
}

ACTION	act_LiftStart2
{	SET		MY.TEXTURE,	tex_LiftStartS1_On;
	PLAY_SOUND	Snd_LiftStart, 	0.3;
	RULE		MY.DIST = 	MY.DIST * 1.5;
	SET 		THERE, 		reg_Lift_Column;
	CALL		act_Lift_Column_Start;
	SET		text_TxtMsg.STRING, str_LiftStart;
	CALL		a_ResetText;
	WAIT 		100;
	SET		MY.TEXTURE,	tex_LiftStartS1_off;
	
	RULE	MY.DIST = MY.DIST / 1.5;
	
}