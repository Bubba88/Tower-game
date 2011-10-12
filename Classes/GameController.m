//
//  GameController.m
//  Tower Game
//
//  Created by svp on 12.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameController.h"


@implementation GameController

@synthesize gameLayer;
@synthesize blockCount;
@synthesize height;
@synthesize towerCentre;
@synthesize headWidth;

-(void) startGame {
	[self.gameLayer setupInitialMovement];
}

-(void) positionPickWithX:(float)x Y:(float)y {
	if (abs(self.towerCentre - x) <= (50 + self.headWidth/2)) {
		// continue
		[self.gameLayer trimHeadBlock];
		[self.gameLayer pushMovingBlockWithHeight: self.height];
	} else {
		
	}
	
}

-(void) gameEnd {
}

@end
