//
//  DiceManager.h
//  dicesterTest
//
//  Created by Akshay Pushparaja on 2/23/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiceManager : NSObject{
    NSString * dice1State;
    NSString * dice2State;
    NSString * dice3State;
    NSString * dice4State;
    NSString * dice5State;
    NSString * dice6State;
    NSMutableArray * diceArray;
}

@property  (nonatomic, retain) NSString *dice1State;
@property  (nonatomic, retain) NSString *dice2State;
@property  (nonatomic, retain) NSString *dice3State;
@property  (nonatomic, retain) NSString *dice4State;
@property  (nonatomic, retain) NSString *dice5State;
@property  (nonatomic, retain) NSString *dice6State;
@property  (nonatomic, retain) NSMutableArray * diceArray;

+(id) sharedDice;

-(int) GetHighScore;
-(void) SetHighScore:(int) Score;
-(void) FillSettingsOnStartup;

@end
