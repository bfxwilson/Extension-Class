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
    
    /*
     NSArray
     */
    NSArray *array = [[NSArray alloc] initWithObjects:@"one", @"two", nil];
    for (int i = 0; i < [array count]; i++) {
        [ms appendFormat:@"%@\n", [array objectAtIndex:i]];
    }
    for (NSString *s in array) {
        [ms appendFormat:@"%@\n", s];
    }
    
    /* 
     NSBundle
     */
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *bundleId = [bundle bundleIdentifier];
    [ms appendFormat:@"bundleIdentifier: %@\n", bundleId];
    
    NSString *bundlePath = [bundle bundlePath];
    [ms appendFormat:@"bundlePath: %@\n", bundlePath];
    
    NSString *filePath = [bundle pathForResource:@"demo" ofType:@"xml"];
    [ms appendFormat:@"filepath: %@\n", filePath];
    
    /* 
     NSData A data buffer
      */
    const char *buffer = "Hello World";
    NSData *myData = [NSData dataWithBytes:buffer length:strlen(buffer)];
    [ms appendFormat:@"myData Description: %@\nLength: %i\n", [myData description], [myData length]];
    
    /* 
     NSDate
     */
    NSDate *date = [NSDate date];
    [ms appendFormat:@"%@\n", date];
    
    // NSDateFormatter
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    NSString *dateString = [formatter stringFromDate:date];
    [ms appendFormat:@"%@\n", dateString];
  
    
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    [formatter setDateStyle:NSDateFormatterNoStyle];
    dateString = [formatter stringFromDate:date];
    [ms appendFormat:@"%@\n", dateString];
    
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceNow:60];
    [ms appendFormat:@"%@\n", newDate];
    
    
    /*
     nsdictionary
     */
    NSDictionary *d = [[NSDictionary alloc] initWithObjectsAndKeys:@"obj1", @"key1", @"obj2", @"key2", nil];
    for (NSString *key in d ) {
        NSString *value = [d objectForKey:key];
        [ms appendFormat:@"%@-%@\n", key, value];
    }
    
    /*
     nsfilehandle
     */
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:xmlFilePathname];
    NSData *fileBuffer = [handle readDataToEndOfFile];
    NSString *fileString = [[NSString alloc] initWithData:fileBuffer encoding:NSUTF8StringEncoding];
    [ms appendFormat:@"%@\n", fileString];
    
    // NSFileManager
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *currentDirectory = [fm currentDirectoryPath];
    [ms appendFormat:@"Current Directory: %@\n", fm];
    
    NSArray *dirContents = [fm contentsOfDirectoryAtPath:currentDirectory error:nil];
    for (NSString *file in dirContents) {
        [ms appendFormat:@"%@\n", file];
    }
    
    //nsprocessinfo
    NSProcessInfo *pi = [NSProcessInfo processInfo];
    [ms appendFormat:@"Process name: %@\n", [pi processName]];
    [ms appendFormat:@"os name: %@\n", [pi operatingSystemName]];
    [ms appendFormat:@"cpu count: %i\n", [pi processorCount]];
    
    /*
     NSThread 
     very bad to hang system for 10 seconds
     */
    //[NSThread sleepForTimeInterval:10];
    
//    NSThread *myThread = [[NSThread alloc] init];
//    [self performSelector:@selector(doThreadDemo) onThread:myThread withObject:nil waitUntilDone:NO];
    [self performSelectorInBackground:@selector(doThreadDemo:) withObject:nil];

    
    [self.window addSubview:textView];
    textView.backgroundColor = [UIColor blueColor];
    [textView release]; //textview is our window pane.
    
    self.window.backgroundColor = [UIColor greenColor]; // This will color the background window that we don't see.
    textView.text = ms;

    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)doThreadDemo:(NSObject *)obj {
    NSLog(@"Before Sleep");
    [NSThread sleepForTimeInterval:10];
    NSLog(@"After Sleep");
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
    //look for bug ID
    if ([elementName compare:@"radar:bugID"] == NSOrderedSame ) {
        bugIdFlag = YES;
    }
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (bugIdFlag == YES ) {
        bugIdString = string;
        [bugIdString retain];
        bugId = [bugIdString intValue];
        [ms appendFormat:@"bugIDString: %@\n bugID: %i\n", bugIdString, bugId];
        bugIdFlag = NO;
    
    }
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
