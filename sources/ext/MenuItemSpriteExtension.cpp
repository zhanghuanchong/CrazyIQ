#include "MenuItemSpriteExtension.h"

void MenuItemSpriteExtension::setSelectedCallback(int callback)
{
	m_selectedCallback = callback;
}

void MenuItemSpriteExtension::setUnselectedCallback(int callback)
{
	m_unselectedCallback = callback;
}

void MenuItemSpriteExtension::selected()
{
	CCMenuItemSprite::selected();
	if (m_selectedCallback)
	{
		CCLuaStack *stack = CCLuaEngine::defaultEngine()->getLuaStack();
		stack->clean();
		stack->executeFunctionByHandler(m_selectedCallback, 0);
	}
}

void MenuItemSpriteExtension::unselected()
{
	CCMenuItemSprite::unselected();
	if (m_unselectedCallback)
	{
		CCLuaStack *stack = CCLuaEngine::defaultEngine()->getLuaStack();
		stack->clean();
		stack->executeFunctionByHandler(m_unselectedCallback, 0);
	}
}

MenuItemSpriteExtension *MenuItemSpriteExtension::create(CCNode* normalSprite, CCNode* selectedSprite)
{
	MenuItemSpriteExtension *pRet = new MenuItemSpriteExtension();
    pRet->initWithNormalSprite(normalSprite, selectedSprite, NULL, NULL, NULL); 
    pRet->autorelease();
    return pRet;
}
