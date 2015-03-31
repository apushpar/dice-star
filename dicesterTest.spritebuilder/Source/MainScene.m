#import "MainScene.h"
#import "Parent.h"
#import "Rand.h"
#import "Rand1.h"
#import "Rand2.h"
//#import "Dice.h"
#import "DiceManager.h"
#import "DKQueue.h"

@implementation MainScene{
    Parent *_parent;
    CCLabelTTF *_timeLabel;
    CCLabelTTF *_scoreLabel;
    NSMutableArray *_tiles;
    int timerValue;
    int manageDelta;
    NSMutableArray *gameQueue;
    int score;
    int setRestart;
    CCButton *_restartButton;
    NSMutableArray *_offScreenTile;
}

-(void) didLoadFromCCB {
    self.userInteractionEnabled = TRUE;
    _restartButton.visible = FALSE;
    _tiles = [[NSMutableArray alloc] init];
    timerValue = 60;
    manageDelta = 100;
    score = 0;
    int setRestart = 0;
    gameQueue = [[NSMutableArray alloc] initWithObjects:@0,@1,@2,@3,@4,@5, nil];
    _offScreenTile = nil;
    
    for (int i=0; i<20; i++) {
        int j = arc4random_uniform(3);
        CCNode* randomTile;
        if (j==0) {
            randomTile = [CCBReader load:@"Rand"];
        }else if (j==1){
            randomTile = [CCBReader load:@"Rand1"];
        }else{
            randomTile = [CCBReader load:@"Rand2"];
        }
        
        randomTile.position = ccp(0, (i+2)*240);
        [self addChild:randomTile];
        [_tiles addObject:randomTile];
        [self schedule:@selector(step) interval:1.0f];
    }
}

- (void)step
{
    
    if (timerValue == 0) {
        NSLog(@"30 seconds");
        [_tiles removeAllObjects];
        [self unschedule:@selector(step)];
        _restartButton.visible = TRUE;
        CCScene *scene = [CCBReader loadAsScene:@"MenuScreen"];
        [[CCDirector sharedDirector] replaceScene:scene];

    }
    else{
        timerValue--;
        _timeLabel.string = [NSString stringWithFormat:@"%d", timerValue];
    }
    
    if (timerValue % 5 == 0){
        manageDelta += 10;
    }
    
    if (setRestart == 1) {
        NSLog(@"Restart game command sent");
        [_tiles removeAllObjects];
        [self unschedule:@selector(step)];
    }
}

-(void)update:(CCTime)delta{
    
    for (CCNode *tile in _tiles) {
    
        tile.position = ccp(tile.position.x, tile.position.y - (manageDelta*delta));
        if (tile.position.y < -240) {
                tile.position = ccp(tile.position.x, 4560);
        }
        //NSLog(@"x value: %f",tile.position.y);
    }
    
//    for (CCNode *toRemoveTile in _offScreenTile) {
//        [toRemoveTile removeFromParent];
//        [_tiles removeObject:toRemoveTile];
//        NSLog(@"TILE REMOVED");
//    }

    
    DiceManager *myDice = [DiceManager sharedDice];
    
    if (setRestart == 0) {
    for (int i=0; i<6; i++) {
        if ([[myDice.diceArray objectAtIndex:i] isEqual:[NSNumber numberWithInt:1]]) {
            NSLog(@"dice %d is set", i+1);
            if ([[gameQueue objectAtIndex:0] isEqual:[NSNumber numberWithInt:i]]) {
                NSLog(@"correct dice face");
//                NSNumber* temp = [NSNumber numberWithInt:i];
                [gameQueue removeObjectAtIndex:0];
                NSLog(@"peek after dequeue %@", [gameQueue objectAtIndex:0]);
                [gameQueue addObject:[NSNumber numberWithInt:i]];
                NSLog(@"peek after dequeue %@", [gameQueue objectAtIndex:[gameQueue count]-1]);
                if (i == 5) {
                    score++;
                    _scoreLabel.string = [NSString stringWithFormat:@"%d", score];
                }
            }else{
                NSLog(@"INCORRECT dice face");
                setRestart = 1;
                _restartButton.visible = TRUE;
                CCScene *scene = [CCBReader loadAsScene:@"MenuScreen"];
                CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionDown duration:0.2];
                [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];

            }
            [myDice.diceArray replaceObjectAtIndex:i withObject:@0];
        }
    }
    }
}

- (void)restart {
    CCScene *scene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:scene];
}

@end
