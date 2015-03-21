//
//  MenuScreen.m
//  dicesterTest
//
//  Created by Akshay Pushparaja on 3/20/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "MenuScreen.h"

@implementation MenuScreen {
    CCButton *_playButton;
}

-(void) didLoadFromCCB {
    self.userInteractionEnabled = TRUE;
    _playButton.visible = TRUE;
}

- (void) play {
    CCScene *scene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:scene];
    //NSLog(@"PLay button clicked");
}

@end
