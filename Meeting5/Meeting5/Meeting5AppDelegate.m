//
//  Meeting5AppDelegate.m
//  Meeting5
//
//  Created by Norman McEntire on 10/27/11.
//  Copyright 2011 Servin Corporation. All rights reserved.
//

#import "Meeting5AppDelegate.h"

#import "Hello.h"

@implementation Meeting5AppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Demo 1
    NSMutableString *ms = [[NSMutableString alloc] init];
    [ms appendString:@"Meeting 5 Demos\n"];
    
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    NSString *origin = 
            [NSString stringWithFormat:@"x: %1.0f, y: %1.0f\n",
             rect.origin.x, rect.origin.y];
// VERY HARD TO DEBUG ===>    [origin release];
    
    NSString *size =
            [[NSString alloc] initWithFormat:@"width: %1.0f, height: %1.0f\n",
             rect.size.width, rect.size.height];
    [ms appendFormat:@"%@%@", origin, size];
    [size release];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:rect];
    [textView setEditable:NO];
    
    // Demo 2 - Bundle
    NSBundle *bundle = [NSBundle mainBundle];
    [ms appendString:@"Bundle Info\n"];
    [ms appendFormat:@"Executable path: %@\n", [bundle executablePath]];
    NSArray *archArray = [bundle executableArchitectures];
    for (NSString *arch in archArray) {
        [ms appendFormat:@"%@\n", arch];
    }
    
    // Demo 3 - Read a file from the bundle
    NSString *pathname = 
        [[NSBundle mainBundle] pathForResource:@"readme" ofType:@"txt"];
    NSError *myError = nil;
    NSString *fileContents = [NSString stringWithContentsOfFile:pathname encoding:NSUTF8StringEncoding error:&myError];
    if (myError != nil) {
        [ms appendFormat:@"Error: %@\n", [myError localizedDescription]];
    }
    else {
        [ms appendFormat:@"%@\n", fileContents];
    }
    
    // Demo 4 - Read a URL from a web service
    //GET /ConvertTemperature.asmx/ConvertTemp?Temperature=string&FromUnit=string&ToUnit=string HTTP/1.1
    //Host: www.webservicex.net
    
    NSString *webServiceString = @"http://www.webservicex.net"
                @"/ConvertTemperature.asmx/ConvertTemp?Temperature=100&FromUnit=degreeFahrenheit&ToUnit=degreeCelsius";
    NSURL *url = [NSURL URLWithString:webServiceString];
    myError = nil;
    NSString *xml = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&myError];
    if (myError != nil) {
        [ms appendFormat:@"URL Error: %@\n", [myError localizedDescription]];
    }
    else {
        [ms appendFormat:@"%@\n", xml];
    }
    
    // Demo 5 - Custom Class
    Hello *hello = [[Hello alloc] init];
    hello.count = 44;
    hello.name = @"john doe";
    [ms appendFormat:@"count: %i, name: %@\n", 
            hello.count, hello.name];
    
    [hello setCount:55];
    [hello setName:@"sally smith"];
    [ms appendFormat:@"count: %i, name: %@\n", 
            [hello count], [hello name]];
        
    [hello setCount2:100];
    [hello setName2:@"billy bob"];
    [ms appendFormat:@"count2: %i, name2: %@\n",
       [hello count2], [hello name2]];
    
    hello.count2 = 200;
    hello.name2 = @"another name";
    [ms appendFormat:@"count2: %i, name2: %@\n",
     hello.count2, hello.name2]; 
    
    [hello release];
    
    // End of Demos - Show results in UITextView
    [textView setText:ms];
    [self.window addSubview:textView];
    
    [textView release];
    [ms release];
    
    
    
    
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

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
