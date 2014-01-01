#pragma once

#include "CrazyIQ.h"

/**********************************************************************************************//**
 * @class	CCTransitionMoveInBackR
 *
 * @brief	A Cc transition move in back r.
 *
 * @author	Huanchong
 * @date	11/24/2013
 **************************************************************************************************/

class CCTransitionMoveInBackR :
	public CCTransitionMoveInR
{
public:
	virtual CCActionInterval* easeActionWithAction(CCActionInterval * action);

    static CCTransitionMoveInBackR* create(float t, CCScene* scene);
};

/**********************************************************************************************//**
 * @class	CCTransitionMoveOutBackR
 *
 * @brief	A Cc transition move out back r.
 *
 * @author	Huanchong
 * @date	11/24/2013
 **************************************************************************************************/

class CCTransitionMoveOutBackR :
	public CCTransitionScene, public CCTransitionEaseScene
{
public:
	virtual void sceneOrder();
	virtual CCActionInterval* easeActionWithAction(CCActionInterval * action);

	static CCTransitionMoveOutBackR* create(float t, CCScene* scene);

	virtual void onEnter();

};
