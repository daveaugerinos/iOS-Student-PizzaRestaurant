//
//  CheeryManager.h
//  PizzaRestaurant
//
//  Created by Dave Augerinos on 2017-02-10.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KitchenDelegate.h"
#import "Pizza.h"
#import "Kitchen.h"
#import "DeliveryService.h"

@interface CheeryManager : NSObject <KitchenDelegate>

@property (nonatomic, strong) DeliveryService *deliveryService;

@end
