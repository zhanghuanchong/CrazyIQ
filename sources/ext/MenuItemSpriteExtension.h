#pragma once
#include "CrazyIQ.h"

class MenuItemSpriteExtension :
	public CCMenuItemSprite
{
private:
	int m_selectedCallback;
	int m_unselectedCallback;

public:
	static MenuItemSpriteExtension* create(CCNode* normalSprite, CCNode* selectedSprite);

	void setSelectedCallback(int callback);

	void setUnselectedCallback(int callback);

	virtual void selected();

	virtual void unselected();

};

