#include "TransitionExtension.h"

CCActionInterval* CCTransitionMoveInBackR::easeActionWithAction(CCActionInterval * action) 
{
	return CCEaseBackOut::create(action);
}

CCTransitionMoveInBackR* CCTransitionMoveInBackR::create(float t, CCScene* scene)
{
	CCTransitionMoveInBackR* pScene = new CCTransitionMoveInBackR();
	if (pScene && pScene->initWithDuration(t, scene))
	{
		pScene->autorelease();
		return pScene;
	}
	CC_SAFE_DELETE(pScene);
	return NULL;
}


void CCTransitionMoveOutBackR::onEnter()
{
	CCTransitionScene::onEnter();
	this->m_pInScene->setPosition(0, 0);

	CCActionInterval *a = CCMoveTo::create(this->m_fDuration, CCPoint(CCDirector::sharedDirector()->getVisibleSize().width, 0));

	this->m_pOutScene->runAction
	(
		CCSequence::create(
			this->easeActionWithAction(a), 
			CCCallFunc::create(this, callfunc_selector(CCTransitionScene::finish)),
			NULL
		)
	);
}

void CCTransitionMoveOutBackR::sceneOrder()
{
	this->m_bIsInSceneOnTop = false;
}

CCActionInterval* CCTransitionMoveOutBackR::easeActionWithAction( CCActionInterval * action )
{
	return CCEaseBackIn::create(action);
}

CCTransitionMoveOutBackR* CCTransitionMoveOutBackR::create( float t, CCScene* scene )
{
	CCTransitionMoveOutBackR* pScene = new CCTransitionMoveOutBackR();
	if (pScene && pScene->initWithDuration(t, scene))
	{
		pScene->autorelease();
		return pScene;
	}
	CC_SAFE_DELETE(pScene);
	return NULL;
}
