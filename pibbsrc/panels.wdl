//panell definitions

//FONT	menu_font,<font_amb.lbm>,8,16;
FONT	menu_font,<font_new.pcx>,8,16;

STRING  str_Welcome,
"Mr. Pibb-The 3D Interactive Game 
        (V 1.0)";
STRING  str_Health, 		"Strength :";
STRING  str_Spitballs, 		"Mega Burp:";
STRING  str_RubberBands, 	"Antidote :";

TEXT	text_Welcome 	{POS_X   8;POS_Y 100;FONT menu_font;STRING str_Welcome;}
TEXT	text_Health  	{POS_X   8;POS_Y  7;FONT menu_font;STRING  str_Health;}
TEXT	text_Spitballs  {POS_X   8;POS_Y  27;FONT menu_font;STRING str_Spitballs;}
TEXT	text_RubberBands{POS_X   8;POS_Y  47;FONT menu_font;STRING str_RubberBands;}

BMAP	map_status	<statbox.pcx>;

PANEL	statusBar
{	PAN_MAP	map_status;
	POS_X	0;
	POS_Y	0;
	FLAGS	REFRESH, TRANSPARENT;

	//DIGITS	x,y,len,font,fac,skill;
	DIGITS	90, 7,3,menu_font,1.0,sk_health;
	DIGITS	90, 27,3,menu_font,1.0,sk_spitball;
	DIGITS	90, 47,3,menu_font,1.0,sk_RBand;
}

BMAP	map_score	<EndWin.pcx>;

PANEL	panel_Score
{	PAN_MAP	map_score;
	POS_X	10;
	POS_Y	80;
	FLAGS	REFRESH, TRANSPARENT;

	//DIGITS	x,y,len,font,fac,skill;
	DIGITS	130, 167,3,menu_font,1.0, sk_ZombieKills;	
	DIGITS	130, 196,3,menu_font,1.0, sk_FriendKills;	
	DIGITS	130, 224,3,menu_font,1.0, sk_PowerupCnt;	
	DIGITS	130, 254,3,menu_font,1.0, sk_score;	
}

SKILL	sk_ZombieKills	{VAL	0;}
SKILL	sk_FriendKills	{VAL	0;}
SKILL	sk_PowerupCnt	{VAL	0;}
SKILL	sk_score	{VAL 	0;}

BMAP	map_losescore	<EndLose.pcx>;
SKILL	ScoreX {Val 	10;}
SKILL	ScoreY {VAL	80;}

PANEL	panel_LoseScore
{	PAN_MAP	map_losescore;
	POS_X, 10;
	POS_Y, 80;
	FLAGS	REFRESH, TRANSPARENT;

	//DIGITS	x,y,len,font,fac,skill;
	DIGITS	130, 167,3,menu_font,1.0, sk_ZombieKills;	
	DIGITS	130, 196,3,menu_font,1.0, sk_FriendKills;	
	DIGITS	130, 224,3,menu_font,1.0, sk_PowerupCnt;	
	DIGITS	130, 254,3,menu_font,1.0, sk_Score;	
}