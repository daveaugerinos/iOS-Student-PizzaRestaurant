//
//  CheeryManager.m
//  PizzaRestaurant
//
//  Created by Dave Augerinos on 2017-02-10.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "CheeryManager.h"

@implementation CheeryManager

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    
    return YES;
}

-(void)kitchenDidMakePizza:(Pizza *)pizza {
    [self.deliveryService deliverPizza:pizza];
}

@end
