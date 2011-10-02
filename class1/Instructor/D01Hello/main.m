//
//  main.m
//  D01Hello
//
//  Created by Norman McEntire on 9/29/11.
//  Copyright 2011 Servin Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Demo.h"

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    printf("Hello World\n");
    
    NSLog(@"Hello, World!");
    NSLog(@"This is an NSString");
    
    // Step 1 - Declare a variable for the object
    NSObject *obj;
    // Step 2A - Allocate memory for the object
    obj = [NSObject alloc];
    printf("obj: %p\n", obj);
    NSLog(@"obj: %@\n", obj);
    // Step 2B - Initialize the memory
    obj = [obj init];
    // Step 3 - Release the object when done
    ////[obj release];
    
    // Step 1
    NSObject *obj2;
    // Step 2A and 2B
    obj2 = [[NSObject alloc] init];
    printf("obj2: %p\n", obj2);
    NSLog(@"obj2: %@", obj2);
    
    
    NSObject *obj3 = [[[NSObject alloc] init] autorelease];
    printf("obj3: %p\n", obj3);
    NSLog(@"obj3: %@", obj3);
    
    // Release memory of all objects
    // Step 3
    [obj release];
    [obj2 release];
    
    
    NSString *s;
    s = [NSString alloc];
    s = [s initWithString:@"Hello Again"];
    NSLog(@"s: %@", s);
    [s release];
    
    int count = 1234;
    s = [[NSString alloc] initWithFormat:@"count: %i", count];
    NSLog(@"s: %@", s);
    [s release];
    
    NSMutableString *s2;
    s2 = [[NSMutableString alloc] init];
    [s2 appendString:@"One "];
    [s2 appendString:@"Two "];
    NSLog(@"s2: %@", s2);
    [s2 release];
    
    ///////
    NSString *s10 = [[NSString alloc] initWithString:@"Hello String"];
    NSMutableString *s20 = [[NSMutableString alloc] initWithString:@"Hello Again"];
    [s20 appendString:@"More of the string"];
    [s10 release];
    [s20 release];
    
    
    Demo *demo1 = [[Demo alloc] init];
    Demo *demo2 = [[Demo alloc] init];
    NSLog(@"demo1: %@", demo1);
    NSLog(@"demo2: %@", demo2);
    [demo1 release];
    [demo2 release];
    
    
    // Test our methods
    [Demo doClassMethod];
    
    Demo *demo3 = [[Demo alloc] init];
    [demo3 doInstanceMethod];
    [demo3 release];
    
    // NSString with instance methods
    NSString *s50 = [[NSString alloc] initWithString:@"red"];
    NSUInteger length = [s50 length];
    NSLog(@"length: %lu", length);
    NSLog(@"length: %@", length);
    //NSLog(@"%i", s50);
    
    // NSString with class method
    NSString *s60 = [NSString stringWithString:@"blue"];
    NSLog(@"length: %lu", [s60 length]);
    
    
    
    
    

    [pool drain];
    return 0;
}

