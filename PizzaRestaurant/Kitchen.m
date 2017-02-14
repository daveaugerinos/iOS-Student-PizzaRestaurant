//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings
{
    // Check if delegate exists and if a pizza should be made
    if(self.delegate && [self.delegate kitchen:self shouldMakePizzaOfSize:size andToppings:toppings]) {
        
        Pizza *myPizza;
        
        // Check if pizza should be upgraded
        if([self.delegate kitchenShouldUpgradeOrder:self]) {
            
            // Create a large size pizza with requested topping
            myPizza = [[Pizza alloc] initWithSize:Large andToppings:toppings];
        }
        
        else {
            // Otherwise make a pizza base on size requested
            myPizza = [[Pizza alloc] initWithSize:size andToppings:toppings];
        }
        
        // Check if delegate has implemented optional method
        if([self.delegate respondsToSelector:@selector(kitchenDidMakePizza:)]) {
            
            // Check if pizza was made
            [self.delegate kitchenDidMakePizza:myPizza];
        }
        
        return myPizza;
    }
    
    return nil;
}

@end

