#import "MainScene.h"
#import "Parent.h"
#import "Rand.h"
#import "Rand1.h"
#import "Rand2.h"
#import "Dice.h"

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
    manageDelta = 200;

    for (int i=0; i<45; i++) {
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
}

@end
