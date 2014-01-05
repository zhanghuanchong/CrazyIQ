#pragma once

#include "CrazyIQ.h"

class Util :
	public cocos2d::CCObject
{
public:
	static CCDirector *director;
	static CCSize size;
	static CCPoint origin;
	static CCNotificationCenter *notificationCenter;
	static CCSpriteFrameCache *spriteFrameCache;
	static SimpleAudioEngine *audioEngine;
	static CCUserDefault *userDefault;

	static CCDictionary *lang;
	static const char *fontName;
	static CCSize designResolutionSize;
	static bool isEffectEnabled;

private:
	static CCArray *woodSceneStack;

public:
	static void init();

	static const char *text(const char *key);
	static CCSize p(float x, float y);

	static CCLabelTTF *createLabelTTF(const char *text, float fontSize = 35);

	static void pushWoodScene(CCScene *scene);
	static CCScene* popWoodScene();

	static void playEffect(const char *effect);
};

