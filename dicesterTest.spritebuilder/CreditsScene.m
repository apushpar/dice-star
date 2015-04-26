//
//  CreditsScene.m
//  dicesterTest
//
//  Created by Akshay Pushparaja on 4/23/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CreditsScene.h"

@implementation CreditsScene {
    CCButton* _closeButton;
    CCNodeColor* _colorBg;
    CCButton* _otherDesignButton;
}

-(void) didLoadFromCCB {
    int random_num = arc4random_uniform(3);
    if (random_num == 0) {
        _colorBg.color = [CCColor greenColor];
    }else if (random_num == 1){
        _colorBg.color = [CCColor redColor];
    }else if (random_num == 2) {
        _colorBg.color = [CCColor whiteColor];
    }
    
    _colorBg.visible = true;
}

-(void) close {
    NSLog(@"credit scene close");
    CCScene *scene = [CCBReader loadAsScene:@"NewMenu"];
    CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionDown duration:0.2];
    [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];
}


-(void) other {
    NSLog(@"credit scene other design");
    CCScene *scene = [CCBReader loadAsScene:@"MenuScreen"];
    CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionLeft duration:0.2];
    [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];
}

@end
