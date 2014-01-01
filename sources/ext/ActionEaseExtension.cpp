#include "ActionEaseExtension.h"

/************************************************************************/
/* CCEaseCubicIn                                                        */
/************************************************************************/
CCObject* CCEaseCubicIn::copyWithZone( CCZone* pZone )
{
	CCZone* pNewZone = NULL;
    CCEaseCubicIn* pCopy = NULL;
    if(pZone && pZone->m_pCopyObject) 
    {
        //in case of being called at sub class
        pCopy = (CCEaseCubicIn*)(pZone->m_pCopyObject);
    }
    else
    {
        pCopy = new CCEaseCubicIn();
        pNewZone = new CCZone(pCopy);
    }

    pCopy->initWithAction((CCActionInterval *)(m_pInner->copy()->autorelease()));
    
    CC_SAFE_DELETE(pNewZone);
    return pCopy;
}

void CCEaseCubicIn::update( float time )
{
	time = time * time * time;
	this->m_pInner->update(time);
}

CCActionInterval* CCEaseCubicIn::reverse( void )
{
	return CCEaseCubicIn::create(m_pInner->reverse());
}

CCEaseCubicIn* CCEaseCubicIn::create(CCActionInterval *pAction)
{
    CCEaseCubicIn *pRet = new CCEaseCubicIn();
    if (pRet)
    {
        if (pRet->initWithAction(pAction))
        {
            pRet->autorelease();
        }
        else
        {
            CC_SAFE_RELEASE_NULL(pRet);
        }
    }

    return pRet;
}

/************************************************************************/
/* CCEaseCubicOut                                                       */
/************************************************************************/

CCObject* CCEaseCubicOut::copyWithZone( CCZone* pZone )
{
	CCZone* pNewZone = NULL;
    CCEaseCubicOut* pCopy = NULL;
    if(pZone && pZone->m_pCopyObject) 
    {
        //in case of being called at sub class
        pCopy = (CCEaseCubicOut*)(pZone->m_pCopyObject);
    }
    else
    {
        pCopy = new CCEaseCubicOut();
        pNewZone = new CCZone(pCopy);
    }

    pCopy->initWithAction((CCActionInterval *)(m_pInner->copy()->autorelease()));
    
    CC_SAFE_DELETE(pNewZone);
    return pCopy;
}

void CCEaseCubicOut::update( float time )
{
	time--;
	time = time * time * time + 1;
	this->m_pInner->update(time);
}

CCActionInterval* CCEaseCubicOut::reverse( void )
{
	return CCEaseCubicOut::create(m_pInner->reverse());
}

CCEaseCubicOut* CCEaseCubicOut::create(CCActionInterval *pAction)
{
    CCEaseCubicOut *pRet = new CCEaseCubicOut();
    if (pRet)
    {
        if (pRet->initWithAction(pAction))
        {
            pRet->autorelease();
        }
        else
        {
            CC_SAFE_RELEASE_NULL(pRet);
        }
    }

    return pRet;
}

/************************************************************************/
/* CCEaseCubicInOut                                                     */
/************************************************************************/

CCObject* CCEaseCubicInOut::copyWithZone( CCZone* pZone )
{
	CCZone* pNewZone = NULL;
    CCEaseCubicInOut* pCopy = NULL;
    if(pZone && pZone->m_pCopyObject) 
    {
        //in case of being called at sub class
        pCopy = (CCEaseCubicInOut*)(pZone->m_pCopyObject);
    }
    else
    {
        pCopy = new CCEaseCubicInOut();
        pNewZone = new CCZone(pCopy);
    }

    pCopy->initWithAction((CCActionInterval *)(m_pInner->copy()->autorelease()));
    
    CC_SAFE_DELETE(pNewZone);
    return pCopy;
}

void CCEaseCubicInOut::update( float time )
{
	float t = time;
    if ((t /= 0.5f) < 1) {
        time = 0.5f * t * t * t;
    } else {
        time = 0.5f * ((t -= 2) * t * t + 2);
    }
	this->m_pInner->update(time);
}

CCActionInterval* CCEaseCubicInOut::reverse( void )
{
	return CCEaseCubicInOut::create(m_pInner->reverse());
}

CCEaseCubicInOut* CCEaseCubicInOut::create(CCActionInterval *pAction)
{
    CCEaseCubicInOut *pRet = new CCEaseCubicInOut();
    if (pRet)
    {
        if (pRet->initWithAction(pAction))
        {
            pRet->autorelease();
        }
        else
        {
            CC_SAFE_RELEASE_NULL(pRet);
        }
    }

    return pRet;
}
