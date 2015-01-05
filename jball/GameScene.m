//
//  GameScene.m
//  jball
//
//  Created by pivotal on 1/5/15.
//  Copyright (c) 2015 pivotal. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

- (instancetype)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    if (self) {
        <#statements#>
    }
    return self;
}
-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    self.physicsWorld.gravity = CGVectorMake(0, 0);
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    self.physicsBody.categoryBitMask = SceneEdgeCategory;

    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"Hello, World!";
    myLabel.fontSize = 65;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    
    [self addChild:myLabel];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [[SKSpriteNode alloc] initWithImageNamed:@"ball"];
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        physicsBody.velocity = CGVectorMake(20, 20);
        [physicsBody applyForce:CGVectorMake(rand(), rand())];
        physicsBody.friction = 0.0f; //Don't slow down after hitting the edge of the screen
        physicsBody.linearDamping = 0.0f; //Don't slow down!
        sprite.physicsBody = physicsBody;
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
