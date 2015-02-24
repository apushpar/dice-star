#import "MainScene.h"
#import "Parent.h"
#import "Rand.h"
#import "Rand1.h"
#import "Rand2.h"
#import "Dice.h"
#import "DiceManager.h"

@implementation MainScene{
    Parent *_parent;
    CCLabelTTF *_timeLabel;
    CCLabelTTF *_scoreLabel;
    NSMutableArray *_tiles;
    int timerValue;
    int manageDelta;
}

-(void) didLoadFromCCB {
    self.userInteractionEnabled = TRUE;
    _tiles = [[NSMutableArray alloc] init];
    timerValue = 60;
    manageDelta = 100;

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
        
        randomTile.position = ccp(0, i*240);
        [self addChild:randomTile];
        [_tiles addObject:randomTile];
        [self schedule:@selector(step) interval:1.0f];
    }
}

- (void)step
{
    
    if (timerValue == 30) {
        NSLog(@"30 seconds");
        [_tiles removeAllObjects];
        [self unschedule:@selector(step)];
    }else{
        timerValue--;
        _timeLabel.string = [NSString stringWithFormat:@"%d", timerValue];
    }
}

-(void)update:(CCTime)delta{
    
    for (CCNode *tile in _tiles) {
    
        tile.position = ccp(tile.position.x, tile.position.y - (manageDelta*delta));
    }
    
    DiceManager *myDice = [DiceManager sharedDice];
    
    /*if ([[myDice.diceArray objectAtIndex:0]  isEqual: @1]) {
        NSLog(@"dice 1 is set");
        [myDice.diceArray insertObject:@0 atIndex:0];
    }
    if ([[myDice.diceArray objectAtIndex:1]  isEqual: @1]) {
        NSLog(@"dice 2 is set");
        [myDice.diceArray insertObject:@0 atIndex:1];
    }
    if ([[myDice.diceArray objectAtIndex:2]  isEqual: @1]) {
        NSLog(@"dice 3 is set");
        [myDice.diceArray insertObject:@0 atIndex:2];
    }
    if ([[myDice.diceArray objectAtIndex:3]  isEqual: @1]) {
        NSLog(@"dice 4 is set");
        [myDice.diceArray insertObject:@0 atIndex:3];
    }
    if ([[myDice.diceArray objectAtIndex:4]  isEqual: @1]) {
        NSLog(@"dice 5 is set");
        [myDice.diceArray insertObject:@0 atIndex:4];
    }
    if ([[myDice.diceArray objectAtIndex:5]  isEqual: @1]) {
        NSLog(@"dice 6 is set");
        [myDice.diceArray insertObject:@0 atIndex:5];
    }
    */
    //NSLog(@"%lu",(unsigned long)[myDice.diceArray count]);
    for (int i=0; i<6; i++) {
        if ([[myDice.diceArray objectAtIndex:i] isEqual:@1]) {
            NSLog(@"dice %d is set", i+1);
            [myDice.diceArray replaceObjectAtIndex:i withObject:@0];
        }
    }
}

@end
