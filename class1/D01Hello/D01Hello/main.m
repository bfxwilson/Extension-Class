//
//  main.m
//  D01Hello
//
//  Created by Brian Wilson on 9/29/11.
//  Copyright 2011 Qualcomm. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Demo.h"

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    printf("Hello World\n");
    NSLog(@"This is an NSString");
    NSLog(@"Hello, World!");
    // Step 1 -Declare variable for object
    NSObject *obj;
    
    //step 2a - Allocate memory for project
    obj = [NSObject alloc];
    printf("obj: %p\n", obj);
    NSLog(@"obj: %@\n", obj);
    
    //step 2b - Initialize the memory
    obj = [obj init];
    
    //step 3 - Release the object
    [obj release];
    
    //Step 1
    NSObject *obj2;
    //Step 2A and 2B
    obj2 = [[NSObject alloc] init];
    printf("obj2: %p\n", obj2);
    NSLog(@"obj2: %@\n", obj2);
    //Step 3
    [obj2 release];

    
    NSString *s;
    s = [NSString alloc];
    s = [s initWithString:@"Hello Again"];
    NSLog(@"String 1: %@", s);
    [s release];
    
    int count=1234;
    s = [[NSString alloc] initWithFormat:@"count: %i", count]; // most frequenly used allocation pattern
    NSLog(@"s: %@", s);
    [s release];
    
    NSMutableString *s2;
    s2 = [[NSMutableString alloc] init];
    [s2 appendString:@"One "];
    [s2 appendString:@"Two "];
    NSLog(@"s2: %@", s2);
    [s2 release];
    
    NSString *s10 = [[NSString alloc] initWithString:@"Hello String"];
    NSMutableString *s20 = [[NSMutableString alloc] initWithString: @"Hello Again"];
    [s20 appendString:@"More of the string"];
    [s10 release];
    [s20 release];
     
    Demo *demo1 = [[Demo alloc] init];
    Demo *demo2 = [[Demo alloc] init];
    NSLog(@"demo1: %@", demo1);
    NSLog(@"demo2: %@", demo2);
    [demo1 release];
    [demo2 release];
    
    //Test our methods for Demo class
    [Demo doClassMethod];
    
    Demo *demo3 = [[Demo alloc] init];
    [demo3 doInstanceMethod];
    [demo3 release];
    
    //NSString with Instance methods
    NSString *s50 = [[NSString alloc] initWithString:@"red"];
    NSUInteger length = [s50 length];
    NSLog(@"length:  %@ %lu", s50, length);
    
    //NSString with Class metho
    NSString *s60 = [NSString stringWithString: @"blue"];
    NSLog (@"length: %@ %lu", s60, [s60 length]);
    
    [pool drain];
    return 0;
}

