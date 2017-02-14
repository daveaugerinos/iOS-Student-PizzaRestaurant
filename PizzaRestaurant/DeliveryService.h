//
//  DeliveryService.h
//  PizzaRestaurant
//
//  Created by Dave Augerinos on 2017-02-11.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"
#import "DeliveryCar.h"

@interface DeliveryService : NSObject

@property (nonatomic, strong) NSMutableArray *deliveryOrders;

@property (nonatomic, strong) DeliveryCar *deliveryCar;

-(void)deliverPizza:(Pizza *)pizza;
-(NSMutableArray *)deliveredOrders;

@end
