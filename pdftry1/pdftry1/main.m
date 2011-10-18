//
//  main.m
//  pdftry1
//
//  Created by Brian Wilson on 10/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

float circleArea(float theRadius);    // [3.3]
float rectangleArea(float width, float height);    // [3.4]

int main (int argc, const char * argv[])    // [3.6]
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    int pictureWidth;
    float pictureHeight, pictureSurfaceArea, circleRadius, circleSurfaceArea;
    pictureWidth = 8;
    pictureHeight = 4.5;
    circleRadius = 5.0;
    pictureSurfaceArea =  pictureWidth * pictureHeight;
    circleSurfaceArea = circleArea(circleRadius);
    NSLog(@"Area of picture: %f.  Area of circle: %10.2f.",
          pictureSurfaceArea, circleSurfaceArea);
    [pool drain];
    return 0; }

float circleArea(float theRadius)
{
    float theArea;
    theArea = 3.1416 * theRadius * theRadius;
    return theArea;
}

// [3.22]
float rectangleArea(float width, float height)  // [3.29]
{
    return width*height;
}