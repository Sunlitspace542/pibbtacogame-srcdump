/////////////////////////////////////////////////
/////////////////////////////////////////////////
/////////////////////////////////////////////////
//health power up
SOUND	snd_health_up, 	<putitin2.wav>; //key pickup sound
BMAP 	map_health_up,	<cup1.pcx>;

TEXTURE tex_health_up
{	SCALE_XY	32,32;
	BMAPS 		map_health_up;
	AMBIENT		.4;
}

THING	thi_health_up
{	TEXTURE		tex_health_up;
	DIST		5.0;
	IF_NEAR		act_health_up;
}
STRING	str_health_up,"Mmmmm, a CHALUPA! 
I feel better already!!!";
ACTION	act_health_up
{	SET		text_TxtMsg.STRING, str_health_up;
	CALL		a_ResetText;	
	PLAY_SOUND	snd_health_up,	1;
	ADD		sk_health,	20;
	SET		MY.INVISIBLE,		1;
	SET		MY.IF_NEAR,		NULL;
	ADD		sk_PowerupCnt,	1;
}
/////////////////////////////////////////////////
// Gordita
/////////////////////////////////////////////////
BMAP 	map_Gordita_up,	<Gordita.pcx>;

TEXTURE tex_Gordita_up
{	SCALE_XY	32,32;
	BMAPS 		map_Gordita_up;
	AMBIENT		.4;
}

THING	thi_Gordita_up
{	TEXTURE		tex_Gordita_up;
	DIST		5.0;
	IF_NEAR		act_Gordita_up;
}
STRING	str_Gordita_up,"A yummy GORDITA!
I can feel my strength coming back.";

ACTION	act_Gordita_up
{	SET		text_TxtMsg.STRING, str_Gordita_up;
	CALL		a_ResetText;	
	PLAY_SOUND	snd_health_up,	1;
	ADD		sk_health,	15;
	SET		MY.INVISIBLE,		1;
	SET		MY.IF_NEAR,		NULL;
	ADD		sk_PowerupCnt,	1;
}
/////////////////////////////////////////////////
// Twist
/////////////////////////////////////////////////
BMAP 	map_Twist_up,	<Twist.pcx>;

TEXTURE tex_Twist_up
{	SCALE_XY	32,32;
	BMAPS 		map_Twist_up;
	AMBIENT		.4;
}

THING	thi_Twist_up
{	TEXTURE		tex_Twist_up;
	DIST		5.0;
	IF_NEAR		act_Twist_up;
}
STRING	str_Twist_up,"A CINNAMON TWIST!
The cure I've been looking for.";
ACTION	act_Twist_up
{	SET		text_TxtMsg.STRING, str_Twist_up;
	CALL		a_ResetText;	
	PLAY_SOUND	snd_health_up,	1;
	ADD		sk_health,	3;
	SET		MY.INVISIBLE,		1;
	SET		MY.IF_NEAR,		NULL;
	ADD		sk_PowerupCnt,	1;
}
/////////////////////////////////////////////////
// Grande
/////////////////////////////////////////////////
BMAP 	map_Grande_up,	<Grande.pcx>;

TEXTURE tex_Grande_up
{	SCALE_XY	32,32;
	BMAPS 		map_Grande_up;
	AMBIENT		.4;
}

THING	thi_Grande_up
{	TEXTURE		tex_Grande_up;
	DIST		5.0;
	IF_NEAR		act_Grande_up;
}
STRING	str_Grande_up,"At last, the GRANDE MEAL is mine!!!";
ACTION	act_Grande_up
{	SET		text_TxtMsg.STRING, str_Grande_up;
	CALL		a_ResetText;	
	PLAY_SOUND	snd_health_up,	1;
	ADD		sk_health,	10;
	SET		MY.INVISIBLE,		1;
	SET		MY.IF_NEAR,		NULL;
	ADD		sk_PowerupCnt,	1;
}
/////////////////////////////////////////////////
// MPiza
/////////////////////////////////////////////////
BMAP 	map_MPiza_up,	<MPiza.pcx>;

TEXTURE tex_MPiza_up
{	SCALE_XY	32,32;
	BMAPS 		map_MPiza_up;
	AMBIENT		.4;
}

THING	thi_MPiza_up
{	TEXTURE		tex_MPiza_up;
	DIST		5.0;
	IF_NEAR		act_MPiza_up;
}
STRING	str_MPiza_up,"Wow!  A MEXICAN PIZZA for energy.";
ACTION	act_MPiza_up
{	SET		text_TxtMsg.STRING, str_MPiza_up;
	CALL		a_ResetText;	
	PLAY_SOUND	snd_health_up,	1;
	ADD		sk_health,	10;
	SET		MY.INVISIBLE,		1;
	SET		MY.IF_NEAR,		NULL;
	ADD		sk_PowerupCnt,	1;
}
/////////////////////////////////////////////////
// Nacho
/////////////////////////////////////////////////
BMAP 	map_Nacho_up,	<Nacho.pcx>;

TEXTURE tex_Nacho_up
{	SCALE_XY	32,32;
	BMAPS 		map_Nacho_up;
	AMBIENT		.4;
}

THING	thi_Nacho_up
{	TEXTURE		tex_Nacho_up;
	DIST		5.0;
	IF_NEAR		act_Nacho_up;
}
STRING	str_Nacho_up,"This is NACHO average power-up!";
ACTION	act_Nacho_up
{	SET		text_TxtMsg.STRING, str_Nacho_up;
	CALL		a_ResetText;	
	PLAY_SOUND	snd_health_up,	1;
	ADD		sk_health,	7;
	SET		MY.INVISIBLE,		1;
	SET		MY.IF_NEAR,		NULL;
	ADD		sk_PowerupCnt,	1;
}
////////////////////////////////////////////////
// Taco
/////////////////////////////////////////////////
BMAP 	map_Taco_up,	<Taco.pcx>;

TEXTURE tex_Taco_up
{	SCALE_XY	32,32;
	BMAPS 		map_Taco_up;
	AMBIENT		.4;
}

THING	thi_Taco_up
{	TEXTURE		tex_Taco_up;
	DIST		5.0;
	IF_NEAR		act_Taco_up;
}
STRING	str_Taco_up,"Nothing like a crunchy TACO to 
bring your strength back!!!";
ACTION	act_Taco_up
{	SET		text_TxtMsg.STRING, str_Taco_up;
	CALL		a_ResetText;	
	PLAY_SOUND	snd_health_up,	1;
	ADD		sk_health,	5;
	SET		MY.INVISIBLE,		1;
	SET		MY.IF_NEAR,		NULL;
	ADD		sk_PowerupCnt,	1;
}

/////////////////////////////////////////////////
//spitballs
/////////////////////////////////////////////////
SOUND	snd_spitball_up, 	<cool2.wav>; //key pickup sound
BMAP 	map_spitball_up,	<SAUCEH.pcx>;

TEXTURE tex_spitball_up
{	SCALE_XY	32,32;
	BMAPS 		map_spitball_up;
	AMBIENT		.4;
}

THING	thi_spitball_up
{	TEXTURE		tex_spitball_up;
	DIST		5.0;
	IF_NEAR		act_spitball_up;
}
STRING str_spitballs_up,"This HOT SAUCE should come in handy.";
ACTION	act_spitball_up
{	SET		text_TxtMsg.STRING, str_spitballs_up;
	CALL		a_ResetText;	
	PLAY_SOUND	snd_spitball_up,	1;
	ADD		sk_spitball,		10;

	SET		MY.INVISIBLE,		1;
	SET		MY.IF_NEAR,		NULL;
	ADD		sk_PowerupCnt,	1;
	CALL		 a_SelectFireBullet;
}
/////////////////////////////////////////////////
//rband (rubber bands)
/////////////////////////////////////////////////

SOUND	snd_rband_up, 	<oohnice.wav>; //key pickup sound
BMAP 	map_rband_up01,	<SAUCEF.pcx>;
BMAP 	map_rband_up02,	<SAUCEF.pcx>;
BMAP 	map_rband_up03,	<SAUCEF.pcx>;

TEXTURE tex_rband_up
{	SCALE_XY	32,32;
	CYCLES		3;
	BMAPS 		map_rband_up01,map_rband_up02,map_rband_up03;
	DELAY		2,2,2;
	AMBIENT		.4;
}

THING	thi_rband_up
{	TEXTURE		tex_rband_up;
	DIST		5.0;
	IF_NEAR		act_rband_up;
}
STRING str_rubberbands_up,"Wow this WILD SAUCE is HOT!!!";
ACTION	act_rband_up
{	SET		text_TxtMsg.STRING, str_rubberbands_up;
	CALL		a_ResetText;	
	PLAY_SOUND	snd_rband_up,	1;
	ADD		sk_rband,	10;
	SET		MY.INVISIBLE,		1;
	SET		MY.IF_NEAR,		NULL;
	ADD		sk_PowerupCnt,	1;
}

/////////////////////////////////////////////////
/////////////////////////////////////////////////
//rubber bands power up
SOUND	snd_rbandW_up, 	<AllMine3.wav>; //key pickup sound
BMAP 	map_rbandW_up,	<straw1.pcx>;

TEXTURE tex_rbandW_up
{	SCALE_XY	32,32;
	BMAPS 		map_rbandW_up;
	AMBIENT		.4;
}

THING	thi_rbandW_up
{	TEXTURE		tex_rbandW_up;
	DIST		5.0;
	HEIGHT		2;
	IF_NEAR		act_rbandW_up;
}
STRING	str_rbandW_up,"This will work great 
with some WILD SAUCE.";

ACTION	act_rbandW_up
{	SET		text_TxtMsg.STRING, str_rbandW_up;
	CALL		a_ResetText;	
	PLAY_SOUND	snd_rbandW_up,	1;
	SET		MY.INVISIBLE,	1;
	SET		MY.IF_NEAR,	NULL;
	SET		IF_2,		a_SelectFireRubberBand;
	ADD		sk_PowerupCnt,	1;
	CALL		a_SelectFireRubberBand;
}
