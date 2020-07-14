
SKILL	s_ForceGravity	{}
SKILL	s_ForceFriction	{}


ACTION a_MoveWithGravity
{	//	F = m*a
	//	x = x + v*t + a*t*t/2
	//	v = v + a*t
	//  t = 1/16

	//  2*t*t = 1/512
	//	a = -32 = - 16 * 2
	//  a/(2*t*t) = -(16 * 2) / (2*16*16) = -1/16
	//	x = x + v/16 - 1/16
	//	this works for 	s_AccelGravity = 32 ft/sec
	//	MY.SKILL1 = vertical velocity of the object

	IF_BELOW MY.HEIGHT,ACTOR_FLOOR_HGT;
		GOTO label_underground;
	
	IF_BELOW MY.HEIGHT,ACTOR_CEIL_HGT;
		GOTO label_air;

label_above_ceiling:
		RULE MY.SKILL1 = MY.SKILL1 - 10;						//	v = v + a*t
		RULE MY.HEIGHT = MY.HEIGHT + (MY.SKILL1 - 1)/16;	//	x = x + v*t + a*t*t/2		
		END;

label_air:
		RULE MY.SKILL1 = MY.SKILL1 - 1;//2;						//	v = v + a*t
		RULE MY.HEIGHT = MY.HEIGHT + (MY.SKILL1 - 1)/16;	//	x = x + v*t + a*t*t/2
		END;
		         
label_underground:
		RULE MY.SKILL1 = MY.SKILL1 + 10;						//	v = v + a*t
		RULE MY.HEIGHT = MY.HEIGHT + (MY.SKILL1 - 1)/16;	//	x = x + v*t + a*t*t/2
}

SKILL	s_var1			{}
SKILL	s_rLaunchSpeed	{}
SKILL	s_Math_Return	{}
SKILL	s_rPlayerAngle	{}

ACTION a_LaunchProjectile
{	
//atan is not working
//calculate true angle from PLAYER_TILT
	SET	s_var1,			PLAYER_TILT;
	CALL	a_Math_ArcTangent;
	SET	s_rPlayerAngle,		s_Math_Return;

//calculate vertical speed
	SIN	s_var1,			s_rPlayerAngle;
	RULE	MY.SKILL1 = 		s_rLaunchSpeed * s_var1 +8;

//calculate horizontal speed
	RULE	MY.SPEED  =		MY.SKILL1 * PLAYER_TILT;

	SET	MY.SPEED,		s_rLaunchSpeed;
}
///******************************************
///******************************************
///******************************************

SKILL	s_angle			{}	
ACTION a_Math_Cosine
{	SET		s_angle,		s_var1;
	ADD		s_angle,		1.571;		//	PI/2
	SIN		s_Math_Return,	s_angle;
}

ACTION a_Math_ArcCosine
{	
	ASIN	s_Math_Return,	s_var1;
	ADD		s_Math_Return,	-1.571;
}

SKILL	s_top		{}
SKILL	s_bottom	{}
ACTION a_Math_Tangent
{	
	
	SIN		s_top,		s_var1;

	CALL	a_Math_Cosine;
	SET		s_bottom,	s_Math_Return;
	
	RULE	s_Math_Return = s_top / s_bottom;
}

ACTION a_Math_ArcTangent
{
	SET		s_Math_Return,	0;
}