//
//  BNRItem.m
//  RandomItems
//
//  Created by Gerry O'Brien on 8/12/15.
//  Copyright © 2015 Gerry O'Brien. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype)randomItem
{
    // Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    // Create an immutable array with three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    // Get the index of a random adjective and noun for the lists
    // Note: the % operator, called the modulo operator, gives
    // you the remainder.  So adjectiveIndex is a random number
    // from 0 to 2 inclusive
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", [randomAdjectiveList objectAtIndex:adjectiveIndex],[randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c", '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc]initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    
    return newItem;
                            
}

- (instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
    // Call the superclass's designated initializer
    self = [super init];
    
    // Did the superclass's designated initialize succeed?
    if(self)
    {
        // Give the instance variable initial values
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        
        // Set _dateCreated to the current date and time
        _dateCreated = [[NSDate alloc]init];
    }
    
    // Return the address of the newly initilialized object
    return self;
}

- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

- (instancetype)init
{
    return [self initWithItemName:@"Item"];
}



- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc]initWithFormat:@"%@ (%@): Worth $%d, recorded on %@", self.itemName,
                                   self.serialNumber, self.valueInDollars, self.dateCreated];
                                   
                                   return descriptionString;
}


- (void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}

@end
