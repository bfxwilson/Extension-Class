//
//  Hello.m
//  BWDemo41
//
//  Created by Brian Wilson on 10/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Hello.h"

@implementation Hello

//Synthesize automatically creates a getter and a setter. @ is a Objective C keyword
@synthesize debugMode;


-(NSString *) description {
    //return @"Hello world My Customer Description\n";
    NSString *s = [NSString stringWithFormat:@"Hello World: %@", [super description]];
    return s;
}

/*-(void) setDebugMode:(BOOL) debugMode {
    debugMode = _debugMode;
}
-(BOOL) debugMode {
    return debugMode;
}*/


@end
