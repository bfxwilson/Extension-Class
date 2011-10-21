//
//  BWAppDelegate.m
//  BWDemo41
//
//  Created by Brian Wilson on 10/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BWAppDelegate.h"
#import "Hello.h"

@implementation BWAppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}
/*
 Java, C, C==
 BOOL applicationDidFinishLaunchingWithOptions(UIApplication * application, NSDictionary *LaunchOptions);
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    // Where we jump into action
    NSMutableString *ms = [[NSMutableString alloc] init];
    [ms appendString:@"Hello Brian\n"];

    UIScreen *screen = [UIScreen mainScreen];
    //Test question. Would these lines print out the same?
    //TEST Question. class method or instance method? message to class is class method.
    //NSLog(@"Screen: %@", [screen description]);
    //NSLog(@"Screen %@", screen);
    CGRect frame = [screen applicationFrame];
    // NSLog(@"frame: x: %f, y:%f, width: %f, height:%f", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    [ms appendFormat:@"x: %1.0f, y: %1.0f, \n width: %1.0f, height %1.0f\n", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height];
    
    
    //other demos relating to the foundation framework
    NSObject *obj = [[NSObject alloc] init];
    [ms appendFormat:@"obj: %@\n", [obj description]];
    [obj release];
    
    // NSNumber will automatically allocate the storage. 
    NSNumber *num1 = [NSNumber numberWithInt:1234];
    [ms appendFormat:@"num1: %@\n", [num1 description]];
    [ms appendFormat:@"num1: %i\n", [num1 intValue]];
    
    NSNumber *num2 = [NSNumber numberWithFloat:12.34];
    [ms appendFormat:@"num2: %@\n", num2];
    [ms appendFormat:@"num2: %f\n", num2.floatValue];
    
    NSNumber *num3 = [[NSNumber alloc] initWithUnsignedInt:5678];
    [ms appendFormat:@"num3 %@\n", [num3 description]];
    [ms appendFormat:@"num3: %i\n", num3.intValue];
   
    [num3 release];
    
    NSNumber *num4 = [[[NSNumber alloc] initWithInt:6789] autorelease];
    [ms appendFormat:@"num4: %@\n", [num4 description]];
    [ms appendFormat:@"num4: %i\n", num4.intValue];
    
    NSNumber *char1 = [NSNumber numberWithChar:'a'];
    [ms appendFormat:@"char1: %c\n", [char1 charValue]];
 
    
    //compare these numbers with a bool
    BOOL result = [num1 isEqualToNumber:num2];
    if (result == YES) {
        [ms appendString:@"num1 = num2 \n"];
    } else {
        [ms appendString:@"num1 != num2 \n"];
    }
    
    NSComparisonResult result2 = [num1 compare:num2];
    switch (result2) {
        case NSOrderedDescending:
            [ms appendString:@"NSOrderedDescending\n"];
            break;
        case NSOrderedSame:
            [ms appendString:@"NSOrderedSame\n"];
            break;
        case NSOrderedAscending:
            [ms appendString:@"NSOrderedAscending\n"];
            break;
    }
    
    Hello *hello = [[Hello alloc] init];
    [hello setDebugMode:YES];
    hello.debugMode = YES;
    [ms appendFormat:@"DebugMode: %i\n", [hello debugMode]];
    [ms appendFormat:@"DebugMode: %i\n", hello.debugMode];
    [ms appendFormat:@"%@\n", [hello description]];
    [hello release];
    
    
    UITextView *textView;
    textView = [[UITextView alloc] initWithFrame:frame];
    [textView setText:ms]; //Objective-C 1.0
    textView.text = ms; //Objective-C 2.0
    
    [textView setBackgroundColor:[UIColor redColor]];
     
    //
    // Look at retain count to see if the reference is a copy of a reference
    //NSLog(@"Retain count: %i", ms.retainCount);
    [ms release];
    [self.window addSubview:textView];
    [textView release];
    

    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
