//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kitchen.h"
#import "Pizza.h"
#import "Manager.h"
#import "CheeryManager.h"
#import "InputCollector.h"
#import "DeliveryService.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {

        // Create Kitchen and Managers
        Kitchen *restaurantKitchen = [[Kitchen alloc] init];
        Manager *manager = [[Manager alloc] init];
        CheeryManager *cheeryManager = [[CheeryManager alloc] init];
        DeliveryService *deliveryService = [[DeliveryService alloc] init];
        
        // Assign delivery service
        manager.deliveryService = deliveryService;
        cheeryManager.deliveryService = deliveryService;
        
        BOOL runLoop = YES;
        
        while (runLoop) {
            
            // Output menu
            NSString *managerMenu = (@"Please select number:\n1. Manager\n2. Cheery Manager\n3. No Manager\n4. Quit.\n>");

            // Create collector object and collect user input
            NSString *managerString = [[[InputCollector alloc] init] inputForPrompt:managerMenu];
            
            NSLog(@"You selected %@", managerString);
            
            BOOL placeOrder = NO;
            
            // Check if user wants to quit and if so exit loop
            if ([managerString isEqualToString:@"4"]) {
                NSLog(@"Exiting Pizza Restaurant...\n");
                break;
            }
            
            // Make manager the delegate
            else if([managerString isEqualToString:@"1"]) {
                restaurantKitchen.delegate = manager;
                placeOrder = YES;
            }
            
            // Make cheery manager the delegate
            else if ([managerString isEqualToString:@"2"]) {
                restaurantKitchen.delegate = cheeryManager;
                placeOrder = YES;
            }

            // Try with no manager
            else if ([managerString isEqualToString:@"3"]) {
                NSLog(@"Bypassing management");
                 restaurantKitchen.delegate = nil;
                placeOrder = YES;
            }
            
            // Check for valid choice
            if(placeOrder) {
                
                NSLog(@"Place order:");
                
                // Output menu
                NSString *pizzaMenu = (@"Please pick your pizza size and toppings:\n> ");
                
                // Create collector object and collect user input
                NSString *pizzaString = [[[InputCollector alloc] init] inputForPrompt:pizzaMenu];
                
                NSLog(@"Input was %@", pizzaString);
                
                // Take the first word of the command as the size, and the rest as the toppings
                NSArray *commandWords = [pizzaString componentsSeparatedByString:@" "];
                
                // And then send some message to the kitchen...
                if([commandWords count] > 1) {
                    
                    NSArray *orderSize = [commandWords subarrayWithRange:NSMakeRange(0, [commandWords count]-1)];
                    NSArray *toppings = [commandWords subarrayWithRange:NSMakeRange(1, [commandWords count]-1)];
                    
                    Pizza *myPizza;
                    
                    if([orderSize[0] isEqualToString:@"small"]) {
                        myPizza = [restaurantKitchen makePizzaWithSize:Small toppings:toppings];
                    }
                    
                    else if([orderSize[0] isEqualToString:@"medium"]) {
                        myPizza = [restaurantKitchen makePizzaWithSize:Medium toppings:toppings];
                    }
                    
                    else if([orderSize[0] isEqualToString:@"large"]) {
                        myPizza = [restaurantKitchen makePizzaWithSize:Large toppings:toppings];
                    }
                    
                    else {
                        NSLog(@"Invalid order.\n");
                    }
                    
                    // Output order
                    if(myPizza) {
                        
                        NSMutableString *orderString = [[NSMutableString alloc] init];
                        
                        for (NSString *myTopping in myPizza.toppings)
                        {
                            [orderString appendString:myTopping];
                            [orderString appendString:@" "];
                        }
                        
                        NSString *myPizzaSize;
                        
                        if((unsigned long)myPizza.size == 0) {
                            myPizzaSize = @"small";
                        }
                        
                        else if((unsigned long)myPizza.size == 1) {
                            myPizzaSize = @"medium";
                        }
                        
                        else if((unsigned long)myPizza.size == 2) {
                            myPizzaSize = @"large";
                        }
                        
                        NSLog(@"Order for %@ pizza with %@toppings\n", myPizzaSize, orderString );
                    }
                    
                    else {
                        NSLog(@"No pizza will be made!\n");
                    }
                    
                }
                
                else {
                    NSLog(@"Invalid order.\n");
                }

            }
        
            else {
                NSLog(@"Invalid choice");
            }
            
            // Output delivered orders
            NSMutableArray *ordersDelivered = [deliveryService deliveredOrders];
            
            NSLog(@"Delivery Service orders:\n");
                  
            for(Pizza *order in ordersDelivered) {
                NSLog(@"> %@\n", [order description]);
            }
        }
    }
    
    return 0;
}

