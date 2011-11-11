//
//  BWAppDelegate.m
//  Demo7
//
//  Created by Brian Wilson on 11/10/11.
//  Copyright (c) 2011 Flurpose.com. All rights reserved.
//

#import "BWAppDelegate.h"

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
    
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.editable = NO;
    
    ms = [[NSMutableString alloc] init];
    /*
     NSXMLParser
     */
    [ms appendString:@"NSXMLParser\n"];
    NSString *xmlFilePathname = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlFilePathname];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    // as parsing file we want call back with document begin, end, error. Create xml parser delegate
    [xmlParser setDelegate:self];
    [xmlParser parse];
    
    
    ////
    [xmlParser release];
    
    [self.window addSubview:textView];
    [textView release];
    
    self.window.backgroundColor = [UIColor greenColor];
    textView.text = ms;

    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)parserDidStartDocument:(NSXMLParser *)parser {
    [ms appendString:@"ParserDidStartDocument\n"];
}

-(void)parserDidEndDocument:(NSXMLParser *)parser {
    [ms appendString:@"ParserDidEndDocument\n"];

}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    [ms appendString:@"ParserErrorOccured\n"];

}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    [ms appendFormat:@"%@\n", elementName];
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
