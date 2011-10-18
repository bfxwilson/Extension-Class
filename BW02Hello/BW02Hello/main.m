//
//  main.m
//  BW02Hello
//
//  Created by Brian Wilson on 10/2/11.
//  Copyright 2011 Qualcomm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BWDemo.h"

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    printf("C String\n");
    NSLog(@"Hello, NSString!");
    
    NSObject *obj = [[NSObject alloc] init];
    NSLog(@"obj: %@", obj);
    NSLog(@"obj: %@", [obj description]);
    [obj release];
    
    int count = 1234;
    NSString *s1 = [[NSString alloc] initWithFormat:@"count: %i", count];
    NSLog(@"s1: %@" , s1);
    NSLog(@"s1: %@", [s1 description]);
    [s1 release];
    
    NSMutableString *s2 = [[NSMutableString alloc] initWithFormat:@"count %i", count];
    [s2 appendString:@"\nYet some more text"];
    [s2 appendFormat:@"\ncount :%i", count];
    NSLog(@"s2: %@", s2);
    [s2 release];
    
    ////////////
    
    NSNumber *num1 = [[NSNumber alloc] initWithInt:1234];
    NSLog(@"num1: %@", num1);
    NSNumber *num2 = [[NSNumber alloc] initWithFloat:12.34];
    NSLog(@"num2: %@", num2);
        
    //int bwmax = 10;
    //float bwrate = 9.2;
    
   // printf("bwmax: %i, bwrate: %f", bwmax, bwrate);
    
    int bwmax = [num1 intValue];
    float bwrate = [num2 floatValue];
    
    printf("bwmax: %i, bwrate: %f\n", bwmax, bwrate);
    
    [num1 release];
    [num2 release];
//use nsnumber to take scalar values and put them in an object. Makes it easier
    // to manage objects.
    
    /////
    NSDate *bwDate1 = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    NSDate *bwDate2 = [[NSDate alloc] initWithTimeIntervalSinceNow:10.0]; //10 seconds will initialize in 10 seconds
    NSLog(@"bwDate1: %@", bwDate1);
    NSLog(@"bwDate2: %@", bwDate2);
    [bwDate1 release];
    [bwDate2 release];
    // my computer time shows 8:32 and the results returned from this call are 7 hours ahead i.e. 15:32.
    
    /////
    NSArray *bwArray = [[NSArray alloc] initWithObjects:@"one",@"two",@"three", nil];
    NSLog(@"bwArray: %@", bwArray);
    for (int i = 0; i < [bwArray count]; i++) {
        NSString *bwString = [bwArray objectAtIndex:i];
        NSLog(@"bwString: %@", bwString);
    }
    [bwArray release];
    
    [BWDemo doClassMethod];
    [BWDemo doClassMethodOneParam:456];
//    [BWDemo doClassMethodOneParam:40 twoParam:@"Testing"];
    [BWDemo doClassMethodOneParam:40 :@"Testing"];
    
    BWDemo *demo = [[BWDemo alloc] init];
    NSLog(@"demo: %@", demo);
    [demo doInstanceMethod];
    [demo doInstanceMethodOneParam:456];
    [demo doInstanceMethodOneParam:20 twoParam:@"hello"];
    
    [demo release];
    
    [pool drain];
    return 0;
}

