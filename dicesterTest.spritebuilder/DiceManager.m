//
//  DiceManager.m
//  dicesterTest
//
//  Created by Akshay Pushparaja on 2/23/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "DiceManager.h"

#define kHighScoreKeyName @"HighScoreKey"
#define kCurrentScoreKeyName @"CurrentScoreKey"

@implementation DiceManager {
    int _highScore;
    int _currentScore;
}

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

-(int) GetHighScore{
    return _highScore;
}

-(int) GetCurrentScore{
    return _currentScore;
}
-(void)SetHighScore:(int)Score{
    if(Score > _highScore) {
        _highScore = Score;
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def setObject:[NSNumber numberWithInt:_highScore] forKey:kHighScoreKeyName];
        [def synchronize];
    }
}

-(void)SetCurrentScore:(int)Score{
    _currentScore = Score;
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:[NSNumber numberWithInt:_currentScore] forKey:kCurrentScoreKeyName];
    [def synchronize];
}

-(void) FillSettingsOnStartup {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    NSInteger hscore = [[def objectForKey:kHighScoreKeyName] integerValue];
    //NSInteger cscore = [[def objectForKey:kCurrentScoreKeyName] integerValue];
    
    _highScore = hscore;
    _currentScore = 0;
}

@end
