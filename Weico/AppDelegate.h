//
//  AppDelegate.h
//  Weico
//
//  Created by qianfeng on 12-12-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "LoginViewController.h"

#import "PPRevealSideViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, PPRevealSideViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PPRevealSideViewController * revealSlideViewController;
@end
