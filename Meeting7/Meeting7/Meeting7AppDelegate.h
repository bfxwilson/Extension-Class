//
//  Meeting7AppDelegate.h
//  Meeting7
//
//  Created by Norman McEntire on 11/10/11.
//  Copyright 2011 Servin Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Meeting7AppDelegate : NSObject
        <UIApplicationDelegate, NSXMLParserDelegate> {
            
            NSMutableString *ms;
            BOOL bugIdFlag;
            NSString *bugIdString;
            NSInteger bugId;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
