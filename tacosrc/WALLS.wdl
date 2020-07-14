//////////////////////////////////////////////////
/// W A L L S
//////////////////////////////////////////////////
BMAP	WhiteWall_MAP,	<wall02.pcx>,0,0,64,64;

TEXTURE WhiteWall_tex {
	SCALE_XY	16,16;
	BMAPS 		WhiteWall_map;
}
Wall	WhiteWall{
	TEXTURE	WhiteWall_tex;
	FLAGS	PORTCULLIS;
}
/////////////////////////////////////////////////
BMAP	Column01_MAP	<Column01.pcx>;
TEXTURE Column01_tex {
	SCALE_XY	21.7,23.5;
	//ALBEDO		1;
	AMBIENT		.3;
	BMAPS 		Column01_map;}
WALL Column01_wall {
	TEXTURE	Column01_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP	metal1_MAP	<wall5c.pcx>;
TEXTURE metal1_tex {
	SCALE_XY	90.2,128;	//used to be 32,32
	ALBEDO		.3;
	BMAPS 		metal1_map;}
WALL metal1_wall {
	TEXTURE	metal1_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP	brick05_MAP	<BRICK05.pcx>;
TEXTURE brick05_tex {
	SCALE_XY	16,16;
	BMAPS 		brick05_map;}
WALL brick05_wall {
	TEXTURE	brick05_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP	brick05_secret_MAP	<WALL5A.pcx>;
SOUND	secretdoor_snd,	<this2.wav>;

TEXTURE brick05_secret_tex {
	SCALE_XY	25.6,25.6;
	SOUND	secretdoor_snd;
	SCYCLE	1;
	FLAGS	SLOOP;
	SVOL	2;
	SDIST	20;	
	BMAPS 	brick05_secret_map;
}
STRING str_SecretWall, "Hmmm, these walls look kinda weird.";

ACTION SecretWall_message{
	SET	text_TxtMsg.STRING, str_SecretWall;
	CALL	a_ResetText;
}
WALL brick05_secret_wall {
	TEXTURE	brick05_secret_tex;
	DIST	10;
	FLAGS	PASSABLE,PORTCULLIS;
	IF_NEAR SecretWall_message;
}
//////////////////////////////////////////////////
BMAP	stone02_MAP	<stone02.pcx>;
TEXTURE stone02_tex {
	SCALE_XY	32,32;
	BMAPS 		stone02_map;}
WALL stone02_wall {
	TEXTURE	stone02_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP	fnkydr_MAP	<fnkydr.pcx>;
TEXTURE fnkydr_tex {
	SCALE_XY	16,18.3;
	BMAPS 		fnkydr_map;}
WALL fnkydr_wall {
	TEXTURE	fnkydr_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP	lkdoor_MAP	<lkdoor.pcx>;
TEXTURE lkdoor_tex {
	SCALE_XY	42,42;
	BMAPS 		lkdoor_map;}
WALL lkdoor_wall {
	TEXTURE	lkdoor_tex;
	FLAGS	TRANSPARENT,PORTCULLIS;
}
//////////////////////////////////////////////////

BMAP	poolwall_MAP	<wall02.pcx>;
TEXTURE poolwall_tex {
	SCALE_XY	6.5,6.5;
	BMAPS 		poolwall_map;}
WALL poolwall_wall {
	TEXTURE	poolwall_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP	Pool_NoTrim_MAP,	<wall02.pcx>,0,40,64,64;

TEXTURE Pool_NoTrim_tex {
	SCALE_XY	10,4.4;
	BMAPS 		Pool_NoTrim_map;
}
Wall	Pool_NoTrim{
	TEXTURE	Pool_NoTrim_tex;
	FLAGS	PORTCULLIS;
}
/////////////////////////////////////////////////
BMAP	Pool_NoTrim2_MAP,	<wall02.pcx>,0,20,64,64;

TEXTURE Pool_NoTrim2_tex {
	SCALE_XY	10,5.6;
	BMAPS 		Pool_NoTrim2_map;
}
Wall	Pool_NoTrim2{
	TEXTURE	Pool_NoTrim2_tex;
	FLAGS	PORTCULLIS;
}
/////////////////////////////////////////////////
BMAP  alum1_map,	<alum1.pcx>;	
TEXTURE alum1_tex {
	SCALE_XY	32,32;
	ALBEDO		1;
	BMAPS 		alum1_map;
	AMBIENT		.3;
}

WALL alum1_wall {
	TEXTURE	alum1_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////

BMAP  station1_map,	<station1.pcx>;	

TEXTURE station1_tex {
	SCALE_XY	24.5,24.5;
	BMAPS 		station1_map;}

WALL station1_wall {
	TEXTURE	station1_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP Wall05_map,	<WALL5.pcx>;	
TEXTURE Wall05_tex {
	SCALE_XY	12.8,25.6;
	BMAPS 		Wall05_map;}

WALL Wall05_wall {
	TEXTURE	Wall05_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP CAFWALL_map,	<wall03.pcx>;	
TEXTURE CAFWALL_tex {
	SCALE_XY	25.6,25.6;
	BMAPS 		CAFWALL_map;}
WALL CAFEWALL_wall {
	TEXTURE	CAFWALL_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP WALL02_map,	<WALL02.pcx>;	
TEXTURE WALL02_tex {
	SCALE_XY	12.8,12.8;
	BMAPS 		WALL02_map;}
WALL WALL02_wall {
	TEXTURE	WALL02_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP Wall05C_map,	<Wall5C.pcx>;	
TEXTURE Wall05C_tex {
	SCALE_XY	12.8,18.7;
	BMAPS 		Wall05C_map;}
WALL Wall05C_wall {
	TEXTURE	Wall05C_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP brick2_map,	<WALL03.pcx>;	
TEXTURE brick2_tex {
	SCALE_XY	25.6,25.6;
	BMAPS 		brick2_map;}
WALL brick2_wall {
	TEXTURE	brick2_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////

BMAP tdesk_map,	<tdesk.pcx>;	
TEXTURE tdesk_tex {
	SCALE_XY	16,42.2;
	BMAPS 		tdesk_map;}
WALL tdesk_wall {
	TEXTURE	tdesk_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP  FDOOR_map,	<FDOOR.pcx>;	
TEXTURE FDOOR_tex {
	SCALE_XY	21,23.5;
	AMBIENT	.3;
	BMAPS 		FDOOR_map;}
WALL FDOOR_wall {
	TEXTURE	FDOOR_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP  WALL05B_map,	<WALL5B.pcx>;	
TEXTURE WALL05B_tex {
	SCALE_XY	9.2,12.8;
	BMAPS 		WALL05B_map;}
WALL WALL05B_wall {
	TEXTURE	WALL05B_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP  alarm_map,	<base2.pcx>;	
TEXTURE alarm_tex {
	SCALE_XY	21.7,23.5;
	BMAPS 		alarm_map;}
WALL alarm_wall {
	TEXTURE	alarm_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP  board_map,	<base3.pcx>;	
TEXTURE board_tex {
	SCALE_XY	21.7,23.5;
	BMAPS 		board_map;}
WALL board_wall {
	TEXTURE	board_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP  Wall05A_map,	<Wall5A.pcx>;	
TEXTURE Wall05A_tex {
	SCALE_XY	25.6,25.6;
	BMAPS 		Wall05A_map;}
WALL Wall05A_wall {
	TEXTURE	Wall05A_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP  temp_map,	<black.pcx>;	
TEXTURE temp_tex {
	SCALE_XY	16,30;
	BMAPS 		temp_map;}
WALL temp_wall {
	TEXTURE	temp_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP  black_map,	<black.pcx>;	
TEXTURE black_tex {
	SCALE_XY	33,64;
	BMAPS 		black_map;}
WALL black_wall {
	TEXTURE	black_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////

BMAP  Stone01_map,	<base1.pcx>;	
TEXTURE stone01_tex {
	SCALE_XY	21.7,23.5;
	BMAPS 		stone01_map;}
WALL stone01_wall {
	TEXTURE	stone01_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////

BMAP  Column2_map,	<Column2.pcx>;	
TEXTURE Column2_tex {
	SCALE_XY	21.7,23.5;
	BMAPS 		Column2_map;}
WALL Column2_wall {
	TEXTURE	Column2_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
