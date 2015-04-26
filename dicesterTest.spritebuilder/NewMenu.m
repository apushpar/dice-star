//
//  NewMenu.m
//  dicesterTest
//
//  Created by Akshay Pushparaja on 4/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "NewMenu.h"
#import "DiceManager.h"

@implementation NewMenu {
    CCNodeColor* _colorBg;
    CCButton* _infoButton;
    CCLabelTTF* _highScoreLabel;
    CCLabelTTF* _currentScoreLabel;
    CCButton* _missionButton;
}

-(void) didLoadFromCCB {
    
    self.userInteractionEnabled = TRUE;
    DiceManager *dice = [DiceManager sharedDice];
    [_highScoreLabel setString:[NSString stringWithFormat:@"%d",[dice GetHighScore]]];
    [_currentScoreLabel setString:[NSString stringWithFormat:@"%d",[dice GetCurrentScore]]];
    
    int random_num = arc4random_uniform(3);
    if (random_num == 0) {
        _colorBg.color = [CCColor blackColor];
    }else if (random_num == 1){
        _colorBg.color = [CCColor blueColor];
    }else if (random_num == 2) {
        _colorBg.color = [CCColor grayColor];
    }
    
    _colorBg.visible = true;
}

-(void) info {
    NSLog(@"info");
    CCScene *scene = [CCBReader loadAsScene:@"CreditsScene"];
    CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionUp duration:0.2];
    [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];
}

- (void) play {
    CCScene *scene = [CCBReader loadAsScene:@"MainScene"];
    CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionUp duration:0.2];
    [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];
    //NSLog(@"PLay button clicked");
}

-(void) mission {
    NSLog(@"mission");
    CCScene *scene = [CCBReader loadAsScene:@"MissionSelector"];
    CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionUp duration:0.2];
    [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];
}

@end
