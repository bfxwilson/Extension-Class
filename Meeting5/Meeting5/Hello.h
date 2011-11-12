//
//  Hello.h
//  Meeting5
//
//  Created by Norman McEntire on 10/27/11.
//  Copyright 2011 Servin Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Hello : NSObject {
    int count2;
    NSString *name2;
    BOOL debug;
}
-(void) setCount2:(int) value;
-(int) count2;

-(void) setName2:(NSString *) value;
-(NSString *) name2;

-(id) init;
-(id) initWithCount:(int)value;
-(id) initWithName:(NSString *)value;
-(id) initWithCount:(int)countValue andName:(NSString *)nameValue;



@property (nonatomic) int count;
@property (nonatomic, retain) NSString *name;
//@property (nonatomic, assign) id delegate;
//@property (nonatomic, copy) NSString *address;


@end
