//
//  HelloWorldLayer.h
//  atlassplitter
//
//  Created by Sergio Santos on 16/02/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

-(void) saveSpriteToFile:(NSString *) name inFolder:(NSString *) folder;

@end
