BMAP  map_DEStill01,	<EVIL01.pcx>;
BMAP  map_DERetreat01,	<EVIL01.pcx>;
BMAP  map_DEShoot01,	<EVIL01.pcx>;
BMAP  map_DEShoot02,	<EVIL02.pcx>;
BMAP  map_DEShoot03,	<EVIL03.pcx>;
BMAP  map_DEShoot04,	<EVIL04.pcx>;

SOUND snd_DEAmbient, 	<ZMove.wav>;
SOUND snd_DEDie, 	<gotkey.wav>;
SOUND snd_DEMaul, 	<Flame.wav>;
SOUND snd_DEHit, 	<ZMove.wav>;

WAY w_EvilRetreat;
Texture tex_DEStil 
{	SCALE_XY	30,30;	CYCLES 4;
	BMAPS	map_DEShoot01,map_DEShoot02,map_DEShoot03,map_DEShoot04;
	DELAY	3,3,3,3;
	FLAGS	sloop;
	SOUND	snd_DEAmbient;	SCYCLE	1;	SVOL	1;	SDIST	45;
	AMBIENT	.1;
}

Texture tex_DEShoot
{	SCALE_XY	30,30;	SIDES	1;CYCLES 4;
	BMAPS	map_DEShoot01,map_DEShoot02,map_DEShoot03,map_DEShoot04;
	DELAY	3,3,3,3;
	//FLAGS	ONESHOT;
	SOUND	snd_DEAmbient;	SCYCLE	1;	SVOL	1;	SDIST	45;
	AMBIENT	.1;
}
Texture tex_DERetreat
{	SCALE_XY	30,30;	CYCLES 4;
	BMAPS	map_DEShoot01,map_DEShoot02,map_DEShoot03,map_DEShoot04;
	DELAY	2,2,2,2;
	//FLAGS	ONESHOT;
	SOUND	snd_DEAmbient;	SCYCLE	1;	SVOL	1;	SDIST	45;
	AMBIENT	.1;
}

//*******************************************************
//*******************************************************
//*******************************************************
ACTION act_DEStartAttack
{	RULE		MY.SPEED 	= MY.SKILL2 * 1.0;
	RULE		MY.DIST  	= MY.SKILL3 * 2.0;
	SET		MY.IF_FAR,	act_DEStartSleep;
	SET		MY.IF_NEAR,	NULL;
	SET		MY.IF_HIT,	act_DETakeHit;
	SET		MY.TARGET,	FOLLOW;
	SET		MY.EACH_TICK,	act_DEAttack;//shoot player
	SET		MY.EACH_CYCLE,	act_DESpewFire;
	SET		MY.IF_ARRIVED,	NULL;
	SET		MY.SKILL4,	0;
	SET		MY.TEXTURE,	tex_DEShoot;	
	//PLAY_SOUND	snd_DEAttack, 	0.3;	
}

ACTION act_DEStartRetreat
{	RULE		MY.SPEED 	= MY.SKILL2 * 1.5;
	RULE		MY.DIST  	= MY.SKILL3 * 2.0;	
 	SET		MY.IF_FAR,	act_DEStartSleep;
	SET		MY.IF_NEAR,	NULL;
	SET		MY.IF_HIT,	act_DETakeHit;
	SET		MY.TARGET,	w_EvilRetreat;;//head for layer
	SET		MY.EACH_TICK,	act_DERetreat;//retreat player
	SET		MY.EACH_CYCLE,	NULL;
	SET		MY.IF_ARRIVED,	NULL;
	SET		MY.SKILL4,	0;
	SET		MY.TEXTURE,	tex_DERetreat;
	//PLAY_SOUND	snd_DERetreat, 	0.3;
}

ACTION act_DEStartSleep
{	RULE		MY.SPEED 	= MY.SKILL2 * 0;
	RULE		MY.DIST  	= MY.SKILL3 * 1.0;
	SET		MY.IF_FAR,	NULL;
	SET		MY.IF_NEAR,	act_DEAwake;
	SET		MY.IF_HIT,	act_DETakeHit;
	SET		MY.TARGET,	NULL;
	SET		MY.EACH_TICK,	NULL;
	SET		MY.EACH_CYCLE,	NULL;
	SET		MY.IF_ARRIVED,	NULL;
	SET		MY.SKILL4,	0;
	SET		MY.TEXTURE,	tex_DEStil;	
}

//*******************************************************
//*******************************************************
//*******************************************************
ACTION act_DESpewFire
{	SET		skFB_A,		MY.ANGLE;
	RULE		skFB_X = 	MY.X;
	RULE		skFB_Y = 	MY.Y;
	RULE		skFB_H = 	MY.Height + 2;
	SET		actor_FireBall.INVISIBLE, 0;
	SET		actor_FireBall.EACH_TICK, act_initFireball;
}
ACTION act_EvilRegenerateHealth
{	IF_BELOW	MY.SKILL1,	20;
		ADD	MY.SKILL1,	0.05;		//regenerate health	
}
ACTION act_DEAttack
{	CALL		act_EvilRegenerateHealth;	
	ADD		MY.SKILL4,	1;
	IF_BELOW	MY.SKILL4,	MY.SKILL8;	END;
	SET		MY.SKILL4,	0;	

	IF_EQUAL	MY.SKILL7,	0;	END;
	SET		SHOOT_X, 	0;
	SET		SHOOT_Y, 	0;
	SET		SHOOT_RANGE,	MY.SKILL5;
	SHOOT		MY;

	PLAY_SOUND	snd_DEMaul,	1;
	IF_EQUAL	HIT_DIST,	0;	END;
	ADD		sk_health,	MY.SKILL7; 	//injure player

	//CALL		act_DEStartRetreat;
}
ACTION act_DERetreat
{	CALL		act_EvilRegenerateHealth;
	ADD		MY.SKILL4,	1;
	IF_BELOW	MY.SKILL4,	MY.SKILL8;	END;
	SET		MY.SKILL4,	0;

	IF_ABOVE 	MY.SKILL1, 	20;	
		CALL	act_DEStartAttack;
}

//*******************************************************
ACTION act_DEAwake
{	//PLAY_SOUND	snd_DEAwake,	0.3;			
	BRANCH act_DEStartAttack;	
}

ACTION act_DETakeHit
{	PLAY_SOUND	snd_DEHit,	1;
	ADD		MY.SKILL1,	sk_currWeaponDamage;	
	IF_ABOVE 	MY.SKILL1, 	0;	END;
	BRANCH 		act_DEStartRetreat;
}

//*******************************************************
//*******************************************************
//*******************************************************

ACTOR	actor_DoctorEvil01
{	TEXTURE		tex_DEStil;
	EACH_TICK	act_DEStartSleep;
	SKILL1		20;		//health
	SKILL2		0.2;		//maxspeed
	SKILL3		75;		//basedistance
	SKILL4		0;		//counter
	SKILL5		20;		//maul range
	SKILL6		20;		//frames to retreat for
	SKILL7		-5;		//maul damage
	SKILL8		25;		//frames to attack for
	FLAGS		CAREFULLY,FRAGILE;
}