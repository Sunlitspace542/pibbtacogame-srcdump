STRING  str_hkey01,"have key01";
STRING  str_hkey02,"have key02";
STRING  str_hkey03,"have key03";
STRING  str_hkey04,"have gold key";

STRING  str_mkey01,"missing key01";
STRING  str_mkey02,"missing key02";
STRING  str_mkey03,"missing key03";
STRING  str_mkey04,"missing gold key";
STRING  str_Stats,":Zombies converted
:Friends slimed
:Powerups found
:Current  Score";

STRING  str_placeholder,"";

TEXT	text_Stats{	POS_X 190;  POS_Y 310;FONT font_txt;STRING str_Stats;}

TEXT	text_Key01{	POS_X 175;POS_Y 210;FONT font_txt;STRING str_placeholder;}
TEXT	text_Key02{	POS_X 175;POS_Y 230;FONT font_txt;STRING str_placeholder;}
TEXT	text_Key03{	POS_X 175;POS_Y 250;FONT font_txt;STRING str_placeholder;}
TEXT	text_Key04{	POS_X 175;POS_Y 270;FONT font_txt;STRING str_placeholder;}

//Door01havekey 
//Key01DoorHavekey 
//Key02DoorHavekey 
//Key03DoorHavekey 

PANEL	panel_Inventory	
{//	PAN_MAP	map_Inventory;
	POS_X, 0;
	POS_Y, 0;
	FLAGS	REFRESH, TRANSPARENT;

	//DIGITS	x,y,len,font,fac,skill;
	DIGITS	160, 310,3,menu_font,1.0, sk_ZombieKills;	
	DIGITS	160, 326,3,menu_font,1.0, sk_FriendKills;	
	DIGITS	160, 342,3,menu_font,1.0, sk_PowerupCnt;	
	DIGITS	160, 358,3,menu_font,1.0, sk_Score;	
}

ACTION act_start_Inventory
{	//EXIT;
	SET 		IF_I, 		act_end_Inventory;
	RULE	sk_score = 100 * ( ((sk_ZombieKills/64)*0.5) + ((sk_PowerupCnt/22)*0.5) - ((sk_FriendKills/64)*0.25) );
	
	SET		PANELS.2,	panel_Inventory;
	IF_EQUAL  Key01DoorHavekey,1;	SET	text_Key01.STRING, str_hkey01;
	IF_NEQUAL Key01DoorHavekey,1;	SET	text_Key01.STRING, str_mkey01;
	IF_EQUAL  Key02DoorHavekey,1;	SET	text_Key02.STRING, str_hkey02;
	IF_NEQUAL Key02DoorHavekey,1;	SET	text_Key02.STRING, str_mkey02;
	IF_EQUAL  Key03DoorHavekey,1;	SET	text_Key03.STRING, str_hkey03;
	IF_NEQUAL Key03DoorHavekey,1;	SET	text_Key03.STRING, str_mkey03;
 	IF_EQUAL  Door01havekey   ,1;	SET	text_Key04.STRING, str_hkey04;
	IF_NEQUAL Door01havekey   ,1;	SET	text_Key04.STRING, str_mkey04;
 	SET	MESSAGES.5,	text_Key01;
 	SET	MESSAGES.6,	text_Key02;
 	SET	MESSAGES.7,	text_Key03;
 	SET	MESSAGES.8,	text_Key04;
	SET	MESSAGES.9, 	text_Stats;
}

ACTION act_end_Inventory
{	SET 		IF_I, 		act_start_Inventory;
	SET		PANELS.2,	NULL;
	SET		MESSAGES.5,	NULL;
	SET		MESSAGES.6,	NULL;
	SET		MESSAGES.7,	NULL;
	SET		MESSAGES.8,	NULL;
	SET		MESSAGES.9, 	NULL;
}