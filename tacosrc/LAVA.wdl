//sound should be as long as it takes to die (4 frames)
SOUND	snd_Scream, 	<zshoot.wav>;
SOUND	snd_sticky,	<sticky.wav>;


//set this action as the if enter
ACTION	act_StartLDepreciateHealth	
{	SET		EACH_TICK.1,	act_LDepreciateHealth;
	PLAY_SOUND	snd_sticky,1;
}

ACTION	act_LDepreciateHealth		
{	ADD		sk_Health,	-5;
	FADE_PAL red_pal, 0.7;		// set hit palette	
	WAIT 2;
	//FADE_PAL red_pal, 0;		// set NORMAL palette	
}

ACTION	act_StopLDepreciateHealth	
{	SET		EACH_TICK.1,	NULL;
	FADE_PAL 	red_pal, 0;	
	SET		HERE.IF_LEAVE,	act_StopLDepreciateHealth;
}

//////////////////////////////////////////
// lava
//////////////////////////////////////////
BMAP 	lava_map	<slime.pcx>;

TEXTURE lava_tex {
	SCALE_XY	8,8;
	BMAPS 		lava_map;
	AMBIENT		.5;
	//SOUND	snd_sticky;
	//SVOL	1;
	//SDIST	5;
	//FLAGS	ONESHOT;
}

PALETTE	lava_pal {PALFILE <red.pcx>;}

ACTION lava_dive {
	SET RENDER_MODE,1;
	IF_EQUAL	underwater,1;		// Is the player already under lavar?
		END;				// then end
	SET	underwater,1;			// under lava from now on!
	FADE_PAL lava_pal, 0.7;			// set under lava palette	
	RULE	PLAYER_ARC = PLAYER_ARC + 0.3;	// change point of view
	RULE	my_size = my_size-0.3;		// Hysteresis
	RULE	PLAYER_SIZE = PLAYER_SIZE-0.3;
	RULE	PLAYER_Z = PLAYER_Z-0.3;
	CALL	set_diving;			//diving mode
}
ACTION lava_arise {
	SET RENDER_MODE,1;
	IF_EQUAL	underwater,0;		// Is the player already above lava?
		END;			
	SET	underwater,0;	
	FADE_PAL lava_pal, 0;			// switch off under lava palette		
	RULE	PLAYER_ARC = PLAYER_ARC - 0.3;	// normalize point of view
	RULE	my_size = my_size+0.3;		// Hysteresis
	RULE	PLAYER_SIZE = PLAYER_SIZE+0.3;
	RULE	PLAYER_Z = PLAYER_Z+0.3;
	CALL	take_breath;
	CALL	set_swimming;			// swimming mode
}	
REGION under_lava{
	FLOOR_HGT	-10;
	CEIL_HGT	2;
	FLOOR_TEX	stone02_tex;
	CEIL_TEX	lava_tex;
	CLIP_DIST	300;
	IF_ARISE 	lava_arise;
	IF_ENTER	act_StartLDepreciateHealth;
	IF_LEAVE	act_StopLDepreciateHealth;
}
REGION lava{
	FLOOR_HGT	2;
	CEIL_HGT	10;
	FLOOR_TEX	lava_tex;
	CEIL_TEX	brick05_tex;
	CLIP_DIST	300;
	BELOW		under_lava;
	IF_DIVE 	lava_dive;
	IF_ENTER	act_StartLDepreciateHealth;
	IF_LEAVE	act_StopLDepreciateHealth;
	AMBIENT		.1;
}