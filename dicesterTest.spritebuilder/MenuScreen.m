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
}

-(void) didLoadFromCCB {
    self.userInteractionEnabled = TRUE;
    //_playButton.visible = TRUE;
    //[_spriteThree setSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"dieRed3_less.png"]];
    DiceManager *dice = [DiceManager sharedDice];
    [_highScoreLabel setString:[NSString stringWithFormat:@"HighScore: %d",[dice GetHighScore]]];
    
}

- (void) play {
    CCScene *scene = [CCBReader loadAsScene:@"MainScene"];
    CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionUp duration:0.2];
    [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];
    //NSLog(@"PLay button clicked");
}

@end
