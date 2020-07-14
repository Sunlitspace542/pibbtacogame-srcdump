//////////////////////////////////////////////////////////
// Example for a WDL menu
// to start new levels, save, load, etc.
//////////////////////////////////////////////////////////
// skills to be global, i.e. preserved on score loading & level change

SKILL MAP_SCALE 	{ TYPE GLOBAL; MIN 0.1; MAX 10; }
SKILL MOTION_BLUR	{ TYPE GLOBAL; VAL 0; }
SKILL SOUND_VOL 	{ TYPE GLOBAL; MIN 0; VAL 1; MAX 1; }
SKILL MUSIC_VOL 	{ TYPE GLOBAL; MIN 0; VAL 0.5; MAX 1; }

SKILL difficulty	{ TYPE GLOBAL; VAL 0; }

//////////////////////////////////////////////////////////
SKILL menu_pos { VAL 0; MIN 0; MAX 7; }
SKILL slot		{ VAL 0; }	// number of last score
//////////////////////////////////////////////////////////

STRING empty," ";
STRING exit_str,"Exit Menu";

SOUND	click, <Beep.wav>;

//FONT menu_font,<font_amb.lbm>,8,16;

DEFINE menu_xpos,10;

TEXT menu1_txt {
	POS_X 	menu_xpos;
	POS_Y 	100;
	FONT	menu_font;
	STRING	empty;
}
TEXT menu2_txt {
	POS_X 	menu_xpos;
	POS_Y 	120;
	FONT	menu_font;
	STRING	empty;
}
TEXT menu3_txt {
	POS_X 	menu_xpos;
	POS_Y 	140;
	FONT		menu_font;
	STRING	empty;
}
TEXT menu4_txt {
	POS_X 	menu_xpos;
	POS_Y 	160;
	FONT		menu_font;
	STRING	empty;
}
TEXT menu5_txt {
	POS_X 	menu_xpos;
	POS_Y 	180;
	FONT		menu_font;
	STRING	empty;
}
//TEXT menu6_txt {
	//POS_X 	menu_xpos;
	//POS_Y 	200;
	//FONT		menu_font;
	//STRING	empty;
//}

TEXT menuexit_txt {
	POS_X 	menu_xpos;
	POS_Y 	290;
	FONT		menu_font;
	STRING	exit_str;
}

ACTION tunix { END; }


SYNONYM menu1_str { TYPE STRING; DEFAULT empty; }
SYNONYM menu2_str { TYPE STRING; DEFAULT empty; }
SYNONYM menu3_str { TYPE STRING; DEFAULT empty; }
SYNONYM menu4_str { TYPE STRING; DEFAULT empty; }
SYNONYM menu5_str { TYPE STRING; DEFAULT empty; }
//SYNONYM menu6_str { TYPE STRING; DEFAULT empty; }

SYNONYM menu1_act { TYPE ACTION; DEFAULT tunix; }
SYNONYM menu2_act { TYPE ACTION; DEFAULT tunix; }
SYNONYM menu3_act { TYPE ACTION; DEFAULT tunix; }
SYNONYM menu4_act { TYPE ACTION; DEFAULT tunix; }
SYNONYM menu5_act { TYPE ACTION; DEFAULT tunix; }
//SYNONYM menu6_act { TYPE ACTION; DEFAULT tunix; }

ACTION set_menu {
	SET	menu1_txt.STRING,menu1_str;
	SET	menu2_txt.STRING,menu2_str;
	SET	menu3_txt.STRING,menu3_str;
	SET	menu4_txt.STRING,menu4_str;
	SET	menu5_txt.STRING,menu5_str;
	//SET	menu6_txt.STRING,menu6_str;
	SET	menuexit_txt.STRING,exit_str;
}

ACTION show_menu {
	SET	text_TxtMsg.STRING, 	NULL;
	SET	IF_ENTER,menu_exec;
	SET	IF_ESC,clear_menu;
	SET	IF_CUU,menu_up;
	SET	IF_CUD,menu_down;
	SET	MOVE_MODE,0;

	SET	menu_pos.MIN,1;
	IF_EQUAL	menu_pos,0;
		SET	menu_pos,1;
	RULE	menuexit_txt.POS_Y = menu1_txt.POS_Y+menu_pos.MAX*20-10;

	SET	messages.10,menu1_txt;
	SET	messages.11,menu2_txt;
	SET	messages.12,menu3_txt;
	SET	messages.13,menu4_txt;
	SET	messages.14,menu5_txt;
	//SET	messages.15,menu6_txt;
	SET	messages.16,menuexit_txt;

blink:
	CALL	set_menu;
	WAITT	3;

	IF_MAX	menu_pos;
		SET	menuexit_txt.STRING,empty;
	IF_EQUAL	menu_pos,1;
		SET	menu1_txt.STRING,empty;
	IF_EQUAL	menu_pos,2;
		SET	menu2_txt.STRING,empty;
	IF_EQUAL	menu_pos,3;
		SET	menu3_txt.STRING,empty;
	IF_EQUAL	menu_pos,4;
		SET	menu4_txt.STRING,empty;
	IF_EQUAL	menu_pos,5;
		SET	menu5_txt.STRING,empty;
	//IF_EQUAL	menu_pos,6;
		//SET	menu6_txt.STRING,empty;
	IF_EQUAL	menu_pos,0;
		END;
	WAITT	3;
	GOTO	blink;
}

ACTION clear_menu {
	SET	text_TxtMsg.STRING, 	NULL;
	SET	menu1_str,empty;
	SET	menu2_str,empty;
	SET	menu3_str,empty;
	SET	menu4_str,empty;
	SET	menu5_str,empty;
	//SET	menu6_str,empty;
	SET	menu1_txt.STRING,empty;
	SET	menu2_txt.STRING,empty;
	SET	menu3_txt.STRING,empty;
	SET	menu4_txt.STRING,empty;
	SET	menu5_txt.STRING,empty;
	//SET	menu6_txt.STRING,empty;
	SET	messages.10,NULL;
	SET	messages.11,NULL;
	SET	messages.12,NULL;
	SET	messages.13,NULL;
	SET	messages.14,NULL;
	SET	messages.15,NULL;
	SET	messages.16,NULL;
	SET	menu_pos.MIN,0;
	SET	menu_pos,0;		// signal to end the show_menu action
	SET	IF_ESC,main_menu;
	SET	IF_CUU,NULL;
	SET	IF_CUD,NULL;
	SET	IF_ENTER,NULL;
	SET	MOVE_MODE,1;
}

ACTION menu_up {
	PLAY_SOUND	click,1;
	CALL	set_menu;
	ADD	menu_pos,-1;
}
ACTION menu_down {
	PLAY_SOUND	click,1;
	CALL	set_menu;
	ADD	menu_pos,1;
}
ACTION menu_exec {
#	BEEP;
	PLAY_SOUND	click,1;
	IF_MAX		menu_pos;
		BRANCH	clear_menu;
	IF_EQUAL		menu_pos,1;
		BRANCH	menu1_act;
	IF_EQUAL		menu_pos,2;
		BRANCH	menu2_act;
	IF_EQUAL		menu_pos,3;
		BRANCH	menu3_act;
	IF_EQUAL		menu_pos,4;
		BRANCH	menu4_act;
	IF_EQUAL		menu_pos,5;
		BRANCH	menu5_act;
	//IF_EQUAL		menu_pos,6;
		//BRANCH	menu6_act;
}

///////////////////////////////////////////////////////
TEXT screen_txt {				// TEXT to display a message
	POS_X 		10;
	POS_Y 		100;
	FONT		menu_font;			
	STRING		empty;
}

ACTION show_message {				
	SET	MESSAGES.14,screen_txt;
	WAITT	48;				
	SET	MESSAGES.14,NULL;
}

ACTION wait_yesno {			
	SET	MESSAGES.14,screen_txt;	
	SET	MOVE_MODE,0;				
	SET	IF_N, clear_yesno;		
	SET	IF_ESC, clear_yesno;
}

ACTION clear_yesno {			
	SET	MESSAGES.14,NULL;	
	SET	MOVE_MODE,1;		
	SET	IF_J, NULL;			
	SET	IF_Y, NULL;
	SET	IF_Z, NULL;
	SET	IF_N, NULL;
	SET	IF_ESC,main_menu;
}

//////////////////////////////////////////////////
// Save & load actions
//////////////////////////////////////////////////
//SAVEDIR	"";	// save into current directory (not on CDROM!!)

STRING ok,"OK";
STRING wait_txt,"Hang on a sec...";
STRING save_nix,"Problem saving... Is your hard disk full?";
STRING load_nix,"Sorry - no game found!
You may want to save a game
before you try to load it!";

STRING mblur_off,"Motion blur off";

STRING vol_plus,"Volume +";
STRING vol_minus,"Volume -";

STRING quit_yesno,"Quit? Y/N";
STRING qsav_yesno,"Quicksave? Y/N";
STRING qload_yesno,"Quickload? Y/N";

ACTION save_game {					
	SAVE_INFO	"INFO",0;			// save changed strings
	SET		EACH_TICK.10,load_status;	// to automatically reload the strings
							// after reloading a game
	SET		RESULT,0;			
	SET		screen_txt.STRING,ok;
	CALL		show_message;
	SAVE		"GAME",slot;			

	SET		EACH_TICK.10,NULL;
	IF_BELOW	RESULT,0;			
		SET	screen_txt.STRING,save_nix;
	SET	MOVE_MODE,1;
}

ACTION load_game {
	SET		screen_txt.STRING,wait_txt;
	SET		MESSAGES.14,screen_txt;
	WAIT		1;				// to display wait message before loading
	LOAD		"GAME",slot;
	SET		screen_txt.STRING,load_nix;	
	BRANCH	show_message;		
}

// Saves to the last saved slot
ACTION save_quick {
	IF_EQUAL	slot,0;	// not yet saved?
		BRANCH	save_menu;
	CALL	clear_menu;
	SET	screen_txt.STRING,qsav_yesno;
	SET	IF_Y, save_game;
	CALL	wait_yesno;
}

// Loads from the last selected slot
ACTION load_quick {
	IF_EQUAL	slot,0;
		BRANCH	load_menu;
	CALL	clear_menu;
	SET	screen_txt.STRING,qload_yesno;
	SET	IF_J, load_game;
	SET	IF_Y, load_game;
	SET	IF_Z, load_game;
	CALL	wait_yesno;
}

// after re-loading a game, reload all global parameters but gun & difficulty
ACTION load_status {
	WAIT	1;
	LOAD_INFO	"INFO",0;	// save changed strings
	SET	EACH_TICK.10,NULL;
	SET	MOVE_MODE,1;		// Player was freezed before
}

////////////////////////////////////////////////////
ACTION exit_yesno {
	CALL	clear_menu;
	SET	screen_txt.STRING,quit_yesno;
	SET	IF_J, exit_game;
	SET	IF_Y, exit_game;
	SET	IF_Z, exit_game;
	CALL	wait_yesno;
}

ACTION exit_game {
	BRANCH	act_MMSelectQuit;
	EXIT	"Thanks for playing Mr. Pibb-The 3D Interactive Game. (C) 1998, BrandGames.



";
}

ACTION toggle_map {
#	SET	MAP_ROT,1;
	SET	MAP_EDGE_Y1,100;
	SET	MAP_EDGE_Y2,300;
	SET	MAP_OFFSX,40;
	SET	MAP_OFFSY,40;

	ADD	MAP_MODE,0.5;
	IF_ABOVE	MAP_MODE,0.5;
		SET	MAP_MODE,0;
}
ACTION mscale_plus {
	IF_EQUAL	MAP_MODE,0;
		END;
	RULE		MAP_SCALE = MAP_SCALE * 1.1;
}
ACTION mscale_minus {
	IF_EQUAL	MAP_MODE,0;
		END;
	RULE		MAP_SCALE = MAP_SCALE * 0.9;
}

ACTION toggle_mblur {
	ADD	MOTION_BLUR,0.5;
	IF_ABOVE	MOTION_BLUR,0.5;
		SET	MOTION_BLUR,0;
	//SET		screen_txt.STRING,mblur_on;
	IF_EQUAL	MOTION_BLUR,0;
		SET	screen_txt.STRING,mblur_off;
	BRANCH	show_message;
}

ACTION increase_vol {
	ADD	SOUND_VOL,0.2;
	ADD	MUSIC_VOL,0.1;
	SET	screen_txt.STRING,vol_plus;
	BRANCH	show_message;
}
ACTION decrease_vol {
	ADD	SOUND_VOL,-0.2;
	ADD	MUSIC_VOL,-0.1;
	SET	screen_txt.STRING,vol_minus;
	BRANCH	show_message;
}

//////////////////////////////////////////////////
// Menu Data
//////////////////////////////////////////////////
STRING new_game_str,"New Game";
STRING load_game_str,"Load Game";
STRING save_game_str,"Save Game";
STRING quit_game_str,"Quit Game";
STRING show_option_str,"Help";
//STRING ToggleRes_str,"Reset/Change Res";

STRING name1_str,"** empty slot 1 **";
STRING name2_str,"** empty slot 2 **";
STRING name3_str,"** empty slot 3 **";
STRING name4_str,"** empty slot 4 **";
STRING name5_str,"** empty slot 5 **";

STRING option_str,"
Quicksave ......F2
Quickload ......F3
Map on/off .....TAB
Map zoom .......+ / -
Volume - .......F7
Volume + .......F8
Music on/off ...F12
Quit ...........F10

Movement ...... Arrows/Mouse
Use Item .......Ctrl/Left Mouse
Select Burp ......0
Select Mega Burp..1
Select Antidote...2
Jump .............Home
Crouch ...........End
Look Up...........PgUp
Look Down ........PgDn
";

ACTION show_options {
	CALL	clear_menu;
	SET	screen_txt.STRING,option_str;
	CALL	wait_yesno;
}

ACTION main_menu {
	CALL	clear_menu;
	SET	menu1_str,show_option_str;
	SET	menu2_str,new_game_str;
	SET	menu3_str,load_game_str;
	SET	menu4_str,save_game_str;
	SET	menu5_str,quit_game_str;
	//SET	menu6_str,ToggleRes_str;

	SET	menu1_act,show_options;
	SET	menu2_act,Start_NewGame;
	SET	menu3_act,load_menu;
	SET	menu4_act,save_menu;
	SET	menu5_act,exit_yesno;
	//SET	menu6_act,ToggleRes;
	SET	menu_pos.MAX,7;
	BRANCH	show_menu;
}

Action ToggleRes {
	IF_EQUAL	ResMode, 1; GOTO LowRes;
		//Beep;
		//SAVE,	"RES",1;
		LEVEL	<Pibb640.wdl>,"Pibb640.wrs";
		END;
LowRes:
	//BEEP;BEEP;
	//SAVE	"RES",0;
	LEVEL	<Pibb320.wdl>,	"Pibb320.wrs";
}	

ACTION save_menu {
	LOAD_INFO	"INFO",0;	// load score names
	CALL	clear_menu;
	SET	menu1_str,name1_str;
	SET	menu2_str,name2_str;
	SET	menu3_str,name3_str;
	SET	menu4_str,name4_str;
	SET	menu5_str,name5_str;
	SET	menu1_act,save_name1;
	SET	menu2_act,save_name2;
	SET	menu3_act,save_name3;
	SET	menu4_act,save_name4;
	SET	menu5_act,save_name5;
	SET	menu_pos.MAX,6;
	BRANCH	show_menu;
}

ACTION load_menu {
	LOAD_INFO	"INFO",0;	// load score names
	CALL	clear_menu;
	SET	menu1_str,name1_str;
	SET	menu2_str,name2_str;
	SET	menu3_str,name3_str;
	SET	menu4_str,name4_str;
	SET	menu5_str,name5_str;
	SET	menu1_act,load_name1;
	SET	menu2_act,load_name2;
	SET	menu3_act,load_name3;
	SET	menu4_act,load_name4;
	SET	menu5_act,load_name5;
	SET	menu_pos.MAX,6;
	BRANCH	show_menu;
}

ACTION save_name1 {
	SET		menu_pos.MIN,0;
	SET		menu_pos,0;	//stop blinking
	SET		slot,1;
	INKEY		name1_str;
	CALL		clear_menu;
	BRANCH	save_game;
}
ACTION save_name2 {
	SET		menu_pos.MIN,0;
	SET		menu_pos,0;
	SET		slot,2;
	INKEY		name2_str;
	CALL		clear_menu;
	BRANCH	save_game;
}
ACTION save_name3 {
	SET		menu_pos.MIN,0;
	SET		menu_pos,0;
	SET		slot,3;
	INKEY		name3_str;
	CALL		clear_menu;
	BRANCH	save_game;
}
ACTION save_name4 {
	SET		menu_pos.MIN,0;
	SET		menu_pos,0;
	SET		slot,4;
	INKEY		name4_str;
	CALL		clear_menu;
	BRANCH	save_game;
}
ACTION save_name5 {
	SET		menu_pos.MIN,0;
	SET		menu_pos,0;
	SET		slot,5;
	INKEY		name5_str;
	CALL		clear_menu;
	BRANCH	save_game;
}

ACTION load_name1 {
	SET		slot,1;
	CALL		clear_menu;
	BRANCH	load_game;
}
ACTION load_name2 {
	SET		slot,2;
	CALL		clear_menu;
	BRANCH	load_game;
}
ACTION load_name3 {
	SET		slot,3;
	CALL		clear_menu;
	BRANCH	load_game;
}
ACTION load_name4 {
	SET		slot,4;
	CALL		clear_menu;
	BRANCH	load_game;
}
ACTION load_name5 {
	SET		slot,5;
	CALL		clear_menu;
	BRANCH	load_game;
}
//////////////////////////////////////
// New Game depending on Video Mode
/////////////////////////////////////
ACTION start_NewGame {
	IF_EQUAL	ResMode,0; GOTO NewGameLow;	
	SAVE_INFO	"INFO",0;		// save current difficulty & gun_skill
	LEVEL		<Pibb640.wdl>,"Pibb.wrs";
	END;
NewGameLow:
	SAVE_INFO	"INFO",0;		// save current difficulty & gun_skill
	LEVEL		<Pibb320.wdl>,"Pibb.wrs";
}

//////////////////////////////////////////////////////////////
ACTION init_globals {
	LOAD_INFO	"INFO",0;	// get changed strings
}

//////////////////////////////////////////////////////////////
IF_ESC 		main_menu;
IF_F1		show_options;
IF_F2		save_quick;
IF_F3		load_quick;
IF_F5		toggle_mblur;
IF_F7		decrease_vol;
IF_F8		increase_vol;
IF_F10		exit_yesno;
IF_TAB		toggle_map;
IF_SZ		mscale_plus;
IF_PLUS		mscale_plus;
IF_APO		mscale_minus;
IF_MINUS	mscale_minus;

