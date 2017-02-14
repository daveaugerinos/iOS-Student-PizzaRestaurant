//
//  InputCollector.m
//  PizzaRestaurant
//
//  Created by Dave Augerinos on 2017-02-10.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

-(NSString *)inputForPrompt:(NSString *)promptString {
    
    // Char array with 255 max characters
    char inputChars[255];
    
    // Output promptString
    NSLog(@"%@", promptString);
    
    // Read a line of input and convert to NSString
    fgets(inputChars, 255, stdin);
    NSString *inputString = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
    
    // Trim string to remove whitespace and newline characters
    NSString *trimmedString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return trimmedString;
}

@end
