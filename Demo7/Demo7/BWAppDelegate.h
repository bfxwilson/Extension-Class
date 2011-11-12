//
//  BWAppDelegate.h
//  Demo7
//
//  Created by Brian Wilson on 11/10/11.
//  Copyright (c) 2011 Flurpose.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BWAppDelegate : UIResponder <UIApplicationDelegate, NSXMLParserDelegate> {
    
    NSMutableString *ms;
    BOOL bugIdFlag;
    NSString *bugIdString;
    NSInteger bugId;
    
}

@property (strong, nonatomic) UIWindow *window;

@end
