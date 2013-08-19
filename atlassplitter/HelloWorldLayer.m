//
//  HelloWorldLayer.m
//  atlassplitter
//
//  Created by Sergio Santos on 16/02/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

#define PATH_TO_PLIST @""
#define PATH_TO_FOLDER @""
#define kScale 1.0f

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:PATH_TO_PLIST];
        
        NSDictionary *frames = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrames];

        for(id key in frames) {
            //NSLog(@"key=%@ value=%@", key, [frames objectForKey:key]);
            [self saveSpriteToFile:key inFolder:PATH_TO_FOLDER];
        }
    
	}
	return self;
}

-(void) saveSpriteToFile:(NSString *)name inFolder:(NSString *) folder {
    CCSprite *sprite = [CCSprite spriteWithSpriteFrameName:name];
    CGSize spriteSize = [sprite contentSize];
    int nWidth = spriteSize.width;
    int nHeight = spriteSize.height;
    nWidth *= kScale;
    nHeight *= kScale;
    [sprite setPosition:ccp(spriteSize.width / 2, spriteSize.height / 2)];
    [sprite setScale:kScale];
    [self addChild:sprite];
    
    CCRenderTexture* render = [CCRenderTexture renderTextureWithWidth:sprite.contentSize.width height:sprite.contentSize.height];
    [render begin];
    [sprite visit];
    [render end];
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *documentsDirectory = [paths objectAtIndex:0];
    [render saveToFile:[NSString stringWithFormat:@"%@/%@", folder, name] format:kCCImageFormatPNG];
    
    [self removeChild:sprite cleanup:YES];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
