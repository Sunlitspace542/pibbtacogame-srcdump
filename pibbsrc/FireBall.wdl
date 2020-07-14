
BMAP  map_flameb01,		<flame03.pcx>;
BMAP  map_flameb02,		<flame05.pcx>;
BMAP  map_flameb03,		<flame07.pcx>;
BMAP  map_flameb04,		<flame09.pcx>;
BMAP  map_flameb05,		<flame11.pcx>;

TEXTURE tex_Flameb
{	SCALE_XY	16,16;
	SIDES		1;
	CYCLES		5;
	BMAPS		map_flameb01,map_flameb02,map_flameb03,map_flameb04,map_flameb05;
	AMBIENT		0.9;
	//FLAGS		ONESHOT;
}
SKILL	skFB_A{VAL 0;}//angle
SKILL	skFB_X{VAL 0;}//x position
SKILL	skFB_Y{VAL 0;}//y position
SKILL	skFB_H{VAL 0;}//h position

ACTION	act_FBExplode
{	EXPLODE		MY;
}
ACTION	act_FBExpire
{	SET		MY.INVISIBLE, 	1;
	SET		MY.TARGET,	NULL;
}

ACTION	act_initFireball
{	SET		MY.EACH_TICK, 	NULL;
	SET		MY.IF_NEAR,	act_FBExplode;
	SET		MY.EACH_CYCLE,	act_FBExpire;
	SET		MY.ANGLE,	skFB_A;
	SET		MY.X,		skFB_X;
	SET		MY.Y,		skFB_Y;
	SET		MY.HEIGHT,	skFB_H;
	SET		MY.TARGET,	MOVE;
	SHAKE		MY;
}

ACTOR	actor_FireBall
{	TEXTURE 	tex_Flameb;
	FLAGS		INVISIBLE;
	DIST		5.0;	
	SPEED		1.0;
	
}
