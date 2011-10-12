//
//  GameController.h
//  Tower Game
//
//  Created by svp on 12.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameLayer.h"

@class GameLayer;

@interface GameController : NSObject {
	GameLayer* gameLayer;
	int height;
	int blockCount;
	int headWidth;
	int towerCentre;
}

@property (nonatomic, retain) GameLayer* gameLayer;
@property (readwrite, assign) int height;
@property (readwrite, assign) int blockCount;
@property (readwrite, assign) int headWidth;
@property (readwrite, assign) int towerCentre;

-(void) startGame;

-(void) positionPickWithX:(float)x Y:(float)y;

-(void) gameEnd;

@end
