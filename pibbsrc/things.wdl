/////////////////////////////////////////////
// Lab Stuff
/////////////////////////////////////////////
BMAP  PibFount_map,	<PibFount.pcx>;

TEXTURE	PibFount_tex {
	SCALE_XY	50,50;
	BMAPS		PibFount_map;
	AMBIENT		0.1;
}

THING	PibFount{
	TEXTURE	PibFount_tex;
	height -.2;
	//FLAGS	GROUND;
}

/////////////////////////////////////////////
BMAP  LabStuff_map,	<LabStuff.pcx>;

TEXTURE	LabStuff_tex {
	SCALE_XY	16,16;
	BMAPS		LabStuff_map;
	AMBIENT		0.1;
}

THING	LabStuff{
	TEXTURE	LabStuff_tex;
	FLAGS	GROUND;
}

/////////////////////////////////////////////
// Lunchroom Table
/////////////////////////////////////////////
BMAP  table1_map,	<table1.pcx>;

TEXTURE	table1_tex {
	SCALE_XY	20,41;
	//sides		4;
	BMAPS		table1_map;
	AMBIENT		0.1;
}

THING	table1{
	TEXTURE	table1_tex;
	FLAGS	GROUND;
}

/////////////////////////////////////////////
// Desk
/////////////////////////////////////////////
BMAP  desk01_map,		<desk01.pcx>;
BMAP  desk02_map,		<desk02.pcx>;
BMAP  desk03_map,		<desk03.pcx>;
BMAP  desk04_map,		<desk04.pcx>;

TEXTURE	desk_tex {
	SCALE_XY	38,41;
	sides		4;
	BMAPS		desk01_map,desk02_map,desk03_map,desk04_map;
	AMBIENT		0.1;
}

THING	desk{
	TEXTURE	desk_tex;
	//FLAGS	GROUND;
}
/////////////////////////////////////////////
// Flag
/////////////////////////////////////////////
BMAP  flag_map,		<flag1.pcx>;

TEXTURE	flag_tex {
	SCALE_XY	12,12;
	BMAPS		flag_map;
	AMBIENT		0.1;
}

THING	flag{
	TEXTURE	flag_tex;
	FLAGS	GROUND;
}
/////////////////////////////////////////////
// Fountain
/////////////////////////////////////////////
BMAP  fount01_map,		<fount01.pcx>;
BMAP  fount02_map,		<fount02.pcx>;
BMAP  fount03_map,		<fount03.pcx>;

TEXTURE	fount_tex {
	SCALE_XY	20,20;
	CYCLES		3;
	BMAPS		fount01_map,fount02_map,fount03_map;
	DELAY		2,2,2;
	AMBIENT		0.1;
	//SCYCLE	1;
}

THING	fount{
	TEXTURE	fount_tex;
	//FLAGS	GROUND;
}

