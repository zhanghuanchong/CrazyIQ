#include "Util.h"
#include "ActionEaseExtension.h"
#include "TransitionExtension.h"

CCDirector* Util::director;
CCSize Util::size = CCSizeZero;
CCPoint Util::origin = CCPointZero;
CCNotificationCenter* Util::notificationCenter;
CCSpriteFrameCache* Util::spriteFrameCache;
SimpleAudioEngine* Util::audioEngine;
CCUserDefault *Util::userDefault;
CCDictionary* Util::lang;
CCArray *Util::woodSceneStack;
const char * Util::fontName;
CCSize Util::designResolutionSize = cocos2d::CCSizeMake(640, 960);
bool Util::isEffectEnabled = true;

void Util::init()
{
	Util::director = CCDirector::sharedDirector();
	Util::notificationCenter = CCNotificationCenter::sharedNotificationCenter();
	Util::spriteFrameCache = CCSpriteFrameCache::sharedSpriteFrameCache();
	Util::audioEngine = SimpleAudioEngine::sharedEngine();
	Util::userDefault = CCUserDefault::sharedUserDefault();

	Util::size = Util::director->getVisibleSize();
	Util::origin = Util::director->getVisibleOrigin();

	Util::woodSceneStack = CCArray::create();
	Util::woodSceneStack->retain();
	
	Util::lang = CCDictionary::createWithContentsOfFile("i18n/zh-CN.xml");
	Util::lang->retain();

#if (CC_TARGET_PLATFORM == CC_PLATFORM_WIN32)
	Util::fontName = "HOPE";
#else
	Util::fontName = "HOPE.ttf";
#endif

	Util::isEffectEnabled = Util::userDefault->getBoolForKey(kConfigEffect, true);
}

void Util::pushWoodScene(CCScene *scene)
{
	CCScene *oldScene = Util::director->getRunningScene();
	Util::woodSceneStack->addObject(oldScene);
	CCScene *newScene = CCTransitionMoveInBackR::create(0.5f, scene);
	Util::director->replaceScene(newScene);
}

cocos2d::CCScene* Util::popWoodScene()
{
	CCArray *stack = Util::woodSceneStack;
	if (stack->count() <= 0)
	{
		return NULL;
	}
	CCScene *oldScene = Util::director->getRunningScene();

	CCScene *scene = (CCScene *)stack->lastObject();
	CCTransitionScene *transitionScene = CCTransitionMoveOutBackR::create(0.5f, scene);
	Util::director->replaceScene(transitionScene);

	Util::woodSceneStack->removeLastObject(false);

	return oldScene;
}

const char * Util::text( const char *key )
{
	CCString *c = (CCString *)Util::lang->objectForKey(key);
	if (c)
	{
		return c->getCString();
	}
	return key;
}

cocos2d::CCSize Util::p( float x, float y )
{
	CCPoint o = Util::origin;
	return ccp(o.x + x, o.y + y);
}

CCLabelTTF *Util::createLabelTTF(const char *text, float fontSize)
{
	CCLabelTTF *label = CCLabelTTF::create(Util::text(text), Util::fontName, fontSize);
	return label;
}

void Util::playEffect(const char *effect)
{
	if (Util::isEffectEnabled)
	{
		Util::audioEngine->playEffect(effect);
	}
}