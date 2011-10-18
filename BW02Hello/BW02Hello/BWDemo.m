//
//  BWDemo.m
//  BW02Hello
//
//  Created by Brian Wilson on 10/5/11.
//  Copyright 2011 Qualcomm. All rights reserved.
//

#import "BWDemo.h"


@implementation BWDemo

+(void) doClassMethod {
    NSLog(@"%s", __FUNCTION__);
    
}

+(int) doClassMethodOneParam:(int) count {
    NSLog(@"count: %i", count);
    return 123;
    
}

+(NSString *) doClassMethodOneParam:(int) count :(NSString *) msg {
    NSLog(@"count: %i, %@", count, msg);
    return @"789";
    
    
}

-(void) doInstanceMethod {
    NSLog(@"%s", __FUNCTION__);
    
}
-(int) doInstanceMethodOneParam: (int) count {
    NSLog(@"%s: count: %i", __FUNCTION__, count);
    return 567;
    
}
-(NSString *) doInstanceMethodOneParam: (int) count twoParam:(NSString *) msg {
    NSLog(@"%s: count: %i twoParam: %@", __FUNCTION__, count, msg);
    return @"Hello";
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
