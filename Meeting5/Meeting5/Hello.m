//
//  Hello.m
//  Meeting5
//
//  Created by Norman McEntire on 10/27/11.
//  Copyright 2011 Servin Corporation. All rights reserved.
//

#import "Hello.h"


@implementation Hello

@synthesize count, name;

-(id) init {
    NSLog(@"self BEFORE: %p", self);
    self = [super init];
    NSLog(@"self AFTER: %p", self);
    if (self) {
        // do any additional initialization
    }
    return self;
    //return [self initWithCount:0 andName:nil];
}

-(id) initWithCount:(int)value {
    return [self initWithCount:value andName:nil];
}

-(id) initWithName:(NSString *)value {
    return [self initWithCount:0 andName:value]; 
}

-(id) initWithCount:(int)countValue andName:(NSString *)nameValue {
    self = [super init];
    if (self) {
        [self setCount2:countValue];
        [self setName2:nameValue];
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
