
BMAP  map_flare01,		<flare01.pcx>;
BMAP  map_flare02,		<flare02.pcx>;
BMAP  map_flare03,		<flare03.pcx>;
BMAP  map_flare04,		<flare04.pcx>;
BMAP  map_flare05,		<flare05.pcx>;

TEXTURE tex_flareb
{	SCALE_XY	16,16;
	SIDES		1;
	CYCLES		5;
	BMAPS		map_flare01,map_flare02,map_flare03,map_flare04,map_flare05;
	DELAY		2,2,2,2,2;
	AMBIENT		0.9;
	//FLAGS		ONESHOT;
}
SKILL	skFlare_A{VAL 0;}//angle
SKILL	skFlare_X{VAL 0;}//x position
SKILL	skFlare_Y{VAL 0;}//y position
SKILL	skFlare_H{VAL 0;}//h position

ACTION	act_FlareExplode
{	EXPLODE		MY;
}
ACTION	act_FlareExpire
{	SET		MY.INVISIBLE, 	1;
	SET		MY.TARGET,	NULL;
}

ACTION	act_initFlare
{	SET		MY.EACH_TICK, 	NULL;
	SET		MY.IF_NEAR,	act_FlareExplode;
	SET		MY.EACH_CYCLE,	act_FlareExpire;
	SET		MY.ANGLE,	skFlare_A;
	SET		MY.X,		skFlare_X;
	SET		MY.Y,		skFlare_Y;
	SET		MY.HEIGHT,	skFlare_H;
	SET		MY.TARGET,	MOVE;
	SHAKE		MY;
}

ACTOR	actor_Flare
{	TEXTURE 	tex_flareb;
	//FLAGS		INVISIBLE;
	DIST		5.0;	
	SPEED		1.0;
	
}
