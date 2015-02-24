//
//  Rand2.m
//  dicesterTest
//
//  Created by Akshay Pushparaja on 2/20/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Rand2.h"
#import "DiceManager.h"

@implementation Rand2

-(void)d1 {
    CCLOG(@"Yo d1 clicked");
    DiceManager *myDice = [DiceManager sharedDice];
    //NSLog(@"Yo %@", myDice.dice1State);
    [myDice.diceArray replaceObjectAtIndex:0 withObject:@1];
    NSLog (@"Element %@", [myDice.diceArray objectAtIndex: 0]);
}

-(void)d2 {
    CCLOG(@"d2 clicked AP");
    DiceManager *myDice = [DiceManager sharedDice];
    //NSLog(@"Yo_0 %@", myDice.dice2State);
    //myDice.dice2State = @"1";
    //NSLog(@"Yo_1 %@", myDice.dice2State);
    //NSLog (@"Element %@", [myDice.diceArray objectAtIndex: 2]);
    [myDice.diceArray replaceObjectAtIndex:1 withObject:@1];
    NSLog (@"Element %@", [myDice.diceArray objectAtIndex: 1]);
}

-(void)d3 {
    CCLOG(@"d3 clicked");
    //self.isD3Set = TRUE;
    DiceManager *myDice = [DiceManager sharedDice];
    [myDice.diceArray replaceObjectAtIndex:2 withObject:@1];
    NSLog (@"Element %@", [myDice.diceArray objectAtIndex: 2]);
}

-(void)d4 {
    CCLOG(@"d4 clicked");
    //self.isD4Set = TRUE;
    DiceManager *myDice = [DiceManager sharedDice];
    [myDice.diceArray replaceObjectAtIndex:3 withObject:@1];
    NSLog (@"Element %@", [myDice.diceArray objectAtIndex: 3]);
    
}

-(void)d5 {
    CCLOG(@"d5 clicked");
    //self.isD5Set = TRUE;
    DiceManager *myDice = [DiceManager sharedDice];
    [myDice.diceArray replaceObjectAtIndex:4 withObject:@1];
    NSLog (@"Element %@", [myDice.diceArray objectAtIndex: 4]);
    
}

-(void)d6 {
    CCLOG(@"d6 clicked");
    //self.isD6Set = TRUE;
    DiceManager *myDice = [DiceManager sharedDice];
    [myDice.diceArray replaceObjectAtIndex:5 withObject:@1];
    NSLog (@"Element %@", [myDice.diceArray objectAtIndex: 5]);
    
}



@end
