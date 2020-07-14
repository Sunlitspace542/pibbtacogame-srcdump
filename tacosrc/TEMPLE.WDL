///////////////////////////////////////////////
// Minimal-Level
///////////////////////////////////////////////
//VIDEO		S640X480;
VIDEO		X320x400;
//VIDEO		320x200;

SKILL	ResMode {VAL 0;}

LIGHT_ANGLE	.5;
PATH		"art";
PATH		"audio";
PATH		"weapon";
PATH		"speech";

SKILL	sk_health 		{VAL	100; MIN 0; MAX 200;}
SKILL	sk_currWeaponDamage 	{VAL	-1;}
SKILL	sk_spitball		{VAL	100;}
SKILL	sk_RBand		{VAL	100;}
SKILL	sk_jello 		{VAL	100;}
SKILL	sk_pudding 		{VAL	100;}
SKILL	sk_EKiddooropened 	{VAL	0;}

SKILL	sk_ZombieKills		{VAL	0;}
SKILL	sk_FriendKills		{VAL	0;}
SKILL	sk_PowerupCnt		{VAL	0;}
SKILL	sk_score		{VAL 	0;MIN 0;MAX 100;}

MAPFILE		<Temple.WMP>;
INCLUDE		<txtmsg.wdl>;

INCLUDE		<PANELS.wdl>;
INCLUDE		<MOVE.wdl>;
INCLUDE		<WALLS.wdl>;
INCLUDE		<REGIONS.wdl>;
INCLUDE		<LAVA.wdl>;
INCLUDE		<firetrap.wdl>;
INCLUDE		<Evildoor.wdl>;
INCLUDE		<Ekiddoor.wdl>;
INCLUDE		<DOORS.wdl>;
INCLUDE 	<THINGS.wdl>;
INCLUDE		<LiftColu.wdl>;
INCLUDE		<Liftswit.wdl>;

//INCLUDE		<Raft01.wdl>;
//INCLUDE		<Raft02.wdl>;
//INCLUDE		<Raft03.wdl>;
//INCLUDE		<Raft04.wdl>;

INCLUDE		<POWERUP.wdl>;
INCLUDE		<MDOOR.wdl>;
INCLUDE		<SCREWDRV.wdl>;
INCLUDE		<BOLTCUTR.wdl>;
INCLUDE		<TRAYDOOR.WDL>;
INCLUDE		<UTLCLOS.WDL>;
INCLUDE		<key01.WDL>;
INCLUDE		<key02.WDL>;
INCLUDE		<key03.WDL>;

INCLUDE		<FireBall.wdl>;
INCLUDE		<DrEvil.wdl>;
INCLUDE		<zkid.wdl>;
INCLUDE		<zombie.wdl>;
INCLUDE		<temps.wdl>;
INCLUDE		<traject.wdl>;
INCLUDE		<smoke.wdl>;
INCLUDE		<explode.wdl>;
INCLUDE		<toygun.wdl>;
INCLUDE		<RBand.wdl>;
INCLUDE		<BurpGun.wdl>;

//INCLUDE		<pibbbomb.wdl>;

INCLUDE		<menu.wdl>;
//INCLUDE		<Halllite.wdl>;

//INCLUDE		<debug.wdl>;	// debug panel
//INCLUDE		<adjust.wdl>;	// adjusting textures

//MUSIC	song_midi,	<Hallway.mid>;

////////////////////////////////////////////////
//  PALETTES
////////////////////////////////////////////////
PALETTE	fade_pal {PALFILE <blackpal.pcx>;}
PALETTE pal1 {	PALFILE <vrpal.pcx>;
	RANGE 2,254;

FLAGS	autorange,blur;}

SKILL underwater {VAL 0;}

////////////////////////////////////////////////
//  ACTIONS
////////////////////////////////////////////////
ACTION	a_InitNoWeapon
{	SET			LAYERS.13,		NULL;
	SET			IF_CTRL,		NULL;
	SET			IF_LEFT,		NULL;
}

SKILL	MapStatus {VAL 0;}
SOUND	Map_snd	<AlphaBee.wav>;

ACTION	a_InitMap{
	IF_EQUAL 	MapStatus, 1; GOTO TurnMapOff;
	PLAY_SOUND,	Map_snd,1;
	SET	MAP_MODE,	.5;
	SET	MAP_SCALE,	3.5;
	SET	MapStatus,	1;	
	SET 	MAP_ROT,	1;
	SET	COLOR_PLAYER	177;
	SET	COLOR_ACTORS	167;
	END;
TurnMapOff:
	PLAY_SOUND,		Map_snd,1;
	SET 	MAP_MODE,	NULL;
	SET	MAPStatus, 	0;
}

ACTION start_me {
	//FADE_PAL	pal1,1;
	//SET		LAYERS.1,	NULL;
	SET		IF_SPACE,	NULL;
	SET		text_TxtMsg.STRING, 	str_Welcome;
	CALL		a_ResetText;
	CALL		a_InitFireBurp;
	SET		PLAYER_LIGHT, 		1;
	SET		sk_spitball,		0;	//MIKE
	SET		sk_RBand,		0;   	//MIKE

	SET		IF_0,			a_SelectFireBurp;
	SET		IF_1,			a_SelectFireBullet;
	SET		IF_TAB			a_InitMAP;
	//SET		IF_2,			a_InitFireRubberBand;
	//SET		IF_R,			a_ReInit;
	//SET		IF_H,			act_MMHelp;
	//SET		IF_Q,			act_MMSelectQuit;
	
	SET		PANELS.1,		statusBar;
	SET		PANELS.15,		PibbFace01;
	SET		MESSAGES.2,		text_Health;
	SET		MESSAGES.3,		text_Spitballs;
	SET		MESSAGES.4,		text_RubberBands;
	BRANCH	set_walking;	
}

ACTION a_ReInit
{	SET		sk_spitball ,		100;
	SET		sk_Health ,		5;
	SET		sk_RBand ,		50;
	SET		IF_1,			a_SelectFireBullet;
	SET		IF_2,			a_SelectFireRubberBand;
	CALL		set_moving;
	SET		PANELS.16,	NULL;
}

///////////////////////////////
// Splash Screen
///////////////////////////////
OVLY	ov_SplashScreen,	<Splash.pcx>;
OVERLAY ovl_SplashScreen{POS_X 0;POS_Y 0;FLAGS ABSPOS;OVLYS ov_SplashScreen;}


ACTION	SplashWelcome {
	FADE_PAL	splash_pal,1;
	//PLAY_SONG	song_midi,		1.5;
	SET	LAYERS.1,	ovl_SplashScreen;
	SET	IF_SPACE,  	act_SplashFade;
}
ACTION	play_splash 	{PLAY_SOUND splash_snd,.5;}

//////////////////////////////////////////////////
// Fade Down from splash screen and Up on game
//////////////////////////////////////////////////
SKILL FADE	{VAL 0;}

ACTION act_SplashFade {
	PLAY_SOUND	click,1;
	SET		fade,0;
	WHILE  (fade<1) {
		RULE 	fade+=0.1;
		FADE_PAL	fade_pal,fade;
		WAIT	1;
	}
	FADE_PAL	fade_pal,1;
	WAIT	5;
	SET	LAYERS.1,	NULL;
	BRANCH act_GameFadeUp;
}
ACTION act_GameFadeUp {
	SET		fade,0;
	WHILE  (fade<1) {
		RULE 	fade+=0.1;
		FADE_PAL	pal1,fade;
		WAIT	1;
	}
	FADE_PAL	pal1,1;
	WAIT	5;
	BRANCH start_me;
}

//////////////////////////////////////////////
// End of game fade
//////////////////////////////////////////////
ACTION act_MMSelectQuit {
	SET		fade,0;
	WHILE  (fade<1) {
		RULE 	fade+=0.1;
		FADE_PAL	fade_pal,fade;
		WAIT	1;
	}
	FADE_PAL	fade_pal,1;
	EXIT	"Thanks for playing the Tasty Temple Challenge.


";
}

IF_START	SplashWelcome;	
