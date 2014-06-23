#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    character = (Character*)[CCBReader load: @"Character"];
    [physicNode addChild:character];
    
    timeSinceObstacle = 0.0f;
    
    [self addObstacle];
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    [character flap];
}

-(void)update:(CCTime)delta
{
    timeSinceObstacle += delta;
    if (timeSinceObstacle > 2.0f)
    {
        [self addObstacle];
        timeSinceObstacle = 0.0f;
    }
}

// put new methods here

@end
