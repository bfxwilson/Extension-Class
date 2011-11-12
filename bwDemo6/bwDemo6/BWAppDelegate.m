//
//  BWAppDelegate.m
//  bwDemo6
//
//  Created by Brian Wilson on 11/3/11.
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

-(void) doTimer:(NSTimer *) timer {
    NSString *dateTimeString = [[NSDate date] description];
    NSString *hello = [timer userInfo];
//    NSString *html = [NSString stringWithFormat:@"<p>%@</p><p>retainCount: %i</p><p>%@</p>", dateTimeString, [timer retainCount], hello];
    NSString *html = [NSString stringWithFormat:@"<p>%@</p><p>retainCount: %i</p><p>%@</p>", dateTimeString, [hello retainCount], hello];
    [webView loadHTMLString:html baseURL:nil];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    /*
     Better than text view because you can format it using HTML
     No reason to use this view instead of the other one. 
     
     Views are stacked. Think of them like paper, you stack them up. We created a peice of paper on top
     */
    
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    frame = CGRectInset(frame, 40.0, 40.0); //make a 40 pixel border
    webView = [[UIWebView alloc] initWithFrame:frame];
    NSString *html = @"<h1>Hello HTML</h1>";
    [webView loadHTMLString:html baseURL:nil];
    [self.window addSubview:webView];
    [self.window setBackgroundColor:[UIColor yellowColor]]; // instructor setting
    
    // Part 2 of the demostration
    /*
     We are storing stuff in the UIWebView. Pointer is only resident in this method.
     */
    
    /*
     Calls us at a fixed interval. going to use notification center to call us when notified.
     */
    
    NSString *s = [NSString stringWithFormat:@"%i", 1234];
    //  NSString *s = [[NSString alloc] initWithFormat:@"%i", 5678];
    //NSString *s = @"Hello World";
    NSTimeInterval timeInterval = 1.0;
    [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(doTimer:) userInfo:s repeats:YES];
     
    // Demo 3 NSNotificationCenter moved to appplicationwillenterforeground section
//    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
//    [nc addObserver:self selector:@selector(doNotify:) name:UIDeviceOrientationDidChangeNotification object:nil];
    // watch everything because of object:nil. watch only me name:nil
    
//    // Demo 4 Access a web server in a thread
//    GET /ConvertTemperature.asmx/ConvertTemp?Temperature=string&FromUnit=string&ToUnit=string HTTP/1.1
//Host: www.webservicex.net
//
    
    NSString *webServiceString = @"http://www.webservicex.net/ConvertTemperature.asmx/ConvertTemp?" 
        @"Temperature=100&FromUnit=degreeCelsius&ToUnit=degreeFahrenheit";
    NSURL *url = [NSURL URLWithString:webServiceString];
//    NSString *webHtml = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
//    [webView loadHTMLString:webHtml baseURL:nil];
    
    /*
     Demo 5 Access web site asynchronous
     */
    myData = [[NSMutableData alloc] init];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    myConnection = [[NSURLConnection alloc] initWithRequest:request  delegate:self startImmediately:YES];
    
    self.window.backgroundColor = [UIColor yellowColor];
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSString *html = @"<h1>Did Fail With Error</h1>";
    [webView loadHTMLString:html baseURL:nil];
    [connection release];
    [myData release];
}

-(void)connection:(NSURLConnection *) connection didReceiveData:(NSData *) data {
    //Every time we get data. Fill up NSData Data
    [myData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [webView loadHTMLString:@"<h1>All Done!</h1>" baseURL:nil];
    NSString *html = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
    [webView loadHTMLString:html baseURL:nil];
    [html release];
    [myData release];
    [connection release];
}

-(void) doNotify:(NSNotification *) notification {
    NSString *message = [notification name];
    NSString *html = [NSString stringWithFormat:@"<p>%@</p>", message];
    [webView loadHTMLString:html baseURL:nil];
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
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
    // Moved from main message loop
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(doNotify:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
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
