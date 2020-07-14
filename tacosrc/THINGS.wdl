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
BMAP  desk01_map,		<LSTAT1.pcx>;
BMAP  desk02_map,		<LSTAT2.pcx>;
BMAP  desk03_map,		<LSTAT3.pcx>;
BMAP  desk04_map,		<LSTAT4.pcx>;

TEXTURE	desk_tex {
	SCALE_XY	24,24;
	sides		4;
	BMAPS		desk01_map,desk02_map,desk03_map,desk04_map;
	AMBIENT		0.1;
}

THING	desk{
	TEXTURE	desk_tex;
	//FLAGS	GROUND;
}
/////////////////////////////////////////////
// Bones
/////////////////////////////////////////////
BMAP  bones_map,	<bones.pcx>;

TEXTURE	bones_tex {
	SCALE_XY	24,24;
	BMAPS		bones_map;
	AMBIENT		0.3;
}

THING	bones{
	TEXTURE	bones_tex;
	FLAGS	GROUND;
}
