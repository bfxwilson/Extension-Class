//
//  BWAppDelegate.h
//  bwDemo6
//
//  Created by Brian Wilson on 11/3/11.
//  Copyright (c) 2011 Flurpose.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BWAppDelegate : UIResponder <UIApplicationDelegate> {
    UIWebView *webView;
    NSMutableData *myData; //represents a buffer and the buffer can grow
    NSURLConnection *myConnection;
}

@property (strong, nonatomic) UIWindow *window;

@end
