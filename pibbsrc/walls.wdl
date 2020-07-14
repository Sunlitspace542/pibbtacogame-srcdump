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
BMAP	Banner_MAP	<Banner.pcx>;
TEXTURE Banner_tex {
	SCALE_XY	10.7,58.7;
	ALBEDO		1;
	AMBIENT		.3;
	BMAPS 		Banner_map;}
WALL Banner_wall {
	TEXTURE	Banner_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////


BMAP	KeepOut_MAP	<Metal1.pcx>;
TEXTURE KeepOut_tex {
	SCALE_XY	16,43;
	ALBEDO		1;
	AMBIENT		.3;
	BMAPS 		KeepOut_map;}
WALL KeepOut_wall {
	TEXTURE	KeepOut_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP	ScoreBd_MAP	<ScoreBd.pcx>;
TEXTURE ScoreBd_tex {
	SCALE_XY	9.3,12.6;
	ALBEDO		1;
	AMBIENT		.4;
	BMAPS 		ScoreBd_map;}
WALL ScoreBd_wall {
	TEXTURE	ScoreBd_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP	phone_MAP	<phone.pcx>;
TEXTURE phone_tex {
	SCALE_XY	66.7,42.4;
	ALBEDO		1;
	BMAPS 		phone_map;}
WALL phone_wall {
	TEXTURE	phone_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP	metal1_MAP	<metal1.pcx>;
TEXTURE metal1_tex {
	SCALE_XY	32,32;
	ALBEDO		1;
	BMAPS 		metal1_map;}
WALL metal1_wall {
	TEXTURE	metal1_tex;
	FLAGS	PORTCULLIS;
}

//////////////////////////////////////////////////
BMAP	brick05_MAP	<brick05.pcx>;
TEXTURE brick05_tex {
	SCALE_XY	16,16;
	BMAPS 		brick05_map;}
WALL brick05_wall {
	TEXTURE	brick05_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP	brick05_secret_MAP	<brick05.pcx>;
SOUND	secretdoor_snd,	<this2.wav>;

TEXTURE brick05_secret_tex {
	SCALE_XY	16,16;
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
	TEXTURE	brick05_tex;
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
BMAP	macside_MAP	<macside.pcx>;
TEXTURE macside_tex {
	SCALE_XY	44.1,21.2;
	BMAPS 		macside_map;}
WALL macside_wall {
	TEXTURE	macside_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////

BMAP	macfrnt_MAP	<macfrnt.pcx>;
TEXTURE macfrnt_tex {
	SCALE_XY	32.7,21.2;
	BMAPS 		macfrnt_map;}
WALL macfrnt_wall {
	TEXTURE	macfrnt_tex;
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
	FLAGS	PORTCULLIS;
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


BMAP  libside_map,	<libside.pcx>;	
TEXTURE libside_tex {
	SCALE_XY	32,15.5;
	BMAPS 		libside_map;}
WALL libside_wall {
	TEXTURE	libside_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP  lib_map,	<lib.pcx>;	
TEXTURE lib_tex {
	SCALE_XY	21.3,20.4;
	BMAPS 		lib_map;}
WALL lib_wall {
	TEXTURE	lib_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP  alum1_map,	<alum1.pcx>;	
TEXTURE alum1_tex {
	SCALE_XY	8,8;
	ALBEDO		1;
	BMAPS 		alum1_map;
}
WALL alum1_wall {
	TEXTURE	alum1_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP  trophy_map,	<trophy.pcx>;	
TEXTURE trophy_tex {
	SCALE_XY	18.4,12.8;
	BMAPS 		trophy_map;}
WALL trophy_wall {
	TEXTURE	trophy_tex;
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
BMAP chalk_map,	<chalk.pcx>;	
TEXTURE chalk_tex {
	SCALE_XY	9.2,12.8;
	BMAPS 		chalk_map;}
WALL chalk_wall {
	TEXTURE	chalk_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP CAFWALL_map,	<CAFWALL.pcx>;	
TEXTURE CAFWALL_tex {
	SCALE_XY	12.8,12.8;
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
BMAP POSTER2_map,	<POSTER2.pcx>;	
TEXTURE POSTER2_tex {
	SCALE_XY	9.2,12.8;
	BMAPS 		POSTER2_map;}
WALL POSTER2_wall {
	TEXTURE	POSTER2_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP POSTER1_map,	<POSTER1.pcx>;	
TEXTURE POSTER1_tex {
	SCALE_XY	9.2,12.8;
	BMAPS 		POSTER1_map;}
WALL POSTER1_wall {
	TEXTURE	POSTER1_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP brick2_map,	<brick2.pcx>;	
TEXTURE brick2_tex {
	SCALE_XY	16,16;
	BMAPS 		brick2_map;}
WALL brick2_wall {
	TEXTURE	brick2_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP tdeskf_map,	<tdeskf.pcx>;	
TEXTURE tdeskf_tex {
	SCALE_XY	16,42.2;
	BMAPS 		tdeskf_map;}
WALL tdeskf_wall {
	TEXTURE	tdeskf_tex;
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
BMAP  cabinet_map,	<cabinet.pcx>;	
TEXTURE cabinet_tex {
	SCALE_XY	15.9,23.3;
	BMAPS 		cabinet_map;}
WALL cabinet_wall {
	TEXTURE	cabinet_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////

BMAP  map_map,	<map.pcx>;	
TEXTURE map_tex {
	SCALE_XY	9.2,12.8;
	BMAPS 		map_map;}
WALL map_wall {
	TEXTURE	map_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP  alarm_map,	<alarm01.pcx>;	
TEXTURE alarm_tex {
	SCALE_XY	12,12.8;
	BMAPS 		alarm_map;}
WALL alarm_wall {
	TEXTURE	alarm_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP  board_map,	<board.pcx>;	
TEXTURE board_tex {
	SCALE_XY	10.7,12.8;
	BMAPS 		board_map;}
WALL board_wall {
	TEXTURE	board_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP  clock2_map,	<clock2.pcx>;	
TEXTURE clock2_tex {
	SCALE_XY	22.5,30;
	BMAPS 		clock2_map;}
WALL clock2_wall {
	TEXTURE	clock2_tex;
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

BMAP  lockers_map,	<lckrvnt.pcx>;	
TEXTURE lockers_tex {
	SCALE_XY	18.3,25;
	BMAPS 		lockers_map;}
WALL lockers1_wall {
	TEXTURE	lockers_tex;
	FLAGS	PORTCULLIS;
}
//////////////////////////////////////////////////
BMAP  wall01_map,	<walls.pcx>;	
TEXTURE wall01_tex {
	SCALE_XY	8,12.5;
	BMAPS 		wall01_map;}
WALL wall01_wall {
	TEXTURE	wall01_tex;
	FLAGS	PORTCULLIS;
}

