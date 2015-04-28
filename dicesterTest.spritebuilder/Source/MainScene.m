#import "MainScene.h"
#import "Parent.h"
#import "Rand.h"
#import "Rand1.h"
#import "Rand2.h"
//#import "Dice.h"
#import "DiceManager.h"
#import "DKQueue.h"
#import "BlinkingFaceOne.h"

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
    CCSprite *Red1;
    CCSprite *Red2;
    CCSprite *Red3;
    CCSprite *Red4;
    CCSprite *Red5;
    CCSprite *Red6;
    NSMutableArray *statusTracker;
    DiceManager *myDice;
    CCNodeColor* _barColor;
    CCNodeColor* _demoScreen;
    CCButton* _gotItButton;
    CCLabelTTF* _ax;
    CCLabelTTF* _a1;
    CCLabelTTF* _a2;
    CCLabelTTF* _a3;
    CCLabelTTF* _a4;
    CCLabelTTF* _a5;
    CCLabelTTF* _a6;
    CCSprite* _s1;
    CCSprite* _s2;
    CCSprite* _s3;
    CCSprite* _s4;
    CCSprite* _s5;
    CCSprite* _s6;
}

-(void) didLoadFromCCB {
    self.userInteractionEnabled = TRUE;
    _restartButton.visible = FALSE;
    _tiles = [[NSMutableArray alloc] init];
    timerValue = 60;
    manageDelta = 100;
    score = 0;
    int setRestart = 0;
    myDice = [DiceManager sharedDice];
    
    if ([myDice GetDemoStatus]) {
        [self clearDemoScreen];
    }
    
    int random_num = arc4random_uniform(3);
    if (random_num == 0) {
        _barColor.color = [CCColor lightGrayColor];
    }else if (random_num == 1){
        _barColor.color = [CCColor whiteColor];
    }else if (random_num == 2) {
        _barColor.color = [CCColor grayColor];
    }
    
    _barColor.visible = true;
    
    gameQueue = [[NSMutableArray alloc] initWithObjects:@0,@1,@2,@3,@4,@5, nil];
    //gameQueue = [[NSMutableArray alloc] initWithObjects:@0,@1,@2, nil];
    NSUInteger count = [gameQueue count];
    /*for (NSUInteger i = 0; i < count; ++i) {
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [gameQueue exchangeObjectAtIndex:i withObjectAtIndex:n];
    }*/
    //_scoreLabel.position = ccp(180,280);
    /*for (int i = 0; i < count; ++i) {
        NSLog(@"%@",[gameQueue objectAtIndex:i]);
    }*/
    /*CCNode* randomBlink = [CCBReader load:@"BlinkingFaceOne"];
    randomBlink.positionType = CCPositionTypeMake(CCPositionUnitNormalized, CCPositionUnitNormalized, CCPositionReferenceCornerTopRight);
    randomBlink.position = ccp(0.12,0.36);
    randomBlink.scale = 0.75;
    
    [self addChild:randomBlink];*/
    Red1 = [CCSprite spriteWithImageNamed:@"diceAsset/dieRed1.png"];
    Red1.positionType = CCPositionTypeMake(CCPositionUnitNormalized, CCPositionUnitNormalized, CCPositionReferenceCornerTopRight);
    Red1.position = ccp(0.122,0.361);
    Red1.scale = 0.5;
    Red1.opacity = 1.0;
    [self addChild:Red1];
    
    Red2 = [CCSprite spriteWithImageNamed:@"diceAsset/dieRed2.png"];
    Red2.positionType = CCPositionTypeMake(CCPositionUnitNormalized, CCPositionUnitNormalized, CCPositionReferenceCornerTopRight);
    Red2.position = ccp(0.122,0.46);
    Red2.scale = 0.5;
    Red2.opacity = 0.3;
    [self addChild:Red2];
    
    Red3 = [CCSprite spriteWithImageNamed:@"diceAsset/dieRed3.png"];
    Red3.positionType = CCPositionTypeMake(CCPositionUnitNormalized, CCPositionUnitNormalized, CCPositionReferenceCornerTopRight);
    Red3.position = ccp(0.122,0.554);
    Red3.scale = 0.5;
    Red3.opacity = 0.3;
    [self addChild:Red3];
    
    Red4 = [CCSprite spriteWithImageNamed:@"diceAsset/dieRed4.png"];
    Red4.positionType = CCPositionTypeMake(CCPositionUnitNormalized, CCPositionUnitNormalized, CCPositionReferenceCornerTopRight);
    Red4.position = ccp(0.122,0.648);
    Red4.scale = 0.5;
    Red4.opacity = 0.3;
    [self addChild:Red4];
    
    Red5 = [CCSprite spriteWithImageNamed:@"diceAsset/dieRed5.png"];
    Red5.positionType = CCPositionTypeMake(CCPositionUnitNormalized, CCPositionUnitNormalized, CCPositionReferenceCornerTopRight);
    Red5.position = ccp(0.122,0.744);
    Red5.scale = 0.5;
    Red5.opacity = 0.3;
    [self addChild:Red5];
    
    Red6 = [CCSprite spriteWithImageNamed:@"diceAsset/dieRed6.png"];
    Red6.positionType = CCPositionTypeMake(CCPositionUnitNormalized, CCPositionUnitNormalized, CCPositionReferenceCornerTopRight);
    Red6.position = ccp(0.122,0.846);
    Red6.scale = 0.5;
    Red6.opacity = 0.3;
    [self addChild:Red6];
    
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
        
        randomTile.position = ccp(0, (i+2.5)*240);
        [self addChild:randomTile];
        [_tiles addObject:randomTile];
        [self schedule:@selector(step) interval:1.0f];
    }
}

- (void)step
{
    
    /*if (timerValue == 0) {
        NSLog(@"30 seconds");
        [_tiles removeAllObjects];
        [self unschedule:@selector(step)];
        _restartButton.visible = TRUE;
        [myDice SetCurrentScore:score];
        [myDice SetHighScore:score];
        
        //CCScene *scene = [CCBReader loadAsScene:@"MenuScreen"];
        //[[CCDirector sharedDirector] replaceScene:scene];
        CCScene *scene = [CCBReader loadAsScene:@"NewMenu"];
        CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionDown duration:0.2];
        [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];

    }
    else{
        timerValue--;
        _timeLabel.string = [NSString stringWithFormat:@"%d", timerValue];
    }*/
    
    if ([myDice GetDemoStatus]){
        manageDelta += 2;
    }
    
    if (setRestart == 1) {
        NSLog(@"Restart game command sent");
        [_tiles removeAllObjects];
        [self unschedule:@selector(step)];
    }
}

-(void)update:(CCTime)delta{
    
    
    
    if ([myDice GetDemoStatus]) {
        
        for (CCNode *tile in _tiles) {
        
            tile.position = ccp(tile.position.x, tile.position.y - (manageDelta*delta));
            if (tile.position.y < -240) {
                    tile.position = ccp(tile.position.x, 4560);
            }
        }
    }
    
//    for (CCNode *toRemoveTile in _offScreenTile) {
//        [toRemoveTile removeFromParent];
//        [_tiles removeObject:toRemoveTile];
//        NSLog(@"TILE REMOVED");
//    }

    
    
    
    if (setRestart == 0) {
        for (int i=0; i<[gameQueue count]; i++) {
            if ([[myDice.diceArray objectAtIndex:i] isEqual:[NSNumber numberWithInt:1]]) {
                NSLog(@"dice %d is set", i+1);
                if ([[gameQueue objectAtIndex:0] isEqual:[NSNumber numberWithInt:i]]) {
                    NSLog(@"correct dice face");
                    if (i == 0) {
                        Red2.opacity = 1;
                        Red1.scale = 0.7;
                    }
                    if (i == 1) {
                        Red3.opacity = 1;
                        Red2.scale = 0.7;
                    }
                    if (i == 2) {
                        Red4.opacity = 1;
                        Red3.scale = 0.7;
                    }
                    if (i == 3) {
                        Red5.opacity = 1;
                        Red4.scale = 0.7;
                    }
                    if (i == 4) {
                        Red6.opacity = 1;
                        Red5.scale = 0.7;
                    }
                    /*if (i == 5) {
                        Red6.opacity = 1;
                    }*/
    //                NSNumber* temp = [NSNumber numberWithInt:i];
                    [gameQueue removeObjectAtIndex:0];
                    NSLog(@"peek after dequeue %@", [gameQueue objectAtIndex:0]);
                    [gameQueue addObject:[NSNumber numberWithInt:i]];
                    NSLog(@"peek after dequeue %@", [gameQueue objectAtIndex:[gameQueue count]-1]);
                    if (i == ([gameQueue count] - 1)) {
                        score++;
                        _scoreLabel.string = [NSString stringWithFormat:@"%d", score];
                        /*if (arc4random_uniform(7) == 0) {
                            _scoreLabel.color = [CCColor redColor];
                        }else if (arc4random_uniform(7) == 1) {
                            _scoreLabel.color = [CCColor greenColor];
                        }else if (arc4random_uniform(7) == 2) {
                            _scoreLabel.color = [CCColor orangeColor];
                        }else if (arc4random_uniform(7) == 3) {
                            _scoreLabel.color = [CCColor whiteColor];
                        }else if (arc4random_uniform(7) == 4) {
                            _scoreLabel.color = [CCColor blueColor];
                        }else if (arc4random_uniform(7) == 5) {
                            _scoreLabel.color = [CCColor yellowColor];
                        }else if (arc4random_uniform(7) == 6) {
                            _scoreLabel.color = [CCColor purpleColor];
                        }
                        */
                        //Red1.opacity = 0.3;
                        Red2.opacity = 0.3;
                        Red3.opacity = 0.3;
                        Red4.opacity = 0.3;
                        Red5.opacity = 0.3;
                        Red6.opacity = 0.3;
                        Red1.scale = 0.5;
                        Red2.scale = 0.5;
                        Red3.scale = 0.5;
                        Red4.scale = 0.5;
                        Red5.scale = 0.5;
                        Red6.scale = 0.5;
                    }
                }else{
                    NSLog(@"INCORRECT dice face");
                    setRestart = 1;
                    _restartButton.visible = TRUE;
                    [myDice SetCurrentScore:score];
                    [myDice SetHighScore:score];
                    CCScene *scene = [CCBReader loadAsScene:@"NewMenu"];
                    CCTransition *crossFade = [CCTransition transitionMoveInWithDirection:CCTransitionDirectionDown duration:0.2];
                    [[CCDirector sharedDirector] replaceScene:scene withTransition:crossFade];

                }
                [myDice.diceArray replaceObjectAtIndex:i withObject:@0];
            }
        }
    }
}

-(void) clearDemoScreen {
    _demoScreen.visible = false;
    _ax.visible = false;
    _gotItButton.visible = false;
    _a1.visible = false;
    _a2.visible = false;
    _a3.visible = false;
    _a4.visible = false;
    _a5.visible = false;
    _a6.visible = false;
    _s1.visible = false;
    _s2.visible = false;
    _s3.visible = false;
    _s4.visible = false;
    _s5.visible = false;
    _s6.visible = false;

}

- (void)restart {
    CCScene *scene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void)Gotit {
    [myDice SetDemoStatus:true];
    [self clearDemoScreen];
}

@end
