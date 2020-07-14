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


MAPFILE		<pibb.WMP>;
INCLUDE		<txtmsg.wdl>;

INCLUDE		<panels.wdl>;
INCLUDE		<move.wdl>;
INCLUDE		<walls.wdl>;
INCLUDE		<regions.wdl>;
INCLUDE		<lava.wdl>;
INCLUDE		<firetrap.wdl>;
INCLUDE		<Evildoor.wdl>;
INCLUDE		<Ekiddoor.wdl>;
INCLUDE		<doors.wdl>;
INCLUDE 	<things.wdl>;
INCLUDE		<LiftColu.wdl>;
INCLUDE		<Liftswit.wdl>;
INCLUDE		<Raft01.wdl>;
INCLUDE		<Raft02.wdl>;
INCLUDE		<Raft03.wdl>;
INCLUDE		<Raft04.wdl>;
INCLUDE		<powerup.wdl>;
INCLUDE		<MDoor.wdl>;
INCLUDE		<SCREWDRV.wdl>;
INCLUDE		<BOLTCUTR.wdl>;
INCLUDE		<TRAYDOOR.WDL>;
INCLUDE		<UTLCLOS.WDL>;
INCLUDE		<key01.WDL>;
INCLUDE		<key02.WDL>;
INCLUDE		<key03.WDL>;

INCLUDE		<FireBall.wdl>;
INCLUDE		<Flare.wdl>;
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

//INCLUDE		<debug.wdl>;	// debug panel
//INCLUDE		<adjust.wdl>;	// adjusting textures
INCLUDE		<inventor.wdl>;
MUSIC	song_midi,	<hallway.mid>;


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
	
	PLAY_SONG	song_midi,	1.5;
	SET		LAYERS.1,	NULL;
	SET		IF_ANYKEY,	NULL;
	SET		text_TxtMsg.STRING, 	str_Welcome;
	CALL		a_ResetText;
	CALL		a_InitFireBurp;
	SET		PLAYER_LIGHT, 		1;
	SET		sk_spitball,		0;	//MIKE
	SET		sk_RBand,		0;   	//MIKE

	SET		IF_0,			a_SelectFireBurp;
	SET		IF_1,			a_SelectFireBullet;
	//SET		IF_2,			a_InitFireRubberBand;
	//SET		IF_3,			a_InitMegaphone;
	//SET		IF_4,			a_InitFireFlameThrower;
	//SET		IF_5,			a_InitFireCrossBow;
	//SET		IF_R,			a_ReInit;
	SET		IF_TAB			a_InitMAP;
	//SET		IF_H,			act_MMHelp;
	SET		IF_N,			act_MMSelectNewGame;
	SET		IF_L,			act_MMSelectLoad;
	SET		IF_I,			act_start_Inventory;
	SET		IF_S,			act_MMSelectSave;
	SET		IF_V,			act_MMSelectResolution;
	//SET		IF_Q,			act_MMSelectQuit;
	
	SET		PANELS.1,		statusBar;
	SET		PANELS.15,		PibbFace01;
	SET		MESSAGES.2,		text_Health;
	SET		MESSAGES.3,		text_Spitballs;
	SET		MESSAGES.4,		text_RubberBands;
	BRANCH	set_walking;	
}
STRING str_Help, "0 No weapon	
1 Rubberbands
N New Game
L Load	
S Save	
Q Quit
V Video Mode";

STRING	str_GameLoaded,	"Your saved game was loaded";
STRING	str_NewGame,	"A new game was started";
STRING	str_GameSaved,	"Your game is saved";
STRING	str_Resolution, "Switching Video Mode";

ACTION	act_MMHelp
{	SET		text_TxtMsg.STRING, str_Help;
	CALL		a_ResetText;
}
ACTION act_MMSelectLoad	//load up a game and start it
{	SET		text_TxtMsg.STRING, str_GameLoaded;
	CALL		a_ResetText;
	
	LOAD	"saved",1;	
}	
ACTION act_MMSelectNewGame //load up original game and start it
{	SET		text_TxtMsg.STRING, str_NewGame;
	CALL		a_ResetText;
	
	LOAD	"origo",2;	
}
ACTION act_MMSelectSave //save the game
{	SET		text_TxtMsg.STRING, str_GameSaved;
	CALL		a_ResetText;
	
	SAVE	"saved",1;
}
SKILL sk_VidMode{VAL 0;}	

ACTION act_MMSelectResolution
{	SET		text_TxtMsg.STRING, str_Resolution;
	CALL		a_ResetText;

	IF_EQUAL	sk_VidMode,0;	GOTO hires;
	IF_EQUAL	sk_VidMode,1;	GOTO lowres;
lowres:
	//SET	SCREEN_WIDTH,	320;
	//SET	SCREEN_HGT,	400;
	//VIDEO		X320x400;
	SET		sk_VidMode,	1;
	END;
hires:
	//SET	SCREEN_WIDTH,	640;
	//SET	SCREEN_HGT,	480;
	//VIDEO		S640X480;
	SET		sk_VidMode,	0;
	END;
}

//ACTION act_MMSelectQuit
//{EXIT;}

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
	PLAY_SONG	song_midi,		1.5;
	SET	LAYERS.1,	ovl_SplashScreen;
	SET	IF_ANYKEY,  	start_me;
}

IF_START	Start_me;

ACTION	play_splash 	{PLAY_SOUND splash_snd,.5;}

SKILL FADE	{VAL 0;}

ACTION act_MMSelectQuit {
	SET		fade,0;
	WHILE  (fade<1) {
		RULE 	fade+=0.1;
		FADE_PAL	fade_pal,fade;
		WAIT	1;
	}
	FADE_PAL	fade_pal,1;
	EXIT	"Thanks for playing Mr. Pibb-The 3D Interactive Game.  (C) 1998, BrandGames.


";
}