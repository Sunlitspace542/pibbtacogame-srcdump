////////////////////////
//  Zombie
////////////////////////

BMAP  map_ZMove01,	<zombt01.pcx>;
BMAP  map_ZMove02,	<zombt02.pcx>;
BMAP  map_ZMove03,	<zombt03.pcx>;
BMAP  map_ZMove04,	<zombt04.pcx>;
BMAP  map_ZMove05,	<zombt05.pcx>;
BMAP  map_ZMove06,	<zombt06.pcx>;
BMAP  map_ZMove07,	<zombt07.pcx>;
BMAP  map_ZMove08,	<zombt08.pcx>;
BMAP  map_ZMove09,	<zombt09.pcx>;
BMAP  map_ZMove10,	<zombt10.pcx>;
BMAP  map_ZMove11,	<zombt11.pcx>;
BMAP  map_ZMove12,	<zombt12.pcx>;

BMAP  map_ZDie01,	<cHANGE01.pcx>;
BMAP  map_ZDie02,	<CHANGE02.pcx>;
BMAP  map_ZDie03,	<CHANGE01.pcx>;

BMAP  map_ZShoot01,	<Zap01.pcx>;
BMAP  map_ZShoot02,	<Zap02.pcx>;

BMAP  map_TeacherMath01,	<Ashes.pcx>;
BMAP  map_TeacherMath02,	<Ashes.pcx>;
BMAP  map_TeacherMath03,	<Ashes.pcx>;
BMAP  map_TeacherMath04,	<Ashes.pcx>;
BMAP  map_TeacherMath05,	<Ashes.pcx>;

SOUND snd_HitTeacherM,	<mthit.wav>;

TEXTURE	tex_TeacherM
{	SCALE_XY	38,38;	
	CYCLES	2;
	BMAPS		map_TeacherMath01,map_TeacherMath02;
	DELAY		2,2;
	AMBIENT	0.1;	
}
TEXTURE	tex_HitTeacherM
{   	SCALE_XY	38,38;	
	CYCLES		3;
	BMAPS		map_TeacherMath03,map_TeacherMath04,map_TeacherMath05;
	AMBIENT		0.2;
	SOUND		snd_HitTeacherM;
	FLAGS		ONESHOT;
	SVOL 		2;
	DELAY		2,2,2;
	SCYCLE		1;
}

ACTION act_HitTeacherM
{	ADD sk_health,		-1;
	ADD			sk_FriendKills, 1;
	SET MY.TEXTURE,		tex_HitTeacherM;
	SET MY.PLAY,		1;
	SET MY.EACH_CYCLE, 	act_ResetTeacherM;
}

ACTION act_ResetTeacherM
{	SET MY.PLAY,		0;
	SET MY.EACH_CYCLE, 	NULL;
	SET MY.TEXTURE,		tex_TeacherM;
}
//*******************************************************************
//*******************************************************************
//*******************************************************************
BMAP  map_TeacherEng01,	<Ashes.pcx>;
BMAP  map_TeacherEng02,	<Ashes.pcx>;
BMAP  map_TeacherEng03,	<Ashes.pcx>;
BMAP  map_TeacherEng04,	<Ashes.pcx>;

SOUND snd_HitTeacher,	<fthit.wav>;

TEXTURE	tex_Teacher
{	SCALE_XY	38,38;	
	//SIDES		1;
	CYCLES		2;
	BMAPS		map_TeacherEng01,map_TeacherEng02;
	DELAY		2,2;
	AMBIENT		0.1;	
}
TEXTURE	tex_HitTeacher
{   	SCALE_XY	38,38;	
	SIDES		1;
	CYCLES		2;
	BMAPS		map_TeacherEng03,map_TeacherEng04;
	AMBIENT		0.2;
	SOUND		snd_HitTeacher;
	FLAGS		ONESHOT;
	SVOL		2;
	DELAY		2,2;
	SCYCLE		1;
}

ACTION act_HitTeacher
{	ADD sk_health,		-1;
	ADD		sk_FriendKills, 1;
	SET MY.TEXTURE,		tex_HitTeacher;
	SET MY.PLAY,		1;
	SET MY.EACH_CYCLE, 	act_ResetTeacher;
}
ACTION act_ResetTeacher
{	SET MY.PLAY,		0;
	SET MY.EACH_CYCLE, 	NULL;
	SET MY.TEXTURE,		tex_Teacher;
}
//*******************************************************************
//*******************************************************************
//*******************************************************************

SOUND	snd_ZStil,	<ZMove.wav>;
SOUND	snd_ZMove,	<Zmove.wav>;
SOUND	snd_ZHit,	<ZMove.wav>;
//SOUND	snd_ZDie,	<Transfrm.wav>;
//SOUND	snd_ZDead,	<TRANSFRM.wav>;
SOUND	snd_ZAttack,	<ZMove.wav>;
SOUND	snd_ZMaul,	<Zmove.wav>;
SOUND	snd_ZAwake,	<Zmove.wav>;
SOUND	snd_ZRetreat,	<Zmove.wav>;
SOUND	snd_ThanksM,	<ThanksM.wav>;
SOUND	snd_ThanksF,	<ThanksF.wav>;

SOUND	snd_ZPlayerYell,	<zshoot.wav>;

Texture tex_ZStil 
{	SCALE_XY	34,34;	SIDES	1;CYCLES 4;
	BMAPS		map_ZMove09, map_ZMove10, map_ZMove11, map_ZMove12;	
	DELAY		2,2,2,2;
	FLAGS		sloop;
	//SOUND		snd_ZStil;	
	SCYCLE		1;	
	SVOL		2;	
	SDIST		30;
	AMBIENT		.1;
}
Texture tex_ZMove 
{	SCALE_XY	34,34;	SIDES	2;CYCLES 4;
	BMAPS	map_ZMove01,	map_ZMove02,	map_ZMove03,	map_ZMove04,
		map_ZMove05,	map_ZMove06,	map_ZMove07,	map_ZMove08;
		//map_ZMove09,	map_ZMove10,	map_ZMove11,	map_ZMove12,	
		//map_ZMove13,	map_ZMove14,	map_ZMove15,	map_ZMove16;
	DELAY	3,3,3,3;
	FLAGS	sloop;
	SOUND	snd_ZMove;	
	SCYCLE	1;	
	SVOL	1;	
	SDIST	40;	
	AMBIENT	.1;
}
Texture tex_ZHit 
{	SCALE_XY 	34,34;	CYCLES 4;
	BMAPS		map_ZMove09, map_ZMove10, map_ZMove11, map_ZMove12;
	//FLAGS		sloop;
	//SOUND		snd_ZHit;	
	//SCYCLE	1;	
	//SVOL		1;	
	SDIST		20;	
	AMBIENT		.1;
}
Texture tex_ZDie 
{	SCALE_XY 	34,34;	SIDES	1; CYCLES 3;
	BMAPS		map_ZDie01,	map_ZDie02,	map_ZDie03;
	DELAY		2,2,2;
	FLAGS		sloop;
	//SOUND		snd_ZDie;	
	//SCYCLE	1;	
	//SVOL		1;	
	SDIST		20;	
	AMBIENT	1;
}

Texture tex_ZAttack 
{	SCALE_XY 	34,34;	
	CYCLES 		6;
	BMAPS		map_ZMove01,map_ZMove02,map_ZMove03,	
			map_ZMove04,map_ZShoot01,map_ZShoot02;
	DELAY		2,2,2,2,2,2;
	//SOUND		snd_ZAttack;
	FLAGS		sloop;
	SCYCLE		1;
	SVOL		1;
	SDIST		40;
	AMBIENT		.2;
}
//*******************************************************
//*******************************************************
//*******************************************************
ACTION act_ZStartAttack
{	
	RULE		MY.SPEED 	= MY.SKILL2 * 1.0;
	RULE		MY.DIST  	= MY.SKILL3 * 5.0;
	SET		MY.IF_FAR,	act_ZStartSleep;
	SET		MY.IF_NEAR,	NULL;
	SET		MY.IF_HIT,	act_ZTakeHit;
	SET		MY.TARGET,	FOLLOW;
	SET		MY.EACH_TICK,	NULL;
	SET		MY.EACH_CYCLE,	act_ZAttackPlayer;//shoot player
	SET		MY.IF_ARRIVED,	NULL;

	SET		MY.TEXTURE,	tex_ZMove;	
	//PLAY_SOUND	snd_ZAttack, 	1;	
}

ACTION act_ZStartRetreat
{	RULE		MY.SPEED 	= MY.SKILL2 * 0.5;
	RULE		MY.DIST  	= MY.SKILL3 * 2.0;	
 	SET		MY.IF_FAR,	act_ZStartSleep;
	SET		MY.IF_NEAR,	NULL;
	SET		MY.IF_HIT,	act_ZTakeHit;
	SET		MY.TARGET,	REPEL;
	SET		MY.EACH_TICK,	NULL;
	SET		MY.EACH_CYCLE,	NULL;
	SET		MY.IF_ARRIVED,	NULL;

	SET		MY.TEXTURE,	tex_ZMove;
	//PLAY_SOUND	snd_ZRetreat, 	0.3;
}

ACTION act_ZStartDie
{	RULE		MY.SPEED 	= MY.SKILL2 * 0.25;
 	RULE		MY.DIST  	= MY.SKILL3 * 2.0;
	SET		MY.IF_FAR,	act_ZStartSleep;
	SET		MY.IF_NEAR,	NULL;
	SET		MY.IF_HIT,	NULL;
	SET		MY.TARGET,	REPEL;
	SET		MY.EACH_TICK,	NULL;
	SET		MY.EACH_CYCLE,	act_ZStartDead;
	SET		MY.IF_ARRIVED,	NULL;
	SET		MY.TEXTURE,	tex_ZDie;
	//PLAY_SOUND	snd_ZDie, 	.5;
	SET		MY.PLAY,	1;
}
ACTION act_ZStartSleep
{	RULE		MY.SPEED 	= MY.SKILL2 * 0;
	RULE		MY.DIST  	= MY.SKILL3 * 1.0;
	SET		MY.IF_FAR,	NULL;
	SET		MY.IF_NEAR,	act_ZAwake;
	SET		MY.IF_HIT,	act_ZTakeHit;
	SET		MY.TARGET,	NULL;
	SET		MY.EACH_TICK,	NULL;
	SET		MY.EACH_CYCLE,	NULL;
	SET		MY.IF_ARRIVED,	NULL;

	SET		MY.TEXTURE,	tex_ZStil;
	//PLAY_SOUND	NULL, 		0.3;
}
STRING str_ZombieDead, "TAKE THAT!";
ACTION act_ZStartDead
{	SET		MY.SPEED, 	0;
	SET		MY.DIST,	1;
	SET		MY.IF_FAR,	NULL;
	SET		MY.IF_NEAR,	NULL;
	SET		MY.IF_HIT,	NULL;
	SET		MY.TARGET,	NULL;
	SET		MY.EACH_TICK,	NULL;
	SET		MY.EACH_CYCLE,	NULL;
	SET		MY.IF_ARRIVED,	NULL;

//stuff above this line is all initailization ignore

	ADD		sk_ZombieKills, 1;
	SET		text_TxtMsg.STRING, str_ZombieDead;
	CALL		a_ResetText;

//make into a teacherM
	SET		MY.IF_FAR,	act_TeachStopRepel;
	SET		MY.IF_NEAR,	act_TeachRepel;
	RULE		MY.SPEED 	= 0.0;
	RULE		MY.DIST		= 2.0;
	//SET		MY.PASSABLE,	1;
	IF_ABOVE	RANDOM, 	0.5;
		GOTO	female;
male:
	//SET		MY.IF_HIT,	act_HitTeacherM;
	SET		MY.TEXTURE,	tex_TeacherM;	
	PLAY_SOUND	snd_ThanksM,1;
	END;
female:
	//SET		MY.IF_HIT,	act_HitTeacher;
	SET		MY.TEXTURE,	tex_Teacher;	
	PLAY_SOUND	snd_ThanksF,1;
	END;
}
//*******************************************************
//*******************************************************
//*******************************************************
ACTION act_ZAttackPlayer
{	IF_EQUAL	MY.SKILL7,	0;	END;
	SET		SHOOT_X, 	0;
	SET		SHOOT_Y, 	0;
	SET		SHOOT_RANGE,	MY.SKILL5;
	SHOOT		MY;

	IF_EQUAL	HIT_DIST,	0;	GOTO missed;
	PLAY_SOUND	snd_ZPlayerYell,1;
	
	FADE_PAL red_pal, 0.7;			// set hit palette	
	WAIT	3;			
	FADE_PAL red_pal, 0;			// set NORMAL palette	

	SET		MY.TEXTURE,	tex_ZAttack;	
	ADD		sk_health,	MY.SKILL7; 	//injure player
	END;
missed:
	SET		MY.TEXTURE,	tex_ZMove;	

}
//*******************************************************
ACTION act_ZAwake
{	//PLAY_SOUND	snd_ZAwake,	0.3;
			
	IF_ABOVE 	MY.SKILL1, 	1; 	BRANCH act_ZStartAttack;
	IF_ABOVE 	MY.SKILL1, 	0;	BRANCH act_ZStartRetreat;
	BRANCH 		act_ZStartDie;	
}

ACTION act_ZTakeHit
{	PLAY_SOUND	snd_ZHit,	2;
	ADD		MY.SKILL1,	sk_currWeaponDamage;	
	BRANCH	act_ZAwake;
}

//*******************************************************
//*******************************************************
//*******************************************************

ACTOR	actor_Zombie01
{	TEXTURE		tex_ZStil;
	EACH_TICK	act_ZStartSleep;
	SKILL1		4;		//health
	SKILL2		0.3;		//maxspeed
	SKILL3		40;		//basedistance
	SKILL5		7;		//maul range
	SKILL7		-10;		//maul damage
	FLAGS		CAREFULLY,FRAGILE;
}


ACTION	act_TeachRepel
{	SET	MY.SPEED,	0.2;
	SET 	MY.TARGET,	REPEL;
	RULE	MY.DIST = MY.DIST * 1.5;
}

ACTION act_TeachStopRepel
{	SET	MY.SPEED,	0.0;
	SET 	MY.TARGET,	NULL;
	RULE	MY.DIST = MY.DIST / 1.5;
}

ACTOR	Teacher
{	TEXTURE	tex_Teacher;
	SPEED	0.2;
	DIST	2.0;
	FLAGS	CAREFULLY,FRAGILE;
	IF_NEAR	act_TeachRepel;
	IF_FAR	act_TeachStopRepel;
	IF_HIT  act_HitTeacher;
}
		
ACTOR	TeacherM
{	TEXTURE		tex_TeacherM;
	SPEED		0.2;
	DIST		2.0;
	FLAGS		CAREFULLY,FRAGILE;
	IF_NEAR		act_TeachRepel;
	IF_FAR		act_TeachStopRepel;
	IF_HIT		act_HitTeacherM;
}