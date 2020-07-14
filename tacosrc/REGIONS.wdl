//////////////////////////////////////////
// R E G I O N S
//////////////////////////////////////////
BMAP	CEILING02_MAP	<ceiling2.pcx>;
BMAP	floor01_MAP	<floor.pcx>;

TEXTURE ceiling02_tex {
	SCALE_XY	16,16;
	BMAPS 		ceiling02_map;
}
TEXTURE floor01_tex {
	SCALE_XY	16,16;
	BMAPS 		floor01_map;
}
REGION Hallway {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	floor01_tex;
	CEIL_TEX	ceiling02_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	AMBIENT		-.3;
}
//////////////////////////////////////////
BMAP	Ceiling01_MAP	<Ceiling1.pcx>;
BMAP	tile_MAP	<tile.pcx>;

TEXTURE tile_tex {
	SCALE_XY	16,16;
	BMAPS 		tile_map;
}

TEXTURE Ceiling01_tex {
	SCALE_XY	25.6,25.6;
	BMAPS 		Ceiling01_map;
}

REGION Hallway2 {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	tile_tex;
	CEIL_TEX	ceiling01_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	AMBIENT		-.3;
}
//////////////////////////////////////////
REGION Pool {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	tile_tex;
	CEIL_TEX	ceiling01_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	//AMBIENT		.3;
}
//////////////////////////////////////////
REGION PibbMachine {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	black_tex;
	CEIL_TEX	ceiling01_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	AMBIENT		.3;
}
//////////////////////////////////////////

REGION countertop2 {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	cafwall_tex;
	CEIL_TEX	ceiling01_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	//AMBIENT		.3;
}
//////////////////////////////////////////
REGION MetalFloor{
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	Metal1_tex;
	CEIL_TEX	Brick05_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	//AMBIENT		.1;
}
//////////////////////////////////////////
REGION WhiteFloor {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	WhiteWall_tex;
	CEIL_TEX	ceiling01_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	//AMBIENT		.1;
}
//////////////////////////////////////////
//BMAP	countertop_MAP	<traytop.pcx>;

//TEXTURE countertop_tex {
	//SCALE_XY	8,8;
	//BMAPS 		countertop_map;
//}
REGION countertop {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	wHITEwALL_tex;
	CEIL_TEX	ceiling01_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	//AMBIENT		.3;
}

//////////////////////////////////////////
//MUSIC	mus_DeathMusic		<Death.mid>;
//MUSIC	mus_BasementMusic	<Basement.mid>;

//ACTION	act_DeathMusic		{PLAY_SONG,	mus_DeathMusic,1.5;}
//ACTION	act_BasementMusic	{PLAY_SONG,	mus_BasementMusic,1.5;}

REGION DrEvilsLair {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	stone02_tex;
	CEIL_TEX	brick05_tex;
	CEIL_OFFS_X	86;	
	CEIL_OFFS_Y	78;
	FLOOR_OFFS_X	122;
	FLOOR_OFFS_Y	78;
//	IF_ENTER	act_DeathMusic;
//	IF_LEAVE	act_BasementMusic;
	AMBIENT		0;
}
//////////////////////////////////////////
SOUND	snd_whatthe		<WhatThe.wav>;
ACTION	act_WhatThe	{PLAY_SOUND,	snd_whatthe,1;}

REGION SecretWalls {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	stone02_tex;
	CEIL_TEX	brick05_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	AMBIENT		-.1;
	IF_ENTER	act_WhatThe;
	IF_LEAVE	act_WhatThe;
}
//////////////////////////////////////////

REGION BasementMusic {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	stone02_tex;
	CEIL_TEX	brick05_tex;
	CEIL_OFFS_X	86;	
	CEIL_OFFS_Y	78;
	FLOOR_OFFS_X	122;
	FLOOR_OFFS_Y	78;
//	IF_ENTER	act_BasementMusic;
	//AMBIENT		.3;
}
//////////////////////////////////////////
REGION AllBrick {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	stone02_tex;
	CEIL_TEX	brick05_tex;
	CEIL_OFFS_X	86;	
	CEIL_OFFS_Y	78;
	FLOOR_OFFS_X	122;
	FLOOR_OFFS_Y	78;
	//AMBIENT		.3;
}
//////////////////////////////////////////
REGION AllBrick2 {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	brick2_tex;
	CEIL_TEX	brick2_tex;
	CEIL_OFFS_X	86;	
	CEIL_OFFS_Y	78;
	FLOOR_OFFS_X	122;
	FLOOR_OFFS_Y	78;
	//AMBIENT		.3;
}
//////////////////////////////////////////

REGION Duct {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	alum1_tex;
	CEIL_TEX	station1_tex;
	CEIL_OFFS_X	86;	
	CEIL_OFFS_Y	78;
	FLOOR_OFFS_X	122;
	FLOOR_OFFS_Y	78;
	IF_ENTER	act_crouch;
	IF_LEAVE	act_stand;
	AMBIENT		-.5;
}
ACTION	act_crouch	{set my_size, 3;  set jump_size, .2;}
ACTION	act_stand	{set my_size, 4;  set jump_size, 2;}

//////////////////////////////////////////
REGION Doorway {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	floor01_tex;
	CEIL_TEX	black_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	FLAGS		FLOOR_LIFTED;
	AMBIENT		-.1;
}
//////////////////////////////////////////

REGION basement_DoorWay {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	stone02_tex;
	CEIL_TEX	metal1_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	FLAGS		FLOOR_LIFTED;
	AMBIENT		0;
}
//////////////////////////////////////////
REGION basement_hall {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	stone02_tex;
	CEIL_TEX	brick05_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	AMBIENT		-.1;
}
//////////////////////////////////////////
REGION AllBrick_Ramp {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	BRICK2_tex;
	CEIL_TEX	BRICK2_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	//AMBIENT		.1;
	FLAGS		FLOOR_LIFTED;
}
//////////////////////////////////////////
REGION ramp {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	stone02_tex;
	CEIL_TEX	brick05_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	//AMBIENT		.3;
	FLAGS		FLOOR_LIFTED;
}
//////////////////////////////////////////
TEXTURE tdesktop_tex {
	SCALE_XY	8,8;
	BMAPS 		tdesk_map;
}
REGION teacher_desk {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	tdesktop_tex;
	CEIL_TEX	ceiling01_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	//AMBIENT		.3;
}
//////////////////////////////////////////
REGION cabinet {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	black_tex;
	CEIL_TEX	ceiling01_tex;
	CEIL_OFFS_X	2;	
	CEIL_OFFS_Y	68;
	//AMBIENT		.3;
}
//////////////////////////////////////////
// DARK ROOM
//////////////////////////////////////////

PALETTE	red_pal {PALFILE <red.pcx>;}
ACTION enter_darkroom {
	FADE_PAL red_pal, 0.7;			// set darkroom palette	
}
ACTION exit_darkroom {
	FADE_PAL red_pal, 0;			// turn off darkroom palette	
}
REGION darkromm{
	FLOOR_HGT	1;
	CEIL_HGT	25;
	FLOOR_TEX	floor01_tex;
	CEIL_TEX	ceiling01_tex;
	CLIP_DIST	300;
	IF_ENTER	enter_darkroom;
	IF_LEAVE	exit_darkroom;
}
//////////////////////////////////////////
// POOL
//////////////////////////////////////////
//SOUND	bubbles_snd,	<bubbles.wav>;
SOUND	breath_snd,	<breath.wav>;
SOUND	splash_snd,	<water.wav>;

PALETTE	blue_pal {PALFILE <blue.bbm>;}

ACTION water_dive {
	SET RENDER_MODE,1;
	IF_EQUAL	underwater,1;		// Is the player already underwater?
		END;				// then end
	SET	underwater,1;			// underwater from now on!
	FADE_PAL blue_pal, 0.7;			// set underwater palette	
	RULE	PLAYER_ARC = PLAYER_ARC + 0.3;	// change point of view
	RULE	my_size = my_size-0.3;		// Hysteresis
	RULE	PLAYER_SIZE = PLAYER_SIZE-0.3;
	RULE	PLAYER_Z = PLAYER_Z-0.3;
	CALL	set_diving;			//diving mode
}
ACTION take_breath {PLAY_SOUND breath_snd,.25;}
ACTION	play_splash {PLAY_SOUND splash_snd,.3;}

ACTION water_arise {
	SET RENDER_MODE,1;
	IF_EQUAL	underwater,0;		// Is the player already above water?
		END;			
	SET	underwater,0;	
	FADE_PAL blue_pal, 0;			// switch off underwater palette		
	RULE	PLAYER_ARC = PLAYER_ARC - 0.3;	// normalize point of view
	RULE	my_size = my_size+0.3;		// Hysteresis
	RULE	PLAYER_SIZE = PLAYER_SIZE+0.3;
	RULE	PLAYER_Z = PLAYER_Z+0.3;
	CALL	take_breath;
	CALL	set_swimming;			// swimming mode
}	
////////////////////////////////////////
BMAP	water_MAP	<water.pcx>;
TEXTURE water_tex {
	SCALE_XY	8,8;
	BMAPS 		water_map;
	AMBIENT		1;
}
REGION under_water{
	FLOOR_HGT	-10;
	CEIL_HGT	1;
	FLOOR_TEX	temp_tex;
	CEIL_TEX	water_tex;
	CLIP_DIST	300;
	IF_ARISE 	water_arise;
	IF_ENTER	play_splash;
}
REGION water{
	FLOOR_HGT	1;
	CEIL_HGT	25;
	FLOOR_TEX	water_tex;
	CEIL_TEX	temp_tex;
	CLIP_DIST	300;
	BELOW		under_water;
	IF_DIVE 	water_dive;
	IF_ENTER	play_splash;
	AMBIENT		0;
}

//////////////////////////////////////////
// POOL2
//////////////////////////////////////////
REGION under_water2{
	FLOOR_HGT	-13;
	CEIL_HGT	-4;
	FLOOR_TEX	brick05_tex;
	CEIL_TEX	water_tex;
	CLIP_DIST	300;
	IF_ARISE 	water_arise;
	IF_ENTER	play_splash;
}
REGION water2{
	FLOOR_HGT	-4;
	CEIL_HGT	10;
	FLOOR_TEX	water_tex;
	CEIL_TEX	brick05_tex;
	CLIP_DIST	300;
	BELOW		under_water2;
	IF_DIVE 	water_dive;
	IF_ENTER	play_splash;
	AMBIENT		0;
}
REGION fountain{
	FLOOR_HGT	-4;
	CEIL_HGT	10;
	FLOOR_TEX	water_tex;
	CEIL_TEX	ceiling01_tex;
	CLIP_DIST	300;
	BELOW		under_water2;
	IF_DIVE 	water_dive;
	IF_ENTER	play_splash;
	AMBIENT		0;
}
//////////////////////////////////////////
// BRIDGE
//////////////////////////////////////////
REGION under_bridge{
	FLOOR_HGT	2;
	CEIL_HGT	16.5;
	FLOOR_TEX	tile_tex;
	CEIL_TEX	tile_tex;
	CLIP_DIST	300;
}
REGION bridge{
	FLOOR_HGT	13;
	CEIL_HGT	15;
	FLOOR_TEX	floor01_tex;
	CEIL_TEX	ceiling01_tex;
	CLIP_DIST	300;
	BELOW		under_bridge;
}
//////////////////////////////////////////
REGION border {
	FLOOR_HGT	40;
	CEIL_HGT	40;
	FLOOR_TEX	temp_tex;
	CEIL_TEX	temp_tex;
	CLIP_DIST	0;	// to accelerate rendering
}
REGION black {
	FLOOR_HGT	0;
	CEIL_HGT	10;
	FLOOR_TEX	floor01_tex;
	CEIL_TEX	floor01_tex;
	//AMBIENT		.3;
}
//////////////////////////////////////////