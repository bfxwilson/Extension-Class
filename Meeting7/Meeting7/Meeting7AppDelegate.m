//
//  Meeting7AppDelegate.m
//  Meeting7
//
//  Created by Norman McEntire on 11/10/11.
//  Copyright 2011 Servin Corporation. All rights reserved.
//

#import "Meeting7AppDelegate.h"

@implementation Meeting7AppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.editable = NO;
    
    ms = [[NSMutableString alloc] init];
    
    // NSXMLParser
    [ms appendString:@"NSXMLParser\n"];
    NSString *xmlFilePathname = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlFilePathname];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    [xmlParser setDelegate:self];
    [xmlParser parse];
    [xmlParser release];
    
    // NSArray
    NSArray *array = [[NSArray alloc] 
                      initWithObjects:@"One", @"Two", nil];
    for (int i = 0; i < [array count]; i++) {
        [ms appendFormat:@"%@\n", [array objectAtIndex:i]];
    }
    for (NSString *s in array) {
        [ms appendFormat:@"%@\n", s];
    }
    
    // NSBundle
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *bundleId = [bundle bundleIdentifier];
    [ms appendFormat:@"bundleId: %@\n", bundleId];
    
    NSString *bundlePath = [bundle bundlePath];
    [ms appendFormat:@"bundlePath: %@\n", bundlePath];
    
    NSString *filePath = [bundle pathForResource:@"demo" 
                                            ofType:@"xml"];
    [ms appendFormat:@"filePath: %@\n", filePath];
    
    // NSData
    const char *buffer = "Hello World";
    const char buf2[] = "This is a test";
    
    NSData *myData = [NSData dataWithBytes:buffer length:strlen(buffer)];
    [ms appendFormat:@"myData length: %i\n", [myData length]];
    [ms appendFormat:@"myData description: %@\n", [myData description]];
    
    // C Data Types
    char c; // 8-bits
    short s; //16-bits
    int ii; //32-bits
    long l; //32-bits on a 32-bit platform, but 64-bits on a 64-bit
    long long ll; //64-bits
    
    c = 'a';
    c = 0x12;
    char *pc;
    pc = &c;
    
    // NSDate
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
    
    //NSDate *newDate = [date addTimeInterval:60];
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceNow:60];
    [ms appendFormat:@"%@\n", newDate];
    
    // NSDictionary
    NSDictionary *d = [[NSDictionary alloc] initWithObjectsAndKeys:@"Obj1", @"Key1", @"Obj2", @"Key2", nil];
    for (NSString *key in d) {
        NSString *value = [d objectForKey:key];
        [ms appendFormat:@"%@-%@\n", key, value];
    }
    
    // NSFileHandle
    NSFileHandle *handle = 
        [NSFileHandle fileHandleForReadingAtPath:xmlFilePathname];
    NSData *fileBuffer = [handle readDataToEndOfFile];
    NSString *fileString = [[NSString alloc] initWithData:fileBuffer encoding:NSUTF8StringEncoding];
    [ms appendFormat:@"%@\n", fileString];
    
    // NSFileManager
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *curDir = [fm currentDirectoryPath];
    [ms appendFormat:@"%@\n", curDir];
    
    NSArray *dirContents = 
                [fm contentsOfDirectoryAtPath:curDir error:nil];
    for (NSString *file in dirContents) {
        [ms appendFormat:@"%@\n", file];
    }
    
    // NSProcessInfo
    NSProcessInfo *pi = [NSProcessInfo processInfo];
    [ms appendFormat:@"processName: %@\n", [pi processName]];
    [ms appendFormat:@"processID: %i\n", [pi processIdentifier]];
    [ms appendFormat:@"os name: %@\n", [pi operatingSystemName]];
    [ms appendFormat:@"cpu count: %i\n", [pi processorCount]];
    
    // NSThread
    // NOTE! VERY BAD! The system hangs for 10 seconds
    //[NSThread sleepForTimeInterval:10];
    //NSThread *myThread = [[NSThread alloc] init];
    //[self performSelector:@selector(doThreadDemo:) onThread:myThread withObject:nil waitUntilDone:NO];
    [self performSelectorInBackground:@selector(doThreadDemo:) withObject:nil];
    
    textView.backgroundColor = [UIColor yellowColor];
    self.window.backgroundColor = [UIColor redColor];
    
    textView.text = ms;
    [self.window addSubview:textView];
    [textView release];
    
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)doThreadDemo:(NSObject *)obj {
    NSLog(@"BEFORE Sleep");
    [NSThread sleepForTimeInterval:30];
    NSLog(@"AFTER Sleep");
}
-(void)parserDidStartDocument:(NSXMLParser *)parser {
    [ms appendString:@"parserDidStartDocument\n"];
}
-(void)parserDidEndDocument:(NSXMLParser *)parser {
    [ms appendString:@"parserDidEndDocument\n"];
}
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    [ms appendString:@"parseErrorOcurred:\n"];
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    [ms appendFormat:@"%@\n", elementName];
    // Look for bugID
    if ([elementName compare:@"radar:bugID"] == NSOrderedSame) {
        bugIdFlag = YES;
    }
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (bugIdFlag == YES) {
        bugIdString = string;
        [bugIdString retain];
        bugId = [bugIdString intValue];
        [ms appendFormat:@"bugIdString: %@\nbugId:%i\n", 
                        bugIdString, bugId];
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

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
