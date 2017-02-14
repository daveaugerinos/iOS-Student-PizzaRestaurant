//
//  KitchenDelegate.h
//  PizzaRestaurant
//
//  Created by Dave Augerinos on 2017-02-10.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"

@class Pizza, Kitchen;

@protocol KitchenDelegate <NSObject>

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings;
- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen;

@optional

- (void)kitchenDidMakePizza:(Pizza *)pizza;

@end
