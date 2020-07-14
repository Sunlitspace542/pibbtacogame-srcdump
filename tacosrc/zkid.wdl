////////////////////////
//  ZKid
////////////////////////

BMAP  map_ZKidMove01,	<zmbk01.pcx>;
BMAP  map_ZKidMove02,	<zmbk02.pcx>;
BMAP  map_ZKidMove03,	<zmbk03.pcx>;
BMAP  map_ZKidMove04,	<zmbk04.pcx>;
BMAP  map_ZKidMove05,	<zmbk05.pcx>;
BMAP  map_ZKidMove06,	<zmbk06.pcx>;
BMAP  map_ZKidMove07,	<zmbk07.pcx>;
BMAP  map_ZKidMove08,	<zmbk08.pcx>;
BMAP  map_ZKidMove09,	<zmbk01.pcx>;
BMAP  map_ZKidMove10,	<zmbk02.pcx>;
BMAP  map_ZKidMove11,	<zmbk03.pcx>;
BMAP  map_ZKidMove12,	<zmbk04.pcx>;

BMAP  map_ZKidDie01,	<CHANGE01.pcx>;
BMAP  map_ZKidDie02,	<CHANGE02.pcx>;
BMAP  map_ZKidDie03,	<CHANGE01.pcx>;

BMAP  map_ZKidShoot01,	<ZapKid01.pcx>;
BMAP  map_ZKidShoot02,	<ZapKid02.pcx>;

BMAP  Boy01_map,	<Ashes.pcx>;
BMAP  Boy02_map,	<Ashes.pcx>;
BMAP  Boy03_map,	<Ashes.pcx>;
BMAP  Boy04_map,	<Ashes.pcx>;

SOUND snd_BoyHit,	<BoyHit.wav>;

TEXTURE	Boy01_tex {
	SCALE_XY	40,40;
	CYCLES	5;
	BMAPS	Boy01_map,Boy02_map,Boy02_map,Boy02_map,Boy01_map;
	DELAY	8,3,10,3,2;
	AMBIENT	0.1;
	//SCYCLE	1;
}
TEXTURE	Boyhit01_tex {
	SCALE_XY	40,40;
	CYCLES	5;
	BMAPS	Boy03_map,Boy04_map,Boy04_map,Boy04_map,Boy03_map;
	DELAY	1,2,3,2,1;
	SOUND 	snd_BoyHit;
	SVOL	1;
	FLAGS	ONESHOT;
	AMBIENT	0.4;
	//SCYCLE	1;
}

ACTION act_HitBoy
{	ADD sk_health,		-1;
	ADD		sk_FriendKills, 1;
	SET MY.TEXTURE,		BoyHit01_tex;
	SET MY.PLAY,		1;
	SET MY.EACH_CYCLE, 	act_ResetBoy;
}

ACTION act_ResetBoy
{	SET MY.PLAY,		0;
	SET MY.EACH_CYCLE, 	NULL;
	SET MY.TEXTURE,		Boy01_tex;
}
//*******************************************************************
//*******************************************************************
//*******************************************************************
BMAP  girl01_map,		<Ashes.pcx>;
BMAP  girl02_map,		<Ashes.pcx>;
BMAP  girl03_map,		<Ashes.pcx>;
BMAP  girl04_map,		<Ashes.pcx>;

SOUND snd_GirlHit,	<GirlHit.wav>;

TEXTURE	girl01_tex {
	SCALE_XY	40,40;
	CYCLES	2;
	BMAPS	girl01_map,girl02_map;
	DELAY	8,8;
	AMBIENT	0.1;
}
TEXTURE	girlhit01_tex {
	SCALE_XY	40,40;
	CYCLES		4;
	BMAPS		girl01_map,
			girl02_map,
			girl03_map,
			girl04_map;
			
	DELAY		4,3,2,2;
	AMBIENT		0.4;
	SOUND		snd_GirlHit;
	SVOL		1;
	FLAGS		ONESHOT;
	//SCYCLE	1;
}

ACTION act_HitGirl
{	ADD sk_health,		-1;
	ADD			sk_FriendKills, 1;
	SET MY.TEXTURE,		girlHit01_tex;
	SET MY.PLAY,		1;
	SET MY.EACH_CYCLE, 	act_ResetGirl;
}

ACTION act_ResetGirl
{	SET MY.PLAY,		0;
	SET MY.EACH_CYCLE, 	NULL;
	SET MY.TEXTURE,		girl01_tex;
}
//*******************************************************************
//*******************************************************************
//*******************************************************************

SOUND	snd_ZKidStil,	<ZMove.wav>;
SOUND	snd_ZKidMove,	<Zmove.wav>;
SOUND	snd_ZKidHit,	<ZMove.wav>;
//SOUND	snd_ZKidDie,	<TRANSFRM.wav>;
//SOUND	snd_ZKidDead,	<TRANSFRM.wav>;
SOUND	snd_ZKidAttack,	<ZMove.wav>;
SOUND	snd_ZKidMaul,	<Zmove.wav>;
SOUND	snd_ZKidAwake,	<Zmove.wav>;
SOUND	snd_ZKidRetreat,<Zmove.wav>;

SOUND	snd_ThanksB,	<ThanksB.wav>;
SOUND	snd_ThanksG,	<ThanksG.wav>;

SOUND	snd_PlayerYell,	<ZShoot.wav>;

Texture tex_ZKidStil 
{	SCALE_XY	34,34;	CYCLES 4;
	BMAPS	map_ZKidMove09, map_ZKidMove10, map_ZKidMove11, map_ZKidMove12;
	DELAY	2,2,2,2;
	FLAGS	sloop;
	//SOUND	snd_ZKidStil;	SCYCLE	1;	SVOL	1;	SDIST	10;
	AMBIENT	.1;
}
Texture tex_ZKidMove 
{	SCALE_XY	34,34;	SIDES	2;CYCLES 4;
	BMAPS	map_ZKidMove01,	map_ZKidMove02,	map_ZKidMove03,	map_ZKidMove04,
		map_ZKidMove05,	map_ZKidMove06,	map_ZKidMove07,	map_ZKidMove08;
	DELAY	3,3,3,3;
	FLAGS	sloop;
	SOUND	snd_ZKidMove;	SCYCLE	1;	SVOL	1;	SDIST	40;	
	AMBIENT	.1;
}
Texture tex_ZKidHit 
{	SCALE_XY 	34,34;	CYCLES 4;
	BMAPS	map_ZKidMove09, map_ZKidMove10, map_ZKidMove11, map_ZKidMove12;
	FLAGS	sloop;
	SOUND	snd_ZKidHit;	SCYCLE	1;	SVOL	1;	SDIST	10;	
	AMBIENT	.1;
}
Texture tex_ZKidDie 
{	SCALE_XY 	34,34;	SIDES	1; CYCLES 3;
	BMAPS	map_ZKidDie01,	map_ZKidDie02,	map_ZKidDie03;
	DELAY	2,2,2;
	FLAGS	sloop;
	AMBIENT	.1;
}

Texture tex_ZKidAttack 
{	SCALE_XY 	34,34;
	//SIDES 4;	
	CYCLES 6;
	BMAPS	map_ZKidMove01,	map_ZKidMove02,	map_ZKidMove03,	
		map_ZKidMove04,	map_ZKidShoot01,map_ZKidShoot02;
	DELAY	2,2,2,2,2,2;
	//SOUND	snd_ZKidAttack;
	FLAGS	sloop;
	SCYCLE	1;
	SVOL	1;
	SDIST	40;
	AMBIENT	.2;
}
//*******************************************************
//*******************************************************
//*******************************************************
ACTION act_ZKidStartAttack
{	
	RULE		MY.SPEED 	= MY.SKILL2 * 1.0;
	RULE		MY.DIST  	= MY.SKILL3 * 5.0;
	SET		MY.IF_FAR,	act_ZKidStartSleep;
	SET		MY.IF_NEAR,	NULL;
	SET		MY.IF_HIT,	act_ZKidTakeHit;
	SET		MY.TARGET,	FOLLOW;
	SET		MY.EACH_TICK,	NULL;
	SET		MY.EACH_CYCLE,	act_ZKidAttackPlayer;//shoot player
	SET		MY.IF_ARRIVED,	NULL;
	SET		MY.TEXTURE,	tex_ZKidMove;	
	//PLAY_SOUND	snd_ZKidAttack, 	0.3;	
}

ACTION act_ZKidStartRetreat
{	RULE		MY.SPEED 	= MY.SKILL2 * 0.5;
	RULE		MY.DIST  	= MY.SKILL3 * 2.0;	
 	SET		MY.IF_FAR,	act_ZKidStartSleep;
	SET		MY.IF_NEAR,	NULL;
	SET		MY.IF_HIT,	act_ZKidTakeHit;
	SET		MY.TARGET,	REPEL;
	SET		MY.EACH_TICK,	NULL;
	SET		MY.EACH_CYCLE,	NULL;
	SET		MY.IF_ARRIVED,	NULL;
	SET		MY.TEXTURE,	tex_ZKidMove;
}

ACTION act_ZKidStartDie
{	RULE		MY.SPEED 	= MY.SKILL2 * 0.25;
 	RULE		MY.DIST  	= MY.SKILL3 * 2.0;
	SET		MY.IF_FAR,	act_ZKidStartSleep;
	SET		MY.IF_NEAR,	NULL;
	SET		MY.IF_HIT,	NULL;
	SET		MY.TARGET,	REPEL;
	SET		MY.EACH_TICK,	NULL;
	SET		MY.EACH_CYCLE,	act_ZKidStartDead;
	SET		MY.IF_ARRIVED,	NULL;
	SET		MY.TEXTURE,	tex_ZKidDie;
	SET		MY.PLAY,	1;
}
ACTION act_ZKidStartSleep
{	RULE		MY.SPEED 	= MY.SKILL2 * 0;
	RULE		MY.DIST  	= MY.SKILL3 * 1.0;
	SET		MY.IF_FAR,	NULL;
	SET		MY.IF_NEAR,	act_ZKidAwake;
	SET		MY.IF_HIT,	act_ZKidTakeHit;
	SET		MY.TARGET,	NULL;
	SET		MY.EACH_TICK,	NULL;
	SET		MY.EACH_CYCLE,	NULL;
	SET		MY.IF_ARRIVED,	NULL;

	SET		MY.TEXTURE,	tex_ZKidStil;
	//PLAY_SOUND	NULL, 		0.3;
}
STRING str_ZKidDead, "Take that!";
ACTION act_ZKidStartDead
{	SET		MY.SPEED, 	0;
	SET		MY.DIST,	1;
	SET		MY.IF_FAR,	NULL;
	SET		MY.IF_NEAR,	NULL;
	SET		MY.IF_HIT,	NULL;
	SET		MY.TARGET,	NULL;
	SET		MY.EACH_TICK,	NULL;
	SET		MY.EACH_CYCLE,	NULL;
	SET		MY.IF_ARRIVED,	NULL;


	ADD		sk_ZombieKills, 1;

	SET		text_TxtMsg.STRING, str_ZKidDead;
	CALL		a_ResetText;

//make into a kid
	SET		MY.IF_FAR,	act_KidStopRepel;
	SET		MY.IF_NEAR,	act_KidRepel;	
	RULE		MY.SPEED 	= 0.0;
	RULE		MY.DIST		= 2.0;
	//SET		MY.PASSABLE,	1;
	IF_ABOVE	RANDOM, 	0.5;
		GOTO	female;
male:
	//SET		MY.IF_HIT,	act_HitBoy;
	SET		MY.TEXTURE,	Boy01_tex;	
	PLAY_SOUND	snd_ThanksB,1;
	END;
female:
	//SET		MY.IF_HIT,	act_HitGirl;
	SET		MY.TEXTURE,	Girl01_tex;	
	PLAY_SOUND	snd_ThanksG,1;
	END;
}
//*******************************************************
//*******************************************************
//*******************************************************
ACTION act_ZKidAttackPlayer
{	IF_EQUAL	MY.SKILL7,	0;	END;
	SET		SHOOT_X, 	0;
	SET		SHOOT_Y, 	0;
	SET		SHOOT_RANGE,	MY.SKILL5;
	SHOOT		MY;

	IF_EQUAL	HIT_DIST,	0;	GOTO missed;
	PLAY_SOUND	snd_PlayerYell,	1;
	
	FADE_PAL red_pal, 0.7;			// set hit palette	
	WAIT	3;			
	FADE_PAL red_pal, 0;			// set NORMAL palette	

	SET		MY.TEXTURE,	tex_ZKidAttack;	
	ADD		sk_health,	MY.SKILL7; 	//injure player
	END;
missed:
	SET		MY.TEXTURE,	tex_ZKidMove;	

}
//*******************************************************
ACTION act_ZKidAwake
{	//PLAY_SOUND	snd_ZKidAwake,	0.3;
			
	IF_ABOVE 	MY.SKILL1, 	1; 	BRANCH act_ZKidStartAttack;
	IF_ABOVE 	MY.SKILL1, 	0;	BRANCH act_ZKidStartRetreat;
	BRANCH 		act_ZKidStartDie;	
}

ACTION act_ZKidTakeHit
{	PLAY_SOUND	snd_ZKidHit,	1;
	ADD		MY.SKILL1,	sk_currWeaponDamage;	
	BRANCH	act_ZKidAwake;
}

//*******************************************************
//*******************************************************
//*******************************************************

ACTOR	actor_ZKid01
{	TEXTURE		tex_ZKidStil;
	EACH_TICK	act_ZKidStartSleep;
	SKILL1		5;		//health
	SKILL2		0.5;		//maxspeed
	SKILL3		30;		//basedistance
	SKILL5		7;		//maul range
	SKILL7		-10;		//maul damage
	FLAGS		CAREFULLY,FRAGILE;
}

ACTION	act_KidRepel
{	SET	MY.SPEED,	0.2;
	SET 	MY.TARGET,	REPEL;
	RULE	MY.DIST = MY.DIST * 1.5;
}

ACTION act_KidStopRepel
{	SET	MY.SPEED,	0.0;
	SET 	MY.TARGET,	NULL;
	RULE	MY.DIST = MY.DIST / 1.5;
}

ACTOR	Boy{
	TEXTURE		Boy01_tex;
	SPEED		0.2;
	FLAGS		CAREFULLY,FRAGILE;
	IF_NEAR	act_TeachRepel;
	IF_FAR	act_TeachStopRepel;	
	IF_HIT 		act_HitBoy;
}
ACTOR	Girl{
	TEXTURE		Girl01_tex;
	SPEED		0.2;
	FLAGS		CAREFULLY,FRAGILE;
	IF_NEAR	act_TeachRepel;
	IF_FAR	act_TeachStopRepel;
	IF_HIT 		act_HitGirl;
}