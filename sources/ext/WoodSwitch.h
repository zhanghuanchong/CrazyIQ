#pragma once
#include "Util.h"

class WoodSwitch :
	public CCControlSwitch
{
public:
	static WoodSwitch* create(int nFuncID);

	static WoodSwitch* create(CCObject* target, SEL_CCControlHandler action);

	virtual bool init(CCObject* target, SEL_CCControlHandler action, const char *onText, const char *offText);

	virtual void ccTouchEnded( CCTouch *pTouch, CCEvent *pEvent );
};

