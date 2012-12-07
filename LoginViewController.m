//
//  LoginViewController.m
//  Weico
//
//  Created by qianfeng on 12-12-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc
{
    [login_avarta_weiboView release];
    [loginLabel release];
    
    [signup_avarta_weiboView release];
    [signupLabel release];
    
    [login_back release];
    [login_ok release];
    
    [nameField release];
    [passwordField release];
    
    [super dealloc];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    sinaOAuthManager = [[SinaOAuthManager alloc] init];
    
    UIImageView * login_bgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    login_bgView.image = [UIImage imageNamed:@"login_bg.jpg"];
    [self.view addSubview:login_bgView];
    [login_bgView release];
    
    UIImageView * login_logoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50.0f, 50.0f)];
    login_logoView.center = CGPointMake(160.0f, 90.0f);
    login_logoView.image = [UIImage imageNamed:@"login_logo.png"];
    [self.view addSubview:login_logoView];
    [login_logoView release];
    
    //登陆的按钮   
    login_avarta_weiboView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_avarta_weibo.jpg"]];
    login_avarta_weiboView.center = CGPointMake(100, 200);
    login_avarta_weiboView.bounds = CGRectMake(0, 0, 55, 55);    
    login_avarta_weiboView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:login_avarta_weiboView];
    
    
    UIImageView * login_ball_lightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_ball.png"] highlightedImage:[UIImage imageNamed:@"login_ball_light.png"]];
    login_ball_lightView.bounds = CGRectMake(0, 0, 74, 74);
    login_ball_lightView.center = CGPointMake(27.5, 27.5);
    [login_avarta_weiboView addSubview:login_ball_lightView];
    [login_ball_lightView release];
    
    login_avarta_weiboView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapForLogin = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapForLogin1)];
    [login_avarta_weiboView addGestureRecognizer:tapForLogin];
    [tapForLogin release];
    
    loginLabel = [[UILabel alloc] initWithFrame:CGRectMake(73, 228, 60, 30)];
    loginLabel.text = @"登陆微博";
    loginLabel.font = [UIFont systemFontOfSize:13];
    loginLabel.adjustsFontSizeToFitWidth = YES;
    loginLabel.backgroundColor = [UIColor clearColor];
    loginLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:loginLabel];
    
    
    //注册的按钮
    signup_avarta_weiboView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_avarta_weibo.jpg"]];
    signup_avarta_weiboView.center = CGPointMake(220, 200);
    signup_avarta_weiboView.bounds = CGRectMake(0, 0, 55, 55);    
    signup_avarta_weiboView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:signup_avarta_weiboView];
    
    
    UIImageView * signup_ball_lightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_ball.png"] highlightedImage:[UIImage imageNamed:@"login_ball_light.png"]];
    signup_ball_lightView.bounds = CGRectMake(0, 0, 74, 74);
    signup_ball_lightView.center = CGPointMake(27.5, 27.5);
    [signup_avarta_weiboView addSubview:signup_ball_lightView];
    [signup_ball_lightView release];
    
    signup_avarta_weiboView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tapForSignup = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapForSignup)];
    [signup_avarta_weiboView addGestureRecognizer:tapForSignup];
    [tapForSignup release];
    
    signupLabel = [[UILabel alloc] initWithFrame:CGRectMake(189, 228, 70, 30)];
    signupLabel.text = @"注册新用户";
    signupLabel.font = [UIFont systemFontOfSize:13];
    signupLabel.adjustsFontSizeToFitWidth = YES;
    signupLabel.backgroundColor = [UIColor clearColor];
    signupLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:signupLabel];
    
}

-(void)tapForSignup
{
//应该是打开UIWebView页面
}

-(void)getAuth
{
    [sinaOAuthManager login];
    NSLog(@"qqq");
    return;
}

-(void)loginView
{
    //添加确定按钮
    login_ok = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 48, 48)];
    login_ok.center = CGPointMake(320-26, 30);
    [login_ok setBackgroundImage:[UIImage imageNamed:@"login_ok.png"] forState:UIControlStateNormal];
    [login_ok addTarget:self action:@selector(getAuth) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:login_ok];
    
    //添加登陆信息框
    nameField = [[UITextField alloc] initWithFrame:CGRectMake(65, 135, 190, 38)];
    nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    UIImage * imageWhitePaper = [UIImage imageNamed:@"login_inputbar.png"];
    UIImage * stretchableWhitePaper = [imageWhitePaper stretchableImageWithLeftCapWidth:15 topCapHeight:10];
    nameField.background = stretchableWhitePaper;
    nameField.borderStyle = UITextBorderStyleRoundedRect;
    nameField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    nameField.placeholder = @"新浪微博账号";
    nameField.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:nameField];
    
    passwordField = [[UITextField alloc] initWithFrame:CGRectMake(65, 184, 190, 38)];
    passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordField.background = stretchableWhitePaper;
    passwordField.borderStyle = UITextBorderStyleRoundedRect;
    passwordField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    passwordField.placeholder = @"账号密码";
    passwordField.font = [UIFont systemFontOfSize:15];
    passwordField.secureTextEntry = YES;
    [self.view addSubview:passwordField];
    
    
}

-(void)backButtonClicked
{
    [self moveBack1];

}

-(void)moveBack1
{
    [login_back removeFromSuperview];
    [login_ok removeFromSuperview];
    [nameField removeFromSuperview];
    [passwordField removeFromSuperview];
    
    [UIView beginAnimations:@"goDown" context:NULL];
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
    [UIView setAnimationDuration:1.0];
    //    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    login_avarta_weiboView.center = CGPointMake(160, 200);
    
    [UIView commitAnimations];

}

-(void)originalView
{
    [self.view addSubview:loginLabel];
    [self.view addSubview:signup_avarta_weiboView];
    [self.view addSubview:signupLabel];

}

-(void)moveBack2
{
    [UIView beginAnimations:@"goRight" context:NULL];
    [UIView setAnimationDuration:1.0];
    
    //    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    login_avarta_weiboView.center = CGPointMake(100, 200);

    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(originalView)];

    [UIView commitAnimations];

    login_avarta_weiboView.userInteractionEnabled = YES;
}

/**
 登陆图标动画，使用两段动画使动画效果平滑
 
 */
-(void)tapForLogin1
{
    //移除多余的view
    [loginLabel removeFromSuperview];
    [signup_avarta_weiboView removeFromSuperview];
    [signupLabel removeFromSuperview];
    
    //添加返回按钮
    login_back = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 48, 48)];
    login_back.center = CGPointMake(26, 30);
    [login_back setBackgroundImage:[UIImage imageNamed:@"login_back.png"] forState:UIControlStateNormal];
    [login_back addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:login_back];
    [login_back release];
    
    [UIView beginAnimations:@"goRight" context:NULL];
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
    [UIView setAnimationDuration:1.0];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    login_avarta_weiboView.center = CGPointMake(160, 200);
    
    [UIView commitAnimations];
    login_avarta_weiboView.userInteractionEnabled = NO;
}

-(void)tapForLogin2
{
    [UIView beginAnimations:@"goUp" context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(loginView)];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    login_avarta_weiboView.center = CGPointMake(160, 90);
    [UIView commitAnimations];
    
}



- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    if ([animationID isEqualToString:@"goRight"]) {
        if ([finished boolValue]) {
            [self tapForLogin2];
        }
    }
    if ([animationID isEqualToString:@"goDown"]) {
        if ([finished boolValue]) {
            [self moveBack2];
        }
    }

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
