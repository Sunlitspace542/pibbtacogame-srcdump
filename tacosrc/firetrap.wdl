 //sound should be as long as it takes to die (4 frames)
SOUND	snd_FScream, <zshoot.wav>;
SOUND	snd_FLAME, <Flame.wav>;


BMAP map_Fire01	<flame03.pcx>;
BMAP map_Fire02	<flame05.pcx>;
BMAP map_Fire03	<flame07.pcx>;
BMAP map_Fire04	<flame09.pcx>;
BMAP map_Fire05	<flame11.pcx>;

TEXTURE tex_Fire {
	SCALE_XY	30,14;
	CYCLES		5;
	BMAPS 		map_Fire01,map_Fire02,map_Fire03,map_Fire04,map_Fire05;
	AMBIENT		.5;
	SDIST 		20;
	SVOL		1;
	SOUND		snd_Flame;
	FLAGS		SLOOP;
}
//place these things where you want the fire to appear
//this is the intermittant fire
THING	thi_FireIntermittant
{	TEXTURE 	tex_Fire;
	FLAGS		PASSABLE;
}

//this is the constant fire
THING	thi_FireConstant
{	TEXTURE 	tex_Fire;
	FLAGS		PASSABLE;
}

REGION reg_FireTrapConstant
{
	FLOOR_HGT	-10;
	CEIL_HGT	2;
	FLOOR_TEX	black_tex;
	CEIL_TEX	alum1_tex;
	CLIP_DIST	300;
	EACH_TICK	act_FireTimer2;		
	//IF_ENTER	act_StartFDepreciateHealth;
	//IF_LEAVE	act_StopFDepreciateHealth;
}

REGION reg_FireTrapIntermittant
{
	FLOOR_HGT	-10;
	CEIL_HGT	2;
	FLOOR_TEX	black_tex;
	CEIL_TEX	alum1_tex;
	CLIP_DIST	300;
	EACH_TICK	act_FireTimer;	
}

//set this action as the if enter

ACTION	act_StartFDepreciateHealth	
{	SET		HERE.EACH_TICK,		act_FDepreciateHealth;
	SET		HERE.IF_LEAVE,		act_StopFDepreciateHealth;
	PLAY_SOUND	snd_FScream, 		0.4;
}
ACTION	act_FDepreciateHealth		
{	ADD		sk_Health,		-5;//Mike: amount of health to subtract per frame
	PLAY_SOUND	snd_FScream, 		1;
}
ACTION	act_StopFDepreciateHealth	
{	SET		HERE.EACH_TICK,		NULL;
	SET		HERE.IF_LEAVE,		act_StopFDepreciateHealth;
}

////////////////////////////////
SKILL sk_FireOn 	{VAL 0;}
SKILL sk_FireTimer 	{VAL 0;}

ACTION	act_FireTimer
{	ADD		sk_FireTimer,		1;
	IF_EQUAL	sk_FireOn,		1;	GOTO	fireon;
	IF_EQUAL	sk_FireOn,		0;	GOTO	fireoff;
	END;
fireon:
	IF_BELOW	sk_FireTimer,		50;	//mike: time for fire on
		GOTO	ondo;
	SET	sk_FireTimer,		0;	
	SET	sk_FireOn,		0;
ondo:
	SET		thi_FireIntermittant.INVISIBLE, 	0;	
	IF_EQUAL	HERE,			reg_FireTrapIntermittant;
			GOTO firetouch;
	END;
firetouch:
	PLAY_SOUND	snd_FScream,	1;
	ADD		sk_Health,	-3;	//Mike: amount of health to subtract per frame
	FADE_PAL red_pal, 0.7;			// set hit palette	
	WAIT	3;			
	FADE_PAL red_pal, 0;			// set NORMAL palette	
fireoff:
	IF_BELOW	sk_FireTimer,		50;//mike: time for fire off
		GOTO	offdo;
	SET	sk_FireTimer,		0;	
	SET	sk_FireOn,		1;
offdo:
	SET		thi_FireIntermittant.INVISIBLE, 	1;
}

////////////////////
SKILL sk_FireOn2 	{VAL 0;}
SKILL sk_FireTimer2 	{VAL 0;}

ACTION	act_FireTimer2
{	ADD		sk_FireTimer2,		1;
	IF_EQUAL	sk_FireOn2,		1;	GOTO	fireon;
	IF_EQUAL	sk_FireOn2,		0;	GOTO	fireoff;
	END;
fireon:
	IF_BELOW	sk_FireTimer2,		50;//mike: time for fire on
		GOTO	ondo;
	SET	sk_FireTimer2,		0;	
	SET	sk_FireOn2,		0;
ondo:
	SET		thi_FireConstant.INVISIBLE, 	0;	
	IF_EQUAL	HERE,			reg_FireTrapConstant;
		GOTO firetouch;
	END;
firetouch:
	PLAY_SOUND	snd_FScream,	1;
	ADD		sk_Health,	-3;	//Mike: amount of health to subtract per frame
	FADE_PAL red_pal, 0.7;			// set hit palette	
	WAIT	3;			
	FADE_PAL red_pal, 0;			// set NORMAL palette	

fireoff:
	IF_BELOW	sk_FireTimer2,		5;//mike: time for fire off
		GOTO	offdo;
	SET	sk_FireTimer2,		0;	
	SET	sk_FireOn2,		1;
offdo:
	SET		thi_FireConstant.INVISIBLE, 	1;
}
