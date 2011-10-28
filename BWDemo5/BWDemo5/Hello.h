//
//  Hello.h
//  BWDemo5
//
//  Created by Brian Wilson on 10/27/11.
//  Copyright (c) 2011 Flurpose.com. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Hello : NSObject {
    int count2;
    NSString *name2;
}

-(void) setCount2:(int) value;
-(int) count2;

-(void) setName2:(NSString *) value;
-(NSString *) name2;
/*
 Adding init functions
 (id) references an object in Objective-C
 */
-(id) init;
-(id) initWithCount:(int)value;
-(id) initWithName:(NSString *) value;
-(id) initWithCount:(int)countValue andName:(NSString *)nameValue;

//We created this for Demo 5
@property (nonatomic) int count;
@property (nonatomic, retain) NSString *name;
// Figure out where the the instructions are for the @property stuff is.


@end
