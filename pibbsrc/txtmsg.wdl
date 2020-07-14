
FONT	font_txt,<font_new.pcx>,8,16;

STRING  str_blank," ";
TEXT	text_TxtMsg{	POS_X 8;POS_Y 100;FONT	font_txt;STRING str_blank;}



SKILL	sk_txtmsgcounter{VAL 100;}

ACTION a_ResetText
{	SET		MESSAGES.1,		text_TxtMsg;
	SET		sk_txtmsgcounter,	0;
	SET		EACH_TICK.1,		a_TextMsgEachTick;
}

ACTION a_TextMsgEachTick
{	ADD		sk_txtmsgcounter,	1;
	IF_BELOW	sk_txtmsgcounter,	100;		END;
	SET		MESSAGES.1,		NULL;
	SET		EACH_TICK.1,		NULL;
}