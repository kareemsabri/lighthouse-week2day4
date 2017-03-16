//
//  User.m
//  Lighthouse-Week2Day4
//
//  Created by Kareem Sabri on 2017-03-16.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.updateEventName = @"didUpdateUser";
    }
    return self;
}

@end
