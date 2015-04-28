//
//  MissionSelector.m
//  dicesterTest
//
//  Created by Akshay Pushparaja on 4/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "MissionSelector.h"
#import "DiceManager.h"

@implementation MissionSelector {
    CCButton *_exitButton;
    CCButton* _getEvenGameButton;
    CCButton* _oddBallGameButton;
    CCButton* _primeConcernGameButton;
    CCLabelTTF* _getEvenLocked;
    CCLabelTTF* _oddBallLocked;
    CCLabelTTF* _primeConcernLocked;
    DiceManager* myDice;
    CCNode* _oddBallLock;
    CCNode* _getEvenLock;
    CCNode* _primeConcernLock;
}

-(void) didLoadFromCCB {
    self.userInteractionEnabled = TRUE;
    _getEvenGameButton.visible = false;
    _oddBallGameButton.visible = false;
    _primeConcernGameButton.visible = false;
    _getEvenLocked.visible = true;
    _oddBallLocked.visible = true;
    _primeConcernLocked.visible = true;
    _oddBallLock.visible = true;
    _getEvenLock.visible = true;
    _primeConcernLock.visible = true;
    myDice = [DiceManager sharedDice];
    
    if ([myDice GetHighScore] > 5) {
        _oddBallGameButton.visible = true;
        _oddBallLocked.visible = false;
        _oddBallLock.visible = false;
    }
    if ([myDice GetHighScore] > 10) {
        _getEvenGameButton.visible = true;
        _getEvenLocked.visible = false;
        _getEvenLock.visible = false;
    }
    if ([myDice GetHighScore] > 15) {
        _primeConcernGameButton.visible = true;
        _primeConcernLocked.visible = false;
        _primeConcernLock.visible = false;
    }
}

-(void) exit {
    //CCLOG(@"Akshay");
    CCScene *scene = [CCBReader loadAsScene:@"NewMenu"];
    CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionDown duration:0.2];
    [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];
}

-(void) GetEvenGame {
    CCScene *scene = [CCBReader loadAsScene:@"GetEven"];
    CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionDown duration:0.2];
    [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];
}


-(void) OddBallGame {
    CCScene *scene = [CCBReader loadAsScene:@"OddBall"];
    CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionDown duration:0.2];
    [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];
}

-(void) PrimeConcernGame {
    CCScene *scene = [CCBReader loadAsScene:@"PrimeConcern"];
    CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionDown duration:0.2];
    [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];
}

@end
