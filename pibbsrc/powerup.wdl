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
STRING	str_health_up,"Ahhh, I feel better already!!!";
ACTION	act_health_up
{	SET		text_TxtMsg.STRING, str_health_up;
	CALL		a_ResetText;	
	PLAY_SOUND	snd_health_up,	1;
	ADD		sk_health,	15;
	SET		MY.INVISIBLE,		1;
	SET		MY.IF_NEAR,		NULL;
	ADD		sk_PowerupCnt,	1;
}
/////////////////////////////////////////////////
/////////////////////////////////////////////////
/////////////////////////////////////////////////
//spitballs
SOUND	snd_spitball_up, 	<cool2.wav>; //key pickup sound
BMAP 	map_spitball_up,	<BHorn.pcx>;

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
STRING str_spitballs_up,"Time for some Super Burps.";
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
/////////////////////////////////////////////////
/////////////////////////////////////////////////
//rband (rubber bands)
SOUND	snd_rband_up, 	<oohnice.wav>; //key pickup sound
BMAP 	map_rband_up01,	<MvBBL01.pcx>;
BMAP 	map_rband_up02,	<MvBBL02.pcx>;
BMAP 	map_rband_up03,	<MvBBL03.pcx>;

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
STRING str_rubberbands_up,"You picked up some antidote.";
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
STRING	str_rbandW_up,"This straw should work great 
with the antidote.";

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

/////////////////////////////////////////////////
/////////////////////////////////////////////////
/////////////////////////////////////////////////
//spit ball straw power up
//SOUND	snd_spitW_up, 	<sodacan.wav>; //key pickup sound
BMAP 	map_spitW_up,	<straw1.pcx>;

TEXTURE tex_spitW_up
{	SCALE_XY	32,32;
	BMAPS 		map_spitW_up;
	AMBIENT		.4;
}

THING	thi_spitW_up
{	TEXTURE		tex_spitW_up;
	DIST		5.0;
	IF_NEAR		act_spitW_up;
}
STRING	str_spitW_up,"You got the spit ball straw";
ACTION	act_spitW_up
{	SET		text_TxtMsg.STRING, str_spitW_up;
	CALL		a_ResetText;	
	//PLAY_SOUND	snd_spitW_up,	0.3;
	SET		MY.INVISIBLE,	1;
	SET		MY.IF_NEAR,	NULL;
	SET		IF_1,		a_InitFireBullet;
	ADD		sk_PowerupCnt,	1;
}
/////////////////////////////////////////////////
/////////////////////////////////////////////////
/////////////////////////////////////////////////
//megaphone up
//SOUND	snd_megaphoneW_up, 	<sodacan.wav>; //key pickup sound
BMAP 	map_megaphoneW_up,	<cup1.pcx>;

TEXTURE tex_megaphoneW_up
{	SCALE_XY	32,32;
	BMAPS 		map_megaphoneW_up;
	AMBIENT		.4;
}

THING	thi_megaphoneW_up
{	TEXTURE		tex_megaphoneW_up;
	DIST		5.0;
	IF_NEAR		act_megaphoneW_up;
}
STRING	str_megaphoneW_up,"You got the megaphone";
ACTION	act_megaphoneW_up
{	SET		text_TxtMsg.STRING, str_megaphoneW_up;
	CALL		a_ResetText;	
	//PLAY_SOUND	snd_megaphoneW_up,	0.3;
	SET		MY.INVISIBLE,	1;
	SET		MY.IF_NEAR,	NULL;
//	SET		IF_3,		a_InitMegaPhone;
	ADD		sk_PowerupCnt,	1;
}