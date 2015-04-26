//
//  MenuScreen.m
//  dicesterTest
//
//  Created by Akshay Pushparaja on 3/20/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "MenuScreen.h"
#import "DiceManager.h"

@implementation MenuScreen {
    CCButton *_playButton;
    CCSprite *_spriteThree;
    CCLabelTTF *_highScoreLabel;
    CCLabelTTF *_currentScoreLabel;
    CCButton *_missionButton;
    CCButton *_infoButton;
    CCButton* _backButton;
}

-(void) didLoadFromCCB {
    self.userInteractionEnabled = TRUE;
    //_playButton.visible = TRUE;
    //[_spriteThree setSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"dieRed3_less.png"]];
    DiceManager *dice = [DiceManager sharedDice];
    [_highScoreLabel setString:[NSString stringWithFormat:@"%d",[dice GetHighScore]]];
    [_currentScoreLabel setString:[NSString stringWithFormat:@"%d",[dice GetCurrentScore]]];
    
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

-(void) info {
    NSLog(@"info");
    CCScene *scene = [CCBReader loadAsScene:@"CreditsScene"];
    CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionUp duration:0.2];
    [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];
}

-(void) back {
    NSLog(@"back");
    CCScene *scene = [CCBReader loadAsScene:@"CreditsScene"];
    CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionRight duration:0.2];
    [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];
}

@end
