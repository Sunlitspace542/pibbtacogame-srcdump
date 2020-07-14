//Bullet

BMAP  map_BulletBubbles01,		<Super01.pcx>;
BMAP  map_BulletBubbles02,		<Super02.pcx>;
BMAP  map_BulletBubbles03,		<Super03.pcx>;
BMAP  map_BulletBubbles04,		<Super04.pcx>;

TEXTURE tex_BulletTrail
{	SCALE_XY	16,16;
	SIDES		1;
	CYCLES		4;
	BMAPS		map_BulletBubbles01,map_BulletBubbles02,map_BulletBubbles03,map_BulletBubbles04;
	AMBIENT		0.9;
}

SKILL	s_rhHeight		{}

ACTION a_BulletInit
{	
	SET		MY.TEXTURE,	tex_BulletTrail;	
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
	SET		MY.EACH_TICK,	a_BulletGenerateSmokeTrail;
	SET		MY.EACH_CYCLE,	NULL;
	SET		MY.IF_HIT,	a_BulletExplodeInit;
}

ACTION a_BulletGenerateSmokeTrail
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

ACTION a_BulletExplodeInit
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
//Bullet Launcher
//////////////////////////////////////////////////////// 
SOUND	s_FireBullet,			<Burp2.wav>;

OVLY	ov_BulletLauncher01,	<BM01.pcx>;
OVLY	ov_BulletLauncher02,	<BM02.pcx>;
OVLY	ov_BulletLauncher03,	<BM03.pcx>;
OVLY	ov_BulletLauncher04,	<BM04.pcx>;

OVERLAY ovl_BulletLauncher01	{POS_X 215;	POS_Y 10;	FLAGS ABSPOS;	OVLYS ov_BulletLauncher01;}
OVERLAY ovl_BulletLauncher02	{POS_X 215;	POS_Y 10;	FLAGS ABSPOS;	OVLYS ov_BulletLauncher02;}
OVERLAY ovl_BulletLauncher03	{POS_X 215;	POS_Y 10; 	FLAGS ABSPOS;	OVLYS ov_BulletLauncher03;}
OVERLAY ovl_BulletLauncher04	{POS_X 215;	POS_Y 10;	FLAGS ABSPOS;	OVLYS ov_BulletLauncher04;}

ACTION a_fireBullet
{
label_Fire_Loop:
	IF_BELOW	sk_spitball,	1;
		END;	
	ADD		sk_spitball,	-1;
	
	PLAY_SOUND	s_FireBullet,2;
	SET		LAYERS.13,		ovl_BulletLauncher01;
	SET		IF_CTRL,		NULL;
	SET		IF_LEFT,		NULL;
	ADD		PLAYER_LIGHT,	0.5;
	
	SET		SYN_tempInit,	a_BulletInit;
	CALL		a_InitTemp;
	WAIT		2;
	SET		LAYERS.13,		ovl_BulletLauncher02;
	ADD		PLAYER_LIGHT,	-0.5;
	WAIT		2;
	SET		LAYERS.13,		ovl_BulletLauncher03;
	WAIT		2;
	SET		LAYERS.13,		ovl_BulletLauncher04;
	WAIT		2;
	SET		LAYERS.13,		ovl_BulletLauncher03;
	WAIT		2;
	
	CALL		a_InitFireBullet;

	IF_EQUAL	KEY_CTRL,		1;
		GOTO	label_Fire_Loop;
	IF_EQUAL	MOUSE_LEFT,		1;
		GOTO	label_Fire_Loop;
}

SOUND	snd_Bulletheadsup	<OhYeah.wav>;

ACTION a_SelectFireBullet
{	PLAY_SOUND snd_Bulletheadsup, 1;
	BRANCH a_InitFireBullet;
}
ACTION a_InitFireBullet
{	IF_BELOW	sk_spitball,	1;	BRANCH a_InitFireBurp;
	SET		LAYERS.13,ovl_BulletLauncher01;
	SET		IF_CTRL,a_fireBullet;
	SET		IF_LEFT,a_fireBullet;
	SET		sk_currWeaponDamage, -2;	//Mike set damage value here
	END;
}