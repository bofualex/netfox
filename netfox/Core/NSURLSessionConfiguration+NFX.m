//
//  NSURLSessionConfiguration+NFX.m
//  netfox_ios
//
//  Created by Alex Bofu on 23/07/2018.
//  Copyright © 2018 kasketis. All rights reserved.
//

#import "NSURLSessionConfiguration+NFX.h"
#import <netfox_ios/netfox_ios-Swift.h>

@implementation NSURLSessionConfiguration (NFX)

+ (void)load {
    
#if DEBUG
    [[NFX sharedInstance] start];
#endif
    
}

@end
