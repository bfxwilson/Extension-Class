//
//  Demo.m
//  D01Hello
//
//  Created by Norman McEntire on 9/29/11.
//  Copyright 2011 Servin Corporation. All rights reserved.
//

#import "Demo.h"


@implementation Demo

+(void) doClassMethod { 
    NSLog(@"%s", __FUNCTION__);
}

-(void) doInstanceMethod {
    NSLog(@"%s", __FUNCTION__);
}


- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

@end
