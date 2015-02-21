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
    NSArray *_tiles;
}

-(void) didLoadFromCCB {
    self.userInteractionEnabled = TRUE;
    
/*    CCNode* randomTile = [CCBReader load:@"Rand"];
    randomTile.position = ccp(0, 0);
    
    CCNode *oneDice = [CCBReader load:@"Dice"];
    oneDice.position = ccp(10,10);
    [self addChild:randomTile];
    
    randomTile.position = ccp(0, 240);
    [self addChild:randomTile];
 */
    //CCNode *rand = [CCBReader load:@"Rand"];
    //CCNode *rand1 = [CCBReader load:@"Rand1"];
    //CCNode *rand2 = [CCBReader load:@"Rand2"];
 
    //_tiles = @[rand, rand1, rand2];
    //CCNode *rand = [[NSClassFromString(@"Rand") alloc] init];
    //Class rand1 = NSClassFromString(@"Rand1");
    //Class rand2 = NSClassFromString(@"Rand2");
    //_tiles = @[rand, rand1, rand2];
    for (int i=0; i<3; i++) {
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
    }
}

/*-(void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    
}*/

@end
