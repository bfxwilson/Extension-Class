//
//  main.m
//  BW02Hello
//
//  Created by Brian Wilson on 10/2/11.
//  Copyright 2011 Qualcomm. All rights reserved.
//

#import <Foundation/Foundation.h>

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
    
                    

    [pool drain];
    return 0;
}

