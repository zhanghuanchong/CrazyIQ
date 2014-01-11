#include "WoodSwitch.h"

bool WoodSwitch::init(CCObject* target, SEL_CCControlHandler action, const char *onText, const char *offText)
{
	CCSprite *mask = CCSprite::create("image/switchMask.png");
	CCSprite *on = CCSprite::create("image/switchOn.png");
	CCSprite *off = CCSprite::create("image/switchOff.png");
	CCSprite *thumb = CCSprite::create("image/switchThumb.png");
	CCLabelTTF *onLabel = Util::createLabelTTF(onText, 30);
	onLabel->setColor(ccGREEN);
	CCLabelTTF *offLabel = Util::createLabelTTF(offText, 30);
	offLabel->setColor(ccRED);
	bool bRet = CCControlSwitch::initWithMaskSprite(mask, on, off, thumb, onLabel, offLabel);
	if (bRet && action)
	{
		this->addTargetWithActionForControlEvent(target, action, CCControlEventValueChanged);
	}
	return bRet;
}

WoodSwitch* WoodSwitch::create(int nFuncID)
{
	WoodSwitch *pRet = new WoodSwitch();
    if (pRet && pRet->init(NULL, NULL, Util::text("On"), Util::text("Off")))
    {
		pRet->addHandleOfControlEvent(nFuncID, CCControlEventValueChanged);
        pRet->autorelease();
        return pRet;
    }
    else
    {
        CC_SAFE_DELETE(pRet);
        return NULL;
    }
}

WoodSwitch* WoodSwitch::create(CCObject* target, SEL_CCControlHandler action)
{
	WoodSwitch *pRet = new WoodSwitch();
    if (pRet && pRet->init(target, action, Util::text("On"), Util::text("Off")))
    {
        pRet->autorelease();
        return pRet;
    }
    else
    {
        CC_SAFE_DELETE(pRet);
        return NULL;
    }
}

void WoodSwitch::ccTouchEnded( CCTouch *pTouch, CCEvent *pEvent )
{
	CCControlSwitch::ccTouchEnded(pTouch, pEvent);
	if (this->isOn()) 
	{
		Util::playEffect("sound/on.mp3");
	}
	else
	{
		Util::playEffect("sound/off.mp3");
	}
}
