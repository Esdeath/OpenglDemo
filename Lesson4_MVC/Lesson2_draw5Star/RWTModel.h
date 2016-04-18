//
//  RWTModel.h
//  Lesson2_draw5Star
//
//  Created by Asuna on 16/4/17.
//  Copyright © 2016年 Asuna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWTVertex.h"
#import <OpenGLES/gltypes.h>
@class RWTBaseEffect;
@interface RWTModel : NSObject
- (instancetype)initWithName:(const char *)name shader:(RWTBaseEffect *)shader vertices:(RWTVertex *)vertices vertexCount:(unsigned int)vertexCount inidices:(GLubyte *)indices indexCount:(unsigned int)indexCount;
-(void)render;
@end
