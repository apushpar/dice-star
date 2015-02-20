#import "MainScene.h"
#import "Parent.h"

@implementation MainScene{
    Parent *_parent;
    CCLabelTTF *_timeLabel;
    CCLabelTTF *_scoreLabel;
}

-(void) didLoadFromCCB {
    self.userInteractionEnabled = TRUE;
    
    CCNode* randomTile = [CCBReader load:@"Rand"];
    randomTile.position = ccp(0, 0);
}

@end
