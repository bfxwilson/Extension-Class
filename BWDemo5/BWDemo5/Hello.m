//
//  Hello.m
//  BWDemo5
//
//  Created by Brian Wilson on 10/27/11.
//  Copyright (c) 2011 Flurpose.com. All rights reserved.
//

#import "Hello.h"

@implementation Hello

@synthesize count, name;

-(id) init {
    NSLog(@"self: %p", self);
    self = [super init];
    NSLog(@"self: %p", self);

    if (self) {
        // do any additional initializations
    }
    return self;
}
-(id) initWithCount:(int)value {
    return [self initWithCount:value andName:nil];
}
-(id) initWithName:(NSString *) value {
    return [self initWithCount:0 andName:value];
}

-(id) initWithCount:(int)countValue andName:(NSString *)nameValue {
    self = [super init];
    if (self) {
        [self setCount2:countValue];
        [self setName2:nameValue];
        [name2 retain];
    }
    return self;
}






-(void) setCount2:(int) value {
    count2 = value;
}

-(int) count2 {
    return count2;
}

-(void) setName2:(NSString *) value {
    [value retain];
    [name2 release];
    name2 = value;
}

-(NSString *) name2 {
    return name2;
}



@end
