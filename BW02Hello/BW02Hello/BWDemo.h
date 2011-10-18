//
//  BWDemo.h
//  BW02Hello
//
//  Created by Brian Wilson on 10/5/11.
//  Copyright 2011 Qualcomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BWDemo : NSObject

+(void) doClassMethod;
+(int) doClassMethodOneParam:(int) count;
//+(NSString *) doClassMethodOneParam:(int) count twoParam:(NSString *) msg;
+(NSString *) doClassMethodOneParam:(int) count :(NSString *) msg;

-(void) doInstanceMethod;
-(int) doInstanceMethodOneParam: (int) count;
-(NSString *) doInstanceMethodOneParam: (int) count twoParam:(NSString *) msg;



@end
