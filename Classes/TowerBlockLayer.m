//
//  TowerBlockLayer.m
//  Tower Game
//
//  Created by svp on 12.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TowerBlockLayer.h"


@implementation TowerBlockLayer

-(void) draw
{
    CGSize s = [[CCDirector sharedDirector] winSize];
	glColor4ub(255,255,255,0);
    ccDrawCircle( ccp(s.width/2,  s.height/2), 50, 0, 50, NO);
}	

@end
