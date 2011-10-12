//
//  Tower_GameAppDelegate.h
//  Tower Game
//
//  Created by svp on 12.10.11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface Tower_GameAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
