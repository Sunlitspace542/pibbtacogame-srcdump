BMAP  door_map,		<door01.pcx>;	//closed door
BMAP  door_open1,	<door02.pcx>;	//opening door
BMAP  door_open2,	<door03.pcx>;	//opening door

SOUND	door_snd	<gotkey.wav>;

TEXTURE door_open_tex {
	SCALE_XY	21,15.8;
	CYCLES 		3;
	BMAPS		door_map,door_open1,door_open2;
	DELAY		1,1,1;
	FLAGS		ONESHOT;
	SOUND		door_snd;
	SCYCLE		2;
	SVOL		0.3;
	SDIST		20;
}
TEXTURE  door_close_tex {
	SCALE_XY	21,15.8;
	CYCLES 		3;
	BMAPS		door_open2,door_open1,door_map;
	DELAY 		1,1,1;
	FLAGS		ONESHOT;
	SOUND		door_snd;
	SCYCLE		1;
	SVOL		0.1;
	SDIST		20;
}
///////////////////////////////////
// ACTIONS
///////////////////////////////////

ACTION door_open{
	SET 	MY.TEXTURE,door_open_tex;
	BRANCH	texdoor_open;
}
ACTION door_close{
	SET 	MY.TEXTURE,door_close_tex;
	BRANCH	texdoor_close;
}
ACTION texdoor_open {
	SET MY.DIST,6;
	SET MY.TRANSPARENT, 1;
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texdoor_checkopen;
}
ACTION	texdoor_checkopen {
	SET MY.PASSABLE,1;	//now the player may pass the door
}
ACTION texdoor_close {
	SET MY.DIST,4;
	SET MY.PASSABLE,0;	//close the door again
	SET MY.PLAY, 1;
	SET MY.EACH_CYCLE,texdoor_checkclose;
}
ACTION	texdoor_checkclose {
	SET MY.TRANSPARENT, 0;
}

////////////////////////////////////////////////////////////////////
// Regular Door
////////////////////////////////////////////////////////////////////

WALL  door01{
	TEXTURE		door_open_tex;
	FLAGS		SAVE;
	DIST		6;
	IF_NEAR		door_open;
	IF_FAR		door_close;
}
WALL  door02{
	TEXTURE		door_open_tex;
	OFFSET_Y	100;	
	FLAGS		SAVE;
	DIST		6;
	IF_NEAR		door_open;
	IF_FAR		door_close;
}

////////////////////////////////////////////////////////////////////
// The Key
////////////////////////////////////////////////////////////////////

SOUND   gotthekey,	<shiny1.wav>;
BMAP  	key_map,	<key1.pcx>;

SKILL   Door01havekey { VAL 0; }

TEXTURE  key_tex {
        SCALE_XY        40,40;
        BMAPS           key_map;
}
THING key {
        TEXTURE 	key_tex;
        DIST		4;
        HEIGHT		2;
	IF_NEAR		takethekey;
}

STRING str_Door01TakeTheKey, "The GOLD key is mine.";

ACTION  takethekey {
        PLAY_SOUND   	gotthekey,0.6;
        SET		MY.INVISIBLE,1;      // can't see the key anymore
        SET		MY.PASSABLE,1;       // walk through the key now
        SET		Door01havekey,1;
	SET		text_TxtMsg.STRING, str_Door01TakeTheKey;
	CALL		a_ResetText;
}
////////////////////////////////////////////////////////////////////
// The Locked Door
////////////////////////////////////////////////////////////////////
SOUND	snd_nuh_uh	<nuh_uh.wav>;
SOUND	snd_this2	<this2.wav>;

WALL  Locked_door01{
	TEXTURE		door_open_tex;
	FLAGS		SAVE;
	DIST		6;
	IF_NEAR		Door01checkforkey;
	IF_FAR		Door_close;
}

STRING str_Door01Locked,"I think we need the GOLD key.";
STRING str_Door01Unlocked,"Sweet, the GOLD key worked.";

ACTION  Door01checkforkey {
        IF_EQUAL    	Door01Havekey,0;
	GOTO 		Door01IsLocked;

Door01IsUnlocked:
	SET		text_TxtMsg.STRING, str_Door01Unlocked;
	PLAY_SOUND	snd_this2, 1;
	CALL		a_ResetText;
	BRANCH      	Door_open;

Door01IsLocked:
	SET		text_TxtMsg.STRING, str_Door01Locked;
	PLAY_SOUND	snd_Nuh_Uh, 1;
	CALL		a_ResetText;
        END;
}
///////////////////////////////////////
STRING str_MainDoorLocked,"The exits are locked.
Looks like we're stuck here.";

ACTION	act_MainDoorText{
	SET		text_TxtMsg.STRING, str_MainDoorLocked;
	PLAY_SOUND	snd_Nuh_Uh, 1;
	CALL		a_ResetText;	
}
TEXTURE MainDoor_tex {
	SCALE_XY	22.4,15.9;
	BMAPS 		Door_map;}
WALL MainDoor_wall {
	TEXTURE		MainDoor_tex;
	FLAGS		PORTCULLIS;
	DIST		4;
	IF_NEAR		act_MainDoorText;
}
//////////////////////////////////////////////////