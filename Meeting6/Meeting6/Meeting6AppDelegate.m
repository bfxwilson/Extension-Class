//
//  Meeting6AppDelegate.m
//  Meeting6
//
//  Created by Norman McEntire on 11/3/11.
//  Copyright 2011 Servin Corporation. All rights reserved.
//

#import "Meeting6AppDelegate.h"

@implementation Meeting6AppDelegate


@synthesize window=_window;

-(void) doTimer:(NSTimer *)timer {
//-(void) doTimer {
    NSString *dateTimeString = [[NSDate date] description];
    NSString *hello = [timer userInfo];
    NSString *html = 
[NSString stringWithFormat:@"<p>%@</p><p>retainCount: %i</p><p>%@</p>",
                      dateTimeString, [hello retainCount], hello];
    [webView loadHTMLString:html baseURL:nil];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Demo 1 - Showed UIWebView
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    frame = CGRectInset(frame, 40.0, 40.0);
    webView = [[UIWebView alloc] initWithFrame:frame];
    NSString *html = @"<h1>Hello HTML</h1>";
    [webView loadHTMLString:html baseURL:nil];
    [self.window addSubview:webView];
    [self.window setBackgroundColor:[UIColor yellowColor]];
  
    // Demo 2 - NSTimer
    //NSString *s = [NSString stringWithFormat:@"%i", 1234];
    //NSString *s = [[NSString alloc] stringWithFormat:@"%i", 5678];
    NSString *s = @"Hello World";
    
    NSTimeInterval timeInterval = 2.0;
//    [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(doTimer:) userInfo:s repeats:YES];
        
    // Demo 3 - See below for demo 3
    
    // Demo 4 - Access a web service (old way was Sync, or Blocking)
    //GET /ConvertTemperature.asmx/ConvertTemp?Temperature=stringFromUnit=string&ToUnit=string HTTP/1.1
    ///Host: www.webservicex.net
    NSString *webServiceString = @"http://"
        @"www.webservicex.net"
        @"/ConvertTemperature.asmx/ConvertTemp?"
        @"Temperature=100&FromUnit=degreeFahrenheit&ToUnit=degreeCelsius";
    
    NSURL *url = [NSURL URLWithString:webServiceString];
//    NSString *webHtml = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
//    [webView loadHTMLString:webHtml baseURL:nil];
    
    // Demo 5 - Access web site new way (Async)
    [webView loadHTMLString:@"<h1>Loading...</h1>" baseURL:nil];
    myData = [[NSMutableData alloc] init];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    myConnection = [[NSURLConnection alloc] initWithRequest:request  delegate:self startImmediately:YES];
    
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSString *html = @"<h1>Did Fail With Error</h1>";
    [webView loadHTMLString:html baseURL:nil];
    [connection release];
    [myData release];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [myData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //[webView loadHTMLString:@"<h1>All Done!</h1>" baseURL:nil];
    NSString *html = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
 //   NSString *preHtml = [html stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
 //   NSString *finalHtml = [NSString stringWithFormat:@"<pre>%@</pre>",
   //                        preHtml];
    NSLog(@"%@", html);
    [webView loadHTMLString:html baseURL:nil];
    [html release];
    [connection release];
    [myData release];
}

-(void) doNotify:(NSNotification *)notification {
    NSString *msg = [notification name];
    NSString *html = [NSString stringWithFormat:@"<p>%@</p>", msg];
    [webView loadHTMLString:html baseURL:nil];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Demo 3 - NSNotificationCenter
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(doNotify:) 
               name:UIDeviceOrientationDidChangeNotification
             object:nil];
    
 ////   [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
}
- (void)applicationWillResignActive:(UIApplication *)application
{
 ///   [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

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
