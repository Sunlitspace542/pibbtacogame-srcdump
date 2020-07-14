//RubberBand

BMAP  map_Bubbles01,		<BUBLS01.pcx>;
BMAP  map_Bubbles02,		<BUBLS02.pcx>;
BMAP  map_Bubbles03,		<BUBLS03.pcx>;
BMAP  map_Bubbles04,		<BUBLS04.pcx>;

TEXTURE tex_RubberBandTrail
{	SCALE_XY	65,65;
	SIDES		1;
	CYCLES		4;
	BMAPS		map_Bubbles01,map_Bubbles02,map_Bubbles03,map_Bubbles04;
	DELAY		2,2,2,2;
	AMBIENT		0.9;
}

SKILL	s_rhHeight		{}

ACTION a_RubberBandInit
{	
	SET		MY.TEXTURE,	tex_RubberBandTrail;	
	SET		MY.DIST,	0.0;
	SET		s_rhHeight,	PLAYER_Z;
	ADD		s_rhHeight,	-2.0;
	SET		MY.HEIGHT,	s_rhHeight;
	SET		MY.CAREFULLY,	1;
	DROP		MY;
	SET		MY.ANGLE,	PLAYER_ANGLE;

	SET		s_rLaunchSpeed,	5;
	CALL		a_LaunchProjectile;
	
	SET		MY.TARGET,	BULLET;	
	SET		MY.EACH_TICK,	a_RubberBandGenerateSmokeTrail;
	SET		MY.EACH_CYCLE,	NULL;
	SET		MY.IF_HIT,	a_RubberBandExplodeInit;
}

ACTION a_RubberBandGenerateSmokeTrail
{	//RULE	s_SmokeX =	MY.X - RANDOM;
	//RULE	s_SmokeY = 	MY.Y - RANDOM;
	//RULE 	s_SmokeZ =	MY.HEIGHT + 1.0;
	//CALL	a_GenerateSmoke;
	//RULE	s_SmokeX =	MY.X + RANDOM;
	//RULE	s_SmokeY = 	MY.Y + RANDOM;
	//RULE 	s_SmokeZ =	MY.HEIGHT + 1.0;
	//CALL	a_GenerateSmoke;
	//CALL	a_GenerateExplosion;
	CALL	a_MoveWithGravity;
}

ACTION a_RubberBandExplodeInit
{	SET	SHOOT_FAC,	10;
	SET	SHOOT_RANGE,	2;
	EXPLODE	MY;
	SET	MY.CAREFULLY,	0;
	SET	MY.IF_HIT,	NULL;

	SET	s_SmokeX,	MY.X;
	SET	s_SmokeY,	MY.Y;
	SET 	s_SmokeZ,	MY.HEIGHT;
	CALL	a_GenerateExplosion;
	CALL	a_TempDisapear;
}
 
////////////////////////////////////////////////////////
//RubberBand Launcher
//////////////////////////////////////////////////////// 
SOUND	s_RBang,			<Bubbles2.wav>;

OVLY	ov_RubberBandLauncher01,	<Strw01.pcx>;
OVLY	ov_RubberBandLauncher02,	<Strw02.pcx>;
OVLY	ov_RubberBandLauncher03,	<Strw03.pcx>;
OVLY	ov_RubberBandLauncher04,	<Strw04.pcx>;
OVLY	ov_RubberBandLauncher05,	<Strw05.pcx>;

OVERLAY ovl_RubberBandLauncher01	{POS_X 240;	POS_Y 0;	FLAGS ABSPOS;	OVLYS ov_RubberBandLauncher01;}
OVERLAY ovl_RubberBandLauncher02	{POS_X 240;	POS_Y 0;	FLAGS ABSPOS;	OVLYS ov_RubberBandLauncher02;}
OVERLAY ovl_RubberBandLauncher03	{POS_X 240;	POS_Y 0; 	FLAGS ABSPOS;	OVLYS ov_RubberBandLauncher03;}
OVERLAY ovl_RubberBandLauncher04	{POS_X 240;	POS_Y 0;	FLAGS ABSPOS;	OVLYS ov_RubberBandLauncher04;}
OVERLAY ovl_RubberBandLauncher05	{POS_X 240;	POS_Y 0;	FLAGS ABSPOS;	OVLYS ov_RubberBandLauncher05;}


SKILL	SK_RBand	{}
ACTION a_fireRubberBand
{
label_Fire_Loop:
	IF_BELOW	SK_RBand,	1;
		END;
	
	PLAY_SOUND	s_RBang,0.3,0.7;
	SET		LAYERS.13,		ovl_RubberBandLauncher01;
	ADD		SK_RBand,	-1;
	SET		IF_CTRL,		NULL;
	SET		IF_LEFT,		NULL;
	ADD		PLAYER_LIGHT,	0.5;
	
	SET		SYN_tempInit,	a_RubberBandInit;
	CALL		a_InitTemp;
	WAIT		2;
	SET		LAYERS.13,		ovl_RubberBandLauncher02;
	ADD		PLAYER_LIGHT,	-0.5;
	WAIT		2;
	SET		LAYERS.13,		ovl_RubberBandLauncher03;
	WAIT		2;
	SET		LAYERS.13,		ovl_RubberBandLauncher04;
	WAIT		2;
	
	CALL		a_InitFireRubberBand;

	IF_EQUAL	KEY_CTRL,		1;
		GOTO	label_Fire_Loop;
	IF_EQUAL	MOUSE_LEFT,		1;
		GOTO	label_Fire_Loop;
}

SOUND	snd_headsup	<headsup.wav>;

ACTION a_SelectFireRubberBand
{	PLAY_SOUND snd_headsup, 1;
	BRANCH a_InitFireRubberBand;
}
ACTION a_InitFireRubberBand
{	IF_BELOW	SK_RBand,	1;	BRANCH a_InitFireBullet;

	SET		LAYERS.13,ovl_RubberBandLauncher01;
	SET		IF_CTRL,a_fireRubberBand;
	SET		IF_LEFT,a_fireRubberBand;
	SET		sk_currWeaponDamage, -4;	//Mike set damage value here
	END;
}