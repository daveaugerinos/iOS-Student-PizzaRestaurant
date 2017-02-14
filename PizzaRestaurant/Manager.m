//
//  Manager.m
//  PizzaRestaurant
//
//  Created by Dave Augerinos on 2017-02-10.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "Manager.h"

@implementation Manager

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    
    for(NSString *topping in toppings) {
        if([topping isEqualToString:@"anchovies"]) {
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    
    return NO;
}

-(void)kitchenDidMakePizza:(Pizza *)pizza {
    [self.deliveryService deliverPizza:pizza];
}


@end
