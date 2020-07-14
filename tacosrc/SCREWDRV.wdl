BMAP	vent01_MAP	<BARS01.pcx>;
BMAP  	VENT02_MAP	<BLACK.pcx>;	//opening door

//////////////////////////////////////////////////

TEXTURE VENT01_tex {
	SCALE_XY	32,31.9;
	BMAPS	VENT01_MAP;
}
WALL VENT01_wall {
	TEXTURE	VENT01_tex;
	FLAGS	TRANSPARENT,PORTCULLIS;
}

TEXTURE VENT_OPEN_tex {
	SCALE_XY	32,31.9;
	CYCLES	2;
	BMAPS	VENT01_MAP,VENT02_MAP;
	DELAY	1,1;
	FLAGS	ONESHOT;
	SOUND	door_snd;
	SCYCLE	2;
	SVOL	1;
	SDIST	20;
}
TEXTURE VENT_close_tex {
	SCALE_XY	32,31.9;
	CYCLES 	2;
	BMAPS	VENT02_MAP,VENT01_MAP;
	DELAY 	1,1;
	FLAGS	ONESHOT;
	SOUND	door_snd;
	SCYCLE	1;
	SVOL	0.1;
	SDIST	20;
}
///////////////////////////////////
// ACTIONS
///////////////////////////////////

ACTION VENT_open{
	SET MY.TEXTURE,VENT_open_tex;
	BRANCH	texdoor_open;
}
ACTION VENT_close{
	SET MY.TEXTURE,VENT_close_tex;
	BRANCH	texdoor_close;
}
ACTION texdVENT_open {
	SET MY.DIST,3;
	SET MY.TRANSPARENT, 1;
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texVENT_checkopen;
}
ACTION	texVENT_checkopen {
	SET MY.PASSABLE,1;	//now the player may pass the door
}
ACTION texVENT_close {
	SET MY.DIST,1;
	SET MY.PASSABLE,0;	//close the door again
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texVENT_checkclose;
}
ACTION	texVENT_checkclose {
	SET MY.TRANSPARENT, 0;
}

////////////////////////////////////////////////////////////////////
// The Key
////////////////////////////////////////////////////////////////////

SOUND	gotVENTkey, <gotkey.wav>;
BMAP	VENTkey_map,      <SCREWDRV.pcx>;

SKILL   VENThavekey { VAL 0; }

TEXTURE VENTkey_tex {
        SCALE_XY        16,16;
        BMAPS           VENTkey_map;
}
THING VENTkey {
        TEXTURE	VENTkey_tex;
        DIST	4;
        HEIGHT	-8;
	FLAGS	GROUND,FRAGILE;
	IF_NEAR	VENTtakethekey;
}

STRING str_VentTakeTheKey, "Cool... a CROW BAR.";

ACTION  VENTtakethekey {
        PLAY_SOUND   gotVENTkey,0.6;
        SET        MY.INVISIBLE,1;      // can't see the key anymore
        SET        MY.PASSABLE,1;       // walk through the key now
        SET        VENThavekey,1;
	SET	text_TxtMsg.STRING, str_VentTakeTheKey;
	CALL	a_ResetText;

}
////////////////////////////////////////////////////////////////////
// The Locked Door
////////////////////////////////////////////////////////////////////

WALL  Locked_VENT01{
	TEXTURE	VENT_OPEN_tex;
	FLAGS	transparent,SAVE;
	DIST	1;
	IF_NEAR	VENTcheckforkey;
	IF_FAR	VENT_close;
}
//ACTION  VENTcheckforkey {
  //      IF_EQUAL    VENThavekey,0;
    //                END;
      //  BRANCH      VENT_open;
//}

STRING str_VentLocked,"These bars are strong.  
I'll need a tool to pry them off.";
STRING str_VentUnlocked,"That CROW BAR did the trick.";

ACTION  Ventcheckforkey {
        IF_EQUAL	VentHavekey,0;
		GOTO 	VentIsLocked;

VentIsUnlocked:
	SET	text_TxtMsg.STRING, str_VentUnlocked;
	CALL	a_ResetText;
        BRANCH	Vent_open;

VentIsLocked:
	SET	text_TxtMsg.STRING, str_VentLocked;
	CALL	a_ResetText;
        END;
}