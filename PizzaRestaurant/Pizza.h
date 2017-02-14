//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by Dave Augerinos on 2017-02-09.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PizzaSize) {
    Small,
    Medium,
    Large,
};

@interface Pizza : NSObject

// Properties

@property (nonatomic) PizzaSize size;
@property (nonatomic, strong) NSArray *toppings;


// Methods

-(instancetype)initWithSize:(PizzaSize)size andToppings:(NSArray *)toppings;


@end
