//
//  HelloWorldLayer.m
//  Tower Game
//
//  Created by svp on 12.10.11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// Import the interfaces
#import "GameLayer.h"
#import "cocos2d.h"


// HelloWorldLayer implementation
@implementation GameLayer

@synthesize controller;
@synthesize currentBlock;

-(void) setupInitialMovement {
	// initially positioned reference block
	CCSprite *firstBlock = [CCSprite spriteWithFile:@"lego.gif"];
	
	CGSize size = [[CCDirector sharedDirector] winSize];
	firstBlock.position =  ccp( size.width /3 , 25 );
	
	[self addChild: firstBlock];
	
	// start the movement
	self.controller.height = 50;
	self.controller.blockCount = 1;
	self.controller.towerCentre = size.width/3;
	self.controller.headWidth = 100;
	
	[self pushMovingBlockWithHeight: self.controller.height];
	
}

-(void) trimHeadBlock {
	float newWidth = self.controller.headWidth;
	float newCentre = self.controller.towerCentre;
	
	float currentBlockLeftEdgeX = self.currentBlock.position.x - 50;
	float currentBlockRightEdgeX = currentBlockLeftEdgeX + 100;
	
	float towerLeftEdgeX = self.controller.towerCentre - self.controller.headWidth/2;
	float towerRightEdgeX = towerLeftEdgeX + self.controller.headWidth;
	
	float diff = currentBlockLeftEdgeX - towerLeftEdgeX;
	
	if (diff > 0) {
		newWidth = newWidth - diff;
		newCentre = currentBlockLeftEdgeX + newWidth/2;
	}
	
	diff = towerRightEdgeX - currentBlockRightEdgeX;
	
	if (diff > 0) {
		newWidth = newWidth - diff;
		newCentre = currentBlockRightEdgeX - newWidth/2;
	}
	
	
	float offset = -(self.currentBlock.position.x - self.controller.towerCentre);
	if (offset < 0) {
		offset = 0;
	}
	
	CCSprite *replacement = [CCSprite spriteWithFile:@"lego.gif" rect:CGRectMake(
																				 offset,
																				 0,
																				 newWidth,
																				 50)];
	
	replacement.position = ccp(newCentre, self.currentBlock.position.y);
	[self addChild: replacement];
	[self removeChild:self.currentBlock cleanup:YES]; 
	self.controller.towerCentre = newCentre;
	self.controller.headWidth = newWidth;
	
}

-(void) pushMovingBlockWithHeight: (int)height {
	CCSprite *block = [CCSprite spriteWithFile:@"lego.gif"];
	
	CGSize size = [[CCDirector sharedDirector] winSize];
	block.position =  ccp( size.width - 50 , height + 25 );
	
	[self addChild: block];
	
	CCMoveBy *left = [CCMoveBy actionWithDuration:size.width/250 position:ccp(-size.width+100,0) ];
    CCMoveBy *right = [CCMoveBy actionWithDuration:size.width/250 position:ccp(size.width-100, 0) ];
	
    CCSequence *leftright = [CCSequence actionOne:left two:right];
    CCRepeatForever *repeat = [CCRepeatForever actionWithAction:leftright];
	
	[block runAction:repeat];
	
	self.currentBlock = block;
	self.controller.height += 50;
	self.controller.blockCount += 1;
}

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		self.controller = [GameController new];
		self.controller.gameLayer = self;
		[self.controller startGame];
		
		self.isTouchEnabled = YES;
		
		// create and initialize a Label
		/*CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Verdana" fontSize:64];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];*/
	}
	return self;
}

- (void)ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
	[[CCActionManager sharedManager ] removeAllActionsFromTarget:self.currentBlock];
	[self.controller positionPickWithX:self.currentBlock.position.x Y:self.currentBlock.position.y];
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
