//
//  RootViewController.m
//  Weico
//
//  Created by qianfeng on 12-12-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithTitle:@"left" 
                                                             style:UIBarButtonItemStylePlain 
                                                            target:self 
                                                            action:@selector(showLeft)];
    self.navigationItem.leftBarButtonItem = left;
    UIBarButtonItem * right = [[UIBarButtonItem alloc] initWithTitle:@"right" 
                                                               style:UIBarButtonItemStylePlain 
                                                              target:self 
                                                              action:@selector(showRight)];
    self.navigationItem.rightBarButtonItem = right;
    
    PPRevealSideInteractions panInter = PPRevealSideInteractionContentView | PPRevealSideInteractionNavigationBar;
    self.revealSideViewController.panInteractionsWhenClosed = panInter;
    
}

-(void)showLeft
{
    LeftViewController * l = [[[LeftViewController alloc] init] autorelease];
//    [self.revealSideViewController pushViewController:l onDirection:PPRevealSideDirectionLeft withOffset:120.0f animated:YES];
    [self.revealSideViewController pushViewController:l onDirection:PPRevealSideDirectionLeft animated:YES];
    
}

-(void)showRight
{
    RightViewController * r = [[[RightViewController alloc] init] autorelease];
//    [self.revealSideViewController pushViewController:r onDirection:PPRevealSideDirectionRight withOffset:260.0f animated:YES];
    [self.revealSideViewController pushViewController:r onDirection:PPRevealSideDirectionRight  animated:YES];
}

-(void)preloadLeft
{
    LeftViewController * l = [[[LeftViewController alloc] init] autorelease];
    [self.revealSideViewController preloadViewController:l forSide:PPRevealSideDirectionLeft];
    [self.revealSideViewController changeOffset:120.0 forDirection:PPRevealSideDirectionLeft];
}

-(void)preloadRight
{
    RightViewController * r = [[[RightViewController alloc] init] autorelease];
    [self.revealSideViewController preloadViewController:r forSide:PPRevealSideDirectionRight];
        [self.revealSideViewController changeOffset:260.0 forDirection:PPRevealSideDirectionRight];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(preloadLeft) object:nil];
    [self performSelector:@selector(preloadLeft) withObject:nil afterDelay:0.3];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(preloadRight) object:nil];
    [self performSelector:@selector(preloadRight) withObject:nil afterDelay:0.3];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
