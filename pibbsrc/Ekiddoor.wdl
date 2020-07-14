BMAP  EKiddoor_map01,	<Bars01.pcx>;	//closed door
BMAP  EKiddoor_map02,	<Bars04.pcx>;	//opening door

SOUND	EKiddoor_snd	<gotkey.wav>;

TEXTURE  EKiddoor_open_tex 
{	SCALE_XY	21,15.8;
	CYCLES 	2;
	BMAPS	EKiddoor_map01,EKiddoor_map02;
	DELAY	 2,2;
	FLAGS	ONESHOT;
	SOUND	EKiddoor_snd;
	SCYCLE	2;
	SVOL	0.3;
	SDIST	20;
}
TEXTURE	EKiddoor_close_tex
{	SCALE_XY	21,15.8;
	BMAPS	EKiddoor_map01;
}

ACTION act_EKiddoor_open 
{	SET MY.TEXTURE,		EKiddoor_open_tex;
	SET MY.DIST,		6;
	SET MY.TRANSPARENT, 	1;
	SET MY.PLAY, 		1;
	SET MY.EACH_TICK,	NULL;
	SET MY.EACH_CYCLE,	act_EKiddoor_checkopen;
}

ACTION	act_EKiddoor_checkopen 
{	SET MY.PASSABLE,	1;	//now the player may pass the door
}

ACTION	act_EKiddoor_EACH_TICK 
{	IF_EQUAL	sk_EKiddooropened, 0;	
		END;
	CALL	act_EKiddoor_open;
}
WALL  Locked_EKidsdoor01
{	TEXTURE		EKiddoor_close_tex;
	EACH_TICK	act_EKiddoor_EACH_TICK;
	FLAGS		TRANSPARENT,SAVE;
	DIST		6;	
}