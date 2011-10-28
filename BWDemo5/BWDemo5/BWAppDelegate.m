//
//  BWAppDelegate.m
//  BWDemo5
//
//  Created by Brian Wilson on 10/27/11.
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

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    NSMutableString *ms  = [[NSMutableString alloc] init];
    [ms appendString:@"Meeting 5 demos\n"];
    
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    /* 
     origin will remain available and be released at end of message loop. msmutablestring doesn't have the autorelease stuff like nssstring. 
     */
    /*
     Demo 1
     */
    NSString *origin = [NSString stringWithFormat:@"x: %1.0f, y: %1.0f\n", rect.origin.x,
                        rect.origin.y];
    NSString *size = [[NSString alloc] initWithFormat:@"width: %1.0f, height: %1.0f\n", rect.size.width, rect.size.height];
    [ms appendFormat:@"%@%@", origin, size];
    [size release];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:rect];
    /* 
     Prevents the keyboard from coming up when clicking on the window
     */
    [textView setEditable:NO];
    
    /* 
     Demo 2 - Bundle
     */
    NSBundle *bundle = [NSBundle mainBundle];
    [ms appendString:@"Bundle Info\n"];
    [ms appendFormat:@"Executable Path: %@\n", [bundle executablePath]];
    NSArray *archArray = [bundle executableArchitectures];
    for (NSString *arch in archArray) {
        [ms appendFormat:@"%@\n", arch];
    }
    
    /* 
     Demo 3 - Read a file from the bundle
     */
    NSString *pathname = [[NSBundle mainBundle] pathForResource:@"readme" ofType:@"txt"];
    NSError *myError = nil;
    
    NSString *fileContents = [NSString stringWithContentsOfFile:pathname encoding:NSUTF8StringEncoding error:&myError]; 
    if (myError != nil) {
        [ms appendFormat:@"Error: %@\n", [myError localizedDescription]];
    }
    else {
        [ms appendFormat:@"%@\n", fileContents];
    }
    
    /*
     Demo 4 - Read a URL from a web service
     http://www.webservicex.net/ws/default.aspx
     Value manipulation / unit convertor
     Temperature unit converter
     GET /ConvertTemperature.asmx/ConvertTemp?Temperature=string&degreeCelsius=string&degreeFahrenheit=string HTTP/1.1
     Host: www.webservicex.net
     This is the http GET syntax. Soap isn't used for mobile. It's too verbose"

     */
/*    myError = nil; //we might have had an error previously. So clear it out
    
    NSString *webServiceString = @"http://www.webservicex.net" @"/ConvertTemperature.asmx/ConvertTemp?Temperature=100&FromUnit=degreeCelsius&ToUnit=degreeFahrenheit";
 //   /ConvertTemperature.asmx/ConvertTemp?Temperature=string&FromUnit=string&ToUnit=string
    
    NSURL *url = [NSURL URLWithString:webServiceString];
    NSString *xml = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&myError];
    
    if (myError != nil) {
        [ms appendFormat:@"URL Error: %@\n", [myError localizedDescription]];
    }
    else {
        [ms appendFormat:@"%@\n", xml];
    }
 */ 
    /* 
     Demo 5 - Custom Class
     */
    Hello *hello = [[Hello alloc] init];
    hello.count = 44;
    hello.name = @"John.Doe";
    [ms appendFormat:@"count: %i, name: %@\n", hello.count, hello.name];
    [hello setCount:55];
    [hello setName:@"Sally Smith\n"];
    [ms appendFormat:@"Count: %i, name: %@", hello.count, hello.name];
    
    [hello setCount2:100];
    [hello setName2:@"Billy Bob\n"];
    [ms appendFormat:@"count2 %i, name2: %@", [hello count2 ], [hello name2 ]];
    
    
    [hello release];
    
    /*
     End of demos. Show restults in UITextView 
     */
    [textView setText:ms];
    [self.window addSubview:textView];
    
    [textView release];
    [ms release];
    
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
