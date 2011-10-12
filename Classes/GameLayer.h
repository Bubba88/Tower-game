//
//  HelloWorldLayer.h
//  Tower Game
//
//  Created by svp on 12.10.11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "TowerBlockLayer.h"
#import "GameController.h"

@class TowerBlockLayer;
@class GameController;

// HelloWorldLayer
@interface GameLayer : CCLayer
{
	GameController* controller;
	CCSprite* currentBlock;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(void) setupInitialMovement;
-(void) pushMovingBlockWithHeight: (int)height;
-(void) trimHeadBlock;

@property(nonatomic, retain) GameController* controller;
@property(nonatomic, retain) CCSprite* currentBlock;

@end
