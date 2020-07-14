/////////
//explosion generator
/////////

BMAP  map_Pow01,		<burp01.pcx>;
BMAP  map_Pow02,		<burp02.pcx>;
BMAP  map_Pow03,		<burp03.pcx>;

SOUND snd_Explode,		<splash.wav>;
TEXTURE tex_Explode
{	SCALE_XY	16,16;
	SIDES		1;
	CYCLES		3;
	BMAPS		map_Pow01,map_Pow02,map_Pow03;
	DELAY		2,2,2;
	AMBIENT		0.9;
	FLAGS		ONESHOT;
}

ACTION a_ExplosionInit
{	SET		MY.TEXTURE,	tex_Explode;
	SET		MY.X,		s_SmokeX;
	SET		MY.Y,		s_SmokeY;
	RULE		MY.HEIGHT = 	s_SmokeZ - 1.0;
	SET		MY.PLAY,	1;
	SET		MY.EACH_TICK,	NULL;
	SET		MY.EACH_CYCLE,	a_TempDisapear;
	SET		MY.GROUND,	0;
	PLAY_SOUND	snd_Explode,	1;
	SHAKE	MY;
}

////////////////////////////////////////////////
//Explosion generator
////////////////////////////////////////////////
ACTION a_GenerateExplosion //at location s_SmokeX,s_SmokeY,s_SmokeZ
{
	SET		SYN_tempInit, a_ExplosionInit;
	CALL		a_InitTemp;
}
