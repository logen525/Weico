//
//  TencentOAuthManager.h
//  BookShare
//
//  Created by Yang QianFeng on 21/9/12.
//  Copyright (c) 2012 千锋3G www.mobiletrain.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OAuthManager.h"

@interface TencentOAuthManager : OAuthManager

- (id) init;

- (NSDictionary *) getCommonParams;
- (NSString *) getOAuthDomain;

- (TokenModel *) readTokenFromStorage;
- (void) writeTokenToStorage:(TokenModel *)tokenModel;

@end
