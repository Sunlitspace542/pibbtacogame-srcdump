//temporary actors for smoke bullets, explosions
//
BMAP	null_map,	<null.pcx>;

TEXTURE	tex_NoTex
{	SCALE_XY	65,65;
	SIDES		1;
	CYCLES		1;
	BMAPS		null_map;
	AMBIENT		0.0;
}

ACTOR act_Temp01{TEXTURE	tex_NoTex;	FLAGS		GROUND,INVISIBLE,PASSABLE;}
ACTOR act_Temp02{TEXTURE	tex_NoTex;	FLAGS		GROUND,INVISIBLE,PASSABLE;}
ACTOR act_Temp03{TEXTURE	tex_NoTex;	FLAGS		GROUND,INVISIBLE,PASSABLE;}
ACTOR act_Temp04{TEXTURE	tex_NoTex;	FLAGS		GROUND,INVISIBLE,PASSABLE;}
ACTOR act_Temp05{TEXTURE	tex_NoTex;	FLAGS		GROUND,INVISIBLE,PASSABLE;}
ACTOR act_Temp06{TEXTURE	tex_NoTex;	FLAGS		GROUND,INVISIBLE,PASSABLE;}
ACTOR act_Temp07{TEXTURE	tex_NoTex;	FLAGS		GROUND,INVISIBLE,PASSABLE;}
ACTOR act_Temp08{TEXTURE	tex_NoTex;	FLAGS		GROUND,INVISIBLE,PASSABLE;}
ACTOR act_Temp09{TEXTURE	tex_NoTex;	FLAGS		GROUND,INVISIBLE,PASSABLE;}
ACTOR act_Temp10{TEXTURE	tex_NoTex;	FLAGS		GROUND,INVISIBLE,PASSABLE;}

SYNONYM SYN_tempInit{ TYPE ACTION;}

ACTION	a_TempDisapear
{	SET		MY.SPEED,		0.0;
	SET		MY.TARGET,		NULL;	
	SET		MY.EACH_TICK,		NULL;
	SET		MY.IF_HIT,		NULL;
	SET		MY.EACH_CYCLE,		NULL;
	SET		MY.PASSABLE,		1;
	SET		MY.INVISIBLE,		1;
	SET		MY.GROUND,		1;
	SET		MY.CAREFULLY,		0;
	SET		MY.TEXTURE,		tex_NoTex;	
}

ACTION a_InitTemp
{	
label_Set_Temp01:
	IF_EQUAL	act_Temp01.INVISIBLE,0;		GOTO	label_Set_Temp02;
	SET			act_Temp01.INVISIBLE,0;
	SET			act_Temp01.EACH_TICK,SYN_tempInit;
	GOTO		label_missed;
label_Set_Temp02:
	IF_EQUAL	act_Temp02.INVISIBLE,0;		GOTO	label_Set_Temp03;
	SET			act_Temp02.INVISIBLE,0;
	SET			act_Temp02.EACH_TICK,SYN_tempInit;
	GOTO		label_missed;
label_Set_Temp03:
	IF_EQUAL	act_Temp03.INVISIBLE,0;		GOTO	label_Set_Temp04;
	SET			act_Temp03.INVISIBLE,0;
	SET			act_Temp03.EACH_TICK,SYN_tempInit;
	GOTO		label_missed;
label_Set_Temp04:
	IF_EQUAL	act_Temp04.INVISIBLE,0;		GOTO	label_Set_Temp05;
	SET			act_Temp04.INVISIBLE,0;
	SET			act_Temp04.EACH_TICK,SYN_tempInit;
	GOTO		label_missed;
label_Set_Temp05:
	IF_EQUAL	act_Temp05.INVISIBLE,0;		GOTO	label_Set_Temp06;
	SET			act_Temp05.INVISIBLE,0;
	SET			act_Temp05.EACH_TICK,SYN_tempInit;
	GOTO		label_missed;
label_Set_Temp06:
	IF_EQUAL	act_Temp06.INVISIBLE,0;		GOTO	label_Set_Temp07;
	SET			act_Temp06.INVISIBLE,0;
	SET			act_Temp06.EACH_TICK,SYN_tempInit;
	GOTO		label_missed;
label_Set_Temp07:
	IF_EQUAL	act_Temp07.INVISIBLE,0;		GOTO	label_Set_Temp08;
	SET			act_Temp07.INVISIBLE,0;
	SET			act_Temp07.EACH_TICK,SYN_tempInit;
	GOTO		label_missed;
label_Set_Temp08:
	IF_EQUAL	act_Temp08.INVISIBLE,0;		GOTO	label_Set_Temp09;
	SET			act_Temp08.INVISIBLE,0;
	SET			act_Temp08.EACH_TICK,SYN_tempInit;
	GOTO		label_missed;
label_Set_Temp09:
	IF_EQUAL	act_Temp09.INVISIBLE,0;		GOTO	label_Set_Temp10;
	SET			act_Temp09.INVISIBLE,0;
	SET			act_Temp09.EACH_TICK,SYN_tempInit;
	GOTO		label_missed;
label_Set_Temp10:
	IF_EQUAL	act_Temp10.INVISIBLE,0;		GOTO	label_missed;
	SET			act_Temp10.INVISIBLE,0;
	SET			act_Temp10.EACH_TICK,SYN_tempInit;
label_missed:
	//END;
	SET			SYN_tempInit,SYN_tempInit;
	
}