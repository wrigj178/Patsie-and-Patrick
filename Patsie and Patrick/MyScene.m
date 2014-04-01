//
//  MyScene.m
//  Patsie and Patrick
//
//  Created by Jasmine Wright & Crystal Tong on 3/11/14.
//  Copyright (c) 2014 Jasmine Wright & Crystal Tong. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

{
    SKSpriteNode *_background;
    SKSpriteNode *_l1patsiepatrick;
    SKSpriteNode *_l1patsiepatrickannoyed;
    SKSpriteNode *_l1patsiepatricktickedoff;
    SKSpriteNode *_l1patsiepatricktickangry;
}


-(instancetype)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size])
    {
        // NEED TO PUT IMAGES IN THE FILE W/ CORRECT NAMES
        _l1patsiepatrick = [SKSpriteNode spriteNodeWithImageNamed:@"L1 Patsie+Patrick"];
        _l1patsiepatrick.position = CGPointMake(self.size.width * 0.52,
                                       self.size.height * 0.49);
        
//        _l1patsiepatrickannoyed; = [SKSpriteNode spriteNodeWithImageNamed:@"l1patsiepatrickannoyed"];
//        _l1patsiepatrickannoyed; = CGPointMake(self.size.width * 0.25,
//                                        self.size.height * 0.50);
//        _l1patsiepatrickannoyed;.physicsBody =
//        [SKPhysicsBody bodyWithRectangleOfSize:_l1patsiepatrickannoyed;size];
//        
//        _l1patsiepatricktickedoff = [SKSpriteNode spriteNodeWithImageNamed:@"l1patsiepatricktickedoff"];
//        _l1patsiepatricktickedoff = CGPointMake(self.size.width * 0.50,
//                                       self.size.height * 0.50);
//        _l1patsiepatricktickedoff.physicsBody =
//        [SKPhysicsBody bodyWithCircleOfRadius:_l1patsiepatricktickedoff.size.width/2];
//        
//        __l1patsiepatricktickangry = [SKSpriteNode spriteNodeWithImageNamed:@"l1patsiepatricktickangry"];
//        __l1patsiepatricktickangry.position = CGPointMake(self.size.width * 0.75,
//                                         self.size.height * 0.5);
        [self addChild:_l1patsiepatrick];
//        [self addChild:_l1patsiepatricktickedoff];
//        [self addChild:__l1patsiepatricktickangry];
        self.physicsBody =
        [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        
        
        //1
        CGMutablePathRef l1patsiepatrickPath = CGPathCreateMutable();
        //2
        CGPathMoveToPoint(
                          l1patsiepatrickPath, nil, -_l1patsiepatrick.size.width/2, -_l1patsiepatrick.size.height/4);
        //3
        CGPathAddLineToPoint(l1patsiepatrickPath, nil, -_l1patsiepatrick.size.width/4, -_l1patsiepatrick.size.height/2);
        CGPathAddLineToPoint(l1patsiepatrickPath, nil, _l1patsiepatrick.size.width/4, -_l1patsiepatrick.size.height/2);
        CGPathAddLineToPoint(l1patsiepatrickPath, nil, _l1patsiepatrick.size.width/2, -_l1patsiepatrick.size.height/4);
        CGPathAddLineToPoint(l1patsiepatrickPath, nil, _l1patsiepatrick.size.width/2, _l1patsiepatrick.size.height/4);
        CGPathAddLineToPoint(l1patsiepatrickPath, nil, _l1patsiepatrick.size.width/4, _l1patsiepatrick.size.height/2);
        CGPathAddLineToPoint(l1patsiepatrickPath, nil, -_l1patsiepatrick.size.width/4, _l1patsiepatrick.size.height/2);
        CGPathAddLineToPoint(l1patsiepatrickPath, nil, -_l1patsiepatrick.size.width/2, _l1patsiepatrick.size.height/4);
        
        //4
        _l1patsiepatrick.physicsBody =
        [SKPhysicsBody bodyWithPolygonFromPath:l1patsiepatrickPath];
        //5
        CGPathRelease(l1patsiepatrickPath);
        
        [self runAction:
         [SKAction repeatAction:
          [SKAction sequence:
           @[[SKAction performSelector:@selector(spawnPresents)
                              onTarget:self],
             [SKAction waitForDuration:0.02]
             ]]
                          count:100]
           ];
         }
    return self;
}
         
- (void)initializeScene
        {
            self.physicsBody =
            [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
            SKSpriteNode* bg =
            [SKSpriteNode spriteNodeWithImageNamed:@"L1 background"];
            bg.position =
            CGPointMake(self.size.width/2, self.size.height/2);
            [self addChild: bg];
            [self addBackground];
            
}
- (void)addBackground
        {
            _background =
            [SKSpriteNode spriteNodeWithImageNamed:@"L1 Background"];
            _background.position = CGPointMake(270, 15);
            [self addChild:_background];
            
            CGSize contactSize = CGSizeMake(40, 30);
            _background.physicsBody =
            [SKPhysicsBody bodyWithRectangleOfSize:contactSize];
            _background.physicsBody.dynamic = NO;
            
            
}


- (void)spawnPresents
{
    SKSpriteNode *present =
    [SKSpriteNode spriteNodeWithImageNamed:@"present"];
    present.position = CGPointMake(
                                (float)(arc4random()%(int)self.size.width),
                                self.size.height - present.size.height);
    present.physicsBody =
    [SKPhysicsBody bodyWithCircleOfRadius:present.size.width/2];
    present.name = @"present";
    [self addChild:present];
    
    present.physicsBody.restitution = 1.0;
    present.physicsBody.density = 20.0;
    
    SKSpriteNode *badPresent =
    [SKSpriteNode spriteNodeWithImageNamed:@"Bad present"];
    badPresent.position = CGPointMake(
                                   (float)(arc4random()%(int)self.size.width),
                                   self.size.height - badPresent.size.height);
    badPresent.physicsBody =
    [SKPhysicsBody bodyWithCircleOfRadius:badPresent.size.width/2];
    badPresent.name = @"Bad present";
    [self addChild:badPresent];
    
    badPresent.physicsBody.restitution = 1.0;
    badPresent.physicsBody.density = 20.0;
    
    SKSpriteNode *badPresentRight =
    [SKSpriteNode spriteNodeWithImageNamed:@"Bad present Right"];
    badPresentRight.position = CGPointMake(
                                      (float)(arc4random()%(int)self.size.width),
                                      self.size.height - badPresentRight.size.height);
    badPresentRight.physicsBody =
    [SKPhysicsBody bodyWithCircleOfRadius:badPresentRight.size.width/2];
    badPresentRight.name = @"bad Present Right";
    [self addChild:badPresentRight];
    
    badPresentRight.physicsBody.restitution = 1.0;
    badPresentRight.physicsBody.density = 20.0;

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (SKSpriteNode *node in self.children) {
        if ([node.name isEqualToString:@"present"])
            [node.physicsBody applyImpulse:
             CGVectorMake(0, arc4random()%50)];
        if ([node.name isEqualToString:@"Bad present"])
            [node.physicsBody applyImpulse:
             CGVectorMake(0, arc4random()%50)];
        if ([node.name isEqualToString:@"Bad present Right"])
            [node.physicsBody applyImpulse:
             CGVectorMake(0, arc4random()%50)];
        if ([node.name isEqualToString:@"Bad present Three"])
            [node.physicsBody applyImpulse:
             CGVectorMake(0, arc4random()%50)];
    }
    SKAction *shake = [SKAction moveByX:0 y:10 duration:0.05];
    [self runAction:
     [SKAction repeatAction:
      [SKAction sequence:@[shake, [shake reversedAction]]]
                      count:5]];
}


@end
