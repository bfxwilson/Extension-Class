//
//  Meeting6AppDelegate.h
//  Meeting6
//
//  Created by Norman McEntire on 11/3/11.
//  Copyright 2011 Servin Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Meeting6AppDelegate : NSObject <UIApplicationDelegate> {
    UIWebView *webView;
    NSMutableData *myData;
    NSURLConnection *myConnection;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
