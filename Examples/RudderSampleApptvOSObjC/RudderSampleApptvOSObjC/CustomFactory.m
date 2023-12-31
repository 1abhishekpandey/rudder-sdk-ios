//
//  _CustomFactory.m
//  Rudder_Example
//
//  Created by Abhishek Pandey on 09/08/21.
//  Copyright © 2021 arnabp92. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Rudder/Rudder.h>
#import "CustomFactory.h"
#import "CustomIntegration.h"


@implementation CustomFactory

+ (instancetype)instance {
    static CustomFactory *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    return self;
}

- (nonnull NSString *)key {
    return @"Custom Factory";
}

- (nonnull id<RSIntegration>)initiate:(NSDictionary *)config client:(nonnull RSClient *)client rudderConfig:(nonnull RSConfig *)rudderConfig {
    return [[CustomIntegration alloc] initWithConfig:config withAnalytics:client];
}


@end
