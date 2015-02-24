//
//  DiceManager.m
//  dicesterTest
//
//  Created by Akshay Pushparaja on 2/23/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "DiceManager.h"

@implementation DiceManager

@synthesize dice1State;
@synthesize dice2State;
@synthesize dice3State;
@synthesize dice4State;
@synthesize dice5State;
@synthesize dice6State;
@synthesize diceArray;

+(id)sharedDice {
    static DiceManager *myDice = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myDice = [[self alloc] init];
    });
    return myDice;
}

-(id)init {
    if (self = [super init]) {
        dice1State = @"0";
        dice2State = @"0";
        dice3State = @"0";
        dice4State = @"0";
        dice5State = @"0";
        dice5State = @"0";
        diceArray =  [[NSMutableArray alloc] initWithObjects:@0,@0,@0,@0,@0,@0, nil];
    }
    return self;
}

@end
