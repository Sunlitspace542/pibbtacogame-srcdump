//Burp

BMAP  map_BurpBubbles01,		<ShotY01.pcx>;
BMAP  map_BurpBubbles02,		<ShotY02.pcx>;
BMAP  map_BurpBubbles03,		<ShotY03.pcx>;
BMAP  map_BurpBubbles04,		<ShotY04.pcx>;

TEXTURE tex_BurpTrail
{	SCALE_XY	32,32;
	SIDES		1;
	CYCLES		4;
	BMAPS		map_BurpBubbles01,map_BurpBubbles02,map_BurpBubbles03,map_BurpBubbles04;
	DELAY		1,1,1,1;
	AMBIENT		0.9;
}

SKILL	s_rhHeight	{}

ACTION a_BurpInit{	

	SET		MY.TEXTURE,	tex_BurpTrail;	
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
	SET		MY.EACH_TICK,	a_BurpGenerateSmokeTrail;
	SET		MY.EACH_CYCLE,	NULL;
	SET		MY.IF_HIT,	a_BurpExplodeInit;
}

ACTION a_BurpGenerateSmokeTrail
{	CALL	a_MoveWithGravity;}

ACTION a_BurpExplodeInit
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
//Burp Launcher
//////////////////////////////////////////////////////// 
SOUND	s_FireBurp,		<Burp.wav>;

OVLY	ov_BurpLauncher01,	<Mouth01.pcx>;
OVLY	ov_BurpLauncher02,	<Mouth02.pcx>;
OVLY	ov_BurpLauncher03,	<Mouth03.pcx>;
OVLY	ov_BurpLauncher04,	<Mouth04.pcx>;

OVERLAY ovl_BurpLauncher01	{POS_X 245;	POS_Y 25;	FLAGS ABSPOS;	OVLYS ov_BurpLauncher01;}
OVERLAY ovl_BurpLauncher02	{POS_X 245;	POS_Y 25;	FLAGS ABSPOS;	OVLYS ov_BurpLauncher02;}
OVERLAY ovl_BurpLauncher03	{POS_X 245;	POS_Y 25; 	FLAGS ABSPOS;	OVLYS ov_BurpLauncher03;}
OVERLAY ovl_BurpLauncher04	{POS_X 245;	POS_Y 25;	FLAGS ABSPOS;	OVLYS ov_BurpLauncher04;}

ACTION a_fireBurp
{
label_Fire_Loop:
	
	PLAY_SOUND	s_FireBurp,2;
	SET		LAYERS.13,		ovl_BurpLauncher01;
	SET		IF_CTRL,		NULL;
	SET		IF_LEFT,		NULL;
	ADD		PLAYER_LIGHT,	0.5;
	
	SET		SYN_tempInit,	a_BurpInit;
	CALL		a_InitTemp;
	WAIT		2;
	SET		LAYERS.13,		ovl_BurpLauncher02;
	ADD		PLAYER_LIGHT,	-0.5;
	WAIT		2;
	SET		LAYERS.13,		ovl_BurpLauncher03;
	WAIT		2;
	SET		LAYERS.13,		ovl_BurpLauncher04;
	WAIT		2;
	SET		LAYERS.13,		ovl_BurpLauncher03;
	WAIT		2;
	
	CALL		a_InitFireBurp;

	IF_EQUAL	KEY_CTRL,		1;
		GOTO	label_Fire_Loop;
	IF_EQUAL	MOUSE_LEFT,		1;
		GOTO	label_Fire_Loop;
}

SOUND	snd_Burpheadsup	<WtchOut1.wav>;

ACTION a_SelectFireBurp
{	PLAY_SOUND snd_Burpheadsup, 1;
	BRANCH a_InitFireBurp;
}
ACTION a_InitFireBurp
{
	SET		LAYERS.13,ovl_BurpLauncher01;
	SET		IF_CTRL,a_fireBurp;
	SET		IF_LEFT,a_fireBurp;
	SET		sk_currWeaponDamage, -1;	//Mike set damage value here
	END;
}