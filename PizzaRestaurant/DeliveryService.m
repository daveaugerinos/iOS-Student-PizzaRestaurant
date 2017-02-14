//
//  DeliveryService.m
//  PizzaRestaurant
//
//  Created by Dave Augerinos on 2017-02-11.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "DeliveryService.h"

@implementation DeliveryService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _deliveryOrders = [[NSMutableArray alloc] init];
        _deliveryCar = [[DeliveryCar alloc] init];
    }
    return self;
}

-(void)deliverPizza:(Pizza *)pizza {
    
    [self.deliveryOrders addObject:pizza];
    [self.deliveryCar deliverPizza:pizza];
    
}

-(NSMutableArray *)deliveredOrders {
    return self.deliveryOrders;
}


@end
