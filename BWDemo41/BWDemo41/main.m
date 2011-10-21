//
//  main.m
//  BWDemo41
//
//  Created by Brian Wilson on 10/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BWAppDelegate.h"

int main(int argc, char *argv[])
{
    /* 
     NSObject *obj1 = [[NSObject alloc] init];
    NSLog(@"obj1: %@", obj1);
    int retainCount = [obj1 retainCount];
    NSLog(@"retainCount = %i", retainCount);
    // pretend sending to another owner
    [obj1 retain];
    NSLog(@"retainCount = %i", [obj1 retainCount]);
   
    [obj1 release];
    NSLog(@"retainCount = %i", retainCount);
    [obj1 release];
     */
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([BWAppDelegate class]));
    }

}
