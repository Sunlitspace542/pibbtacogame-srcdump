//////
//smoke generator
/////
BMAP  map_Smoke1,		<bubls01.pcx>;
BMAP  map_Smoke2,		<bubls02.pcx>;
BMAP  map_Smoke3,		<bubls03.pcx>;
BMAP  map_Smoke4,		<bubls04.pcx>;

SKILL	s_SmokeX {}
SKILL	s_SmokeY {}
SKILL	s_SmokeZ {}

TEXTURE tex_Smoke1
{	SCALE_XY	32,32;
	SIDES		1;
	CYCLES		4;
	BMAPS		map_Smoke1,map_Smoke2,map_Smoke3,map_Smoke4;
	AMBIENT		0.3;
	FLAGS		ONESHOT;
}

TEXTURE tex_Smoke2
{	SCALE_XY	25,25;
	SIDES		1;
	CYCLES		4;
	BMAPS		map_Smoke1,map_Smoke2,map_Smoke3,map_Smoke4;
	AMBIENT		0.3;
	FLAGS		ONESHOT;
}

SKILL	s_LastSmoke {}
ACTION a_SmokeInit
{	RULE	s_SmokeX = RANDOM*0.5 -0.25 + s_SmokeX;
	RULE	s_SmokeY = RANDOM*0.5 -0.25 + s_SmokeY;
	RULE	s_SmokeZ = RANDOM*0.5 -0.25 + s_SmokeZ;
	SET		MY.IF_HIT,		NULL;
	SET		MY.X			s_SmokeX;
	SET		MY.Y			s_SmokeY;
	SET		MY.HEIGHT,		s_SmokeZ;
	SET		MY.EACH_TICK,	a_SmokeRise;
	SET		MY.EACH_CYCLE,	a_TempDisapear;
	
	IF_EQUAL s_LastSmoke,0;	SET		MY.TEXTURE,		tex_Smoke1;
	IF_EQUAL s_LastSmoke,1; SET		MY.TEXTURE,		tex_Smoke2;
	ADD		s_LastSmoke,	1;
	IF_EQUAL	s_LastSmoke,	2;	SET	s_LastSmoke,	0;

	SET		MY.PLAY,		1;
	SHAKE	MY;
}

ACTION	a_SmokeRise
{	ADD		MY.HEIGHT,		0.3;
}

////////////////////////////////////////////////
//smoke generator
////////////////////////////////////////////////
ACTION a_GenerateSmoke //at location s_SmokeX,s_SmokeY,s_SmokeZ
{
	
	SET		SYN_tempInit, a_SmokeInit;
	CALL		a_InitTemp;
}

