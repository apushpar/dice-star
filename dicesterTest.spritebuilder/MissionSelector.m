//
//  MissionSelector.m
//  dicesterTest
//
//  Created by Akshay Pushparaja on 4/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "MissionSelector.h"

@implementation MissionSelector {
    CCButton *_exitButton;
}

-(void) didLoadFromCCB {
    self.userInteractionEnabled = TRUE;
}

-(void) exit {
    //CCLOG(@"Akshay");
    CCScene *scene = [CCBReader loadAsScene:@"NewMenu"];
    CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionDown duration:0.2];
    [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];
}

@end
