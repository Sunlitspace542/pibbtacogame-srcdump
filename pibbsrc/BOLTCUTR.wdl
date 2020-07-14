BMAP	BOLT01_MAP	<LKDOOR.pcx>;
BMAP  BOLT02_MAP	<BLACK.pcx>;	//opening door

//////////////////////////////////////////////////

TEXTURE BOLT_OPEN_tex {
	SCALE_XY	42.5,33;
	CYCLES	2;
	BMAPS	BOLT01_MAP,BOLT02_MAP;
	DELAY	1,1;
	FLAGS	ONESHOT;
	SOUND	door_snd;
	SCYCLE	2;
	SVOL	0.3;
	SDIST	20;
}
TEXTURE BOLT_close_tex {
	SCALE_XY	42.5,33;
	CYCLES 	2;
	BMAPS	BOLT02_MAP,BOLT01_MAP;
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

ACTION BOLT_open{
	SET MY.TEXTURE,BOLT_open_tex;
	BRANCH	texdoor_open;
}
ACTION BOLT_close{
	SET MY.TEXTURE,BOLT_close_tex;
	BRANCH	texdoor_close;
}
ACTION texdBOLT_open {
	SET MY.DIST,3;
	SET MY.TRANSPARENT, 1;
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texBOLT_checkopen;
}
ACTION	texBOLT_checkopen {
	SET MY.PASSABLE,1;	//now the player may pass the door
}
ACTION texBOLT_close {
	SET MY.DIST,1;
	SET MY.PASSABLE,0;	//close the door again
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texBOLT_checkclose;
}
ACTION	texBOLT_checkclose {
	SET MY.TRANSPARENT, 0;
}

////////////////////////////////////////////////////////////////////
// The Key
////////////////////////////////////////////////////////////////////

SOUND	gotBOLTkey, <gotkey.wav>;
BMAP	BOLTkey_map,      <BOLTCUTR.pcx>;

SKILL   BOLThavekey { VAL 0; }

TEXTURE BOLTkey_tex {
        SCALE_XY        16,16;
        BMAPS           BOLTkey_map;
}
THING BOLTkey {
        TEXTURE BOLTkey_tex;
        DIST             4;
        IF_NEAR          BOLTtakethekey;
}

STRING  str_BoltTakeTheKey,"This BOLT-CUTTER looks pretty sharp.";

ACTION  BOLTtakethekey {
        PLAY_SOUND   gotBOLTkey,0.6;
        CALL	a_ResetText;
	SET	MY.INVISIBLE,1;      // can't see the key anymore
        SET	MY.PASSABLE,1;       // walk through the key now
        SET	text_TxtMsg.STRING, str_BoltTakeTheKey;
	CALL	a_ResetText;
	SET	BOLThavekey,1;
}
////////////////////////////////////////////////////////////////////
// The Locked Door
////////////////////////////////////////////////////////////////////

WALL  Locked_BOLT01{
	TEXTURE	BOLT_OPEN_tex;
	FLAGS	SAVE;
	DIST	1;
	IF_NEAR	BOLTcheckforkey;
	IF_FAR	BOLT_close;
}
//ACTION  BOLTcheckforkey {
  //      IF_EQUAL    BOLThavekey,0;
    //                END;
      //  BRANCH      BOLT_open;
//}

STRING str_BOLTLocked,"That DEAD-BOLT looks pretty strong.";
STRING str_BOLTUnlocked,"Snip snip, and we're in.";

ACTION  BOLTcheckforkey {
        IF_EQUAL    BOLTHavekey,0;
		GOTO BOLTIsLocked;

BOLTIsUnlocked:
	SET	text_TxtMsg.STRING, str_BOLTUnlocked;
	CALL	a_ResetText;
        BRANCH      BOLT_open;

BOLTIsLocked:
	SET	text_TxtMsg.STRING, str_BOLTLocked;
	CALL	a_ResetText;
        END;
}