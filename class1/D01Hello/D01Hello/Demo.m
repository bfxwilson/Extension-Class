//
//  Demo.m
//  D01Hello
//
//  Created by Brian Wilson on 9/29/11.
//  Copyright 2011 Qualcomm. All rights reserved.
//

#import "Demo.h"

@implementation Demo

+(void) doClassMethod {
    NSLog (@"%s", __FUNCTION__);
}
-(void) doInstanceMethod {
    NSLog (@"%s", __FUNCTION__);
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
