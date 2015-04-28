//
//  OddBall.m
//  dicesterTest
//
//  Created by Akshay Pushparaja on 4/28/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "OddBall.h"
#import "Parent.h"
#import "Rand.h"
#import "Rand1.h"
#import "Rand2.h"
#import "DiceManager.h"
#import "DKQueue.h"
#import "BlinkingFaceOne.h"

@implementation OddBall {

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
}

-(void) didLoadFromCCB {
    self.userInteractionEnabled = TRUE;
    _restartButton.visible = FALSE;
    _tiles = [[NSMutableArray alloc] init];
    timerValue = 60;
    manageDelta = 200;
    score = 0;
    int setRestart = 0;
    myDice = [DiceManager sharedDice];
    
    int random_num = arc4random_uniform(3);
    if (random_num == 0) {
        _barColor.color = [CCColor lightGrayColor];
    }else if (random_num == 1){
        _barColor.color = [CCColor whiteColor];
    }else if (random_num == 2) {
        _barColor.color = [CCColor grayColor];
    }
    
    _barColor.visible = true;
    
    //gameQueue = [[NSMutableArray alloc] initWithObjects:@0,@1,@2,@3,@4,@5, nil];
    gameQueue = [[NSMutableArray alloc] initWithObjects:@0,@2,@4, nil];
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
    Red1.opacity = 1;
    [self addChild:Red1];
    
    Red2 = [CCSprite spriteWithImageNamed:@"diceAsset/dieRed2.png"];
    Red2.positionType = CCPositionTypeMake(CCPositionUnitNormalized, CCPositionUnitNormalized, CCPositionReferenceCornerTopRight);
    Red2.position = ccp(0.122,0.46);
    Red2.scale = 0.5;
    Red2.opacity = 0;
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
    Red4.opacity = 0;
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
    Red6.opacity = 0;
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
    manageDelta += 1;
    
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
    }
    
    
    if (setRestart == 0) {
        for (int i=0; i<6; i++) {
            if ([[myDice.diceArray objectAtIndex:i] isEqual:[NSNumber numberWithInt:1]]) {
                NSLog(@"dice %d is set", i+1);
                if ([[gameQueue objectAtIndex:0] isEqual:[NSNumber numberWithInt:i]]) {
                    NSLog(@"correct dice face");
                    if (i == 0) {
                        Red3.opacity = 1;
                        Red1.scale = 0.7;
                    }
                    if (i == 1) {
                        //Red4.opacity = 1;
                        //Red2.scale = 0.7;
                    }
                    if (i == 2) {
                        Red5.opacity = 1;
                        Red3.scale = 0.7;
                    }
                    if (i == 3) {
                        Red6.opacity = 1;
                        Red4.scale = 0.7;
                    }
                    if (i == 4) {
                        Red5.scale = 0.7;
                        score++;
                        _scoreLabel.string = [NSString stringWithFormat:@"%d", score];
                        
                        Red1.scale = 0.5;
                        Red1.opacity = 1;
                        Red3.scale = 0.5;
                        Red3.opacity = 0.3;
                        Red5.scale = 0.5;
                        Red5.opacity= 0.3;
                    }
                    if (i == 5) {
                        Red6.scale = 0.7;
                    }
                    [gameQueue removeObjectAtIndex:0];
                    NSLog(@"peek after dequeue %@", [gameQueue objectAtIndex:0]);
                    [gameQueue addObject:[NSNumber numberWithInt:i]];
                    NSLog(@"peek after dequeue %@", [gameQueue objectAtIndex:[gameQueue count]-1]);
                    NSLog(@"GAMEQUEUE COUNT: %lu and i: %d",(unsigned long)[gameQueue count], i);
                }else{
                    NSLog(@"INCORRECT dice face");
                    setRestart = 1;
                    _restartButton.visible = TRUE;
                    CCScene *scene = [CCBReader loadAsScene:@"MissionSelector"];
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
