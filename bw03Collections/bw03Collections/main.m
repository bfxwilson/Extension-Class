//
//  main.m
//  bw03Collections
//
//  Created by Brian Wilson on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ARRAY_SIZE 4

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // Straight C code for performing collections in C code
    int array[ARRAY_SIZE] = { 1, 2, 3, 4 };
    for (int i = 0; i < ARRAY_SIZE; i++ ) {
        NSLog(@"Array[%i]: %i", i, array[i]);
    }
    
    NSArray *array1 = [[NSArray alloc] initWithObjects:@"one", @"Two", @"Three", nil]; 
    NSLog(@"Array1: %@", array1);

    for (int i = 0; i < [array1 count]; i++) { 
        NSLog(@"Array1[%i]: %@", i, [array1 objectAtIndex:i]);
    }
    
    // fast enumeration - added with objective c 2
    //Memorize the syntax for this one
    NSLog(@"Fast enumeration");
    for (NSString *s in array1) {
        NSLog(@"%@", s);
    }
    
    [array1 release];

    // Demos putting integers into the array
    
    NSArray *array2 = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:1],
                       [NSNumber numberWithInt:2],
                       [NSNumber numberWithInt:3], nil];
    for (int i=0; i < [array2 count]; i++) {
        NSLog(@"Array2[%i]: %@", i, [array2 objectAtIndex:i]);
        NSNumber *num = [array2 objectAtIndex:i];
        NSLog(@"array2[%i]: %i", i, [num intValue]);
    }
    
    for (NSNumber *num in array2) {
        NSLog(@"num: %@", num);
        NSLog(@"num: %i", [num intValue]);
    }
    
    [array2 release];
    
    

    [pool drain];
    return 0;
}

