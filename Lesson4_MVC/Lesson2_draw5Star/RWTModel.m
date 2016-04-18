//
//  RWTModel.m
//  Lesson2_draw5Star
//
//  Created by Asuna on 16/4/17.
//  Copyright © 2016年 Asuna. All rights reserved.
//

#import "RWTModel.h"
#import "RWTBaseEffect.h"
#import "RWTVertex.h"
#import <OpenGLES/ES2/glext.h>
#import <GLKit/GLKit.h>
@implementation RWTModel {
    const char *_name;
    GLuint _vao;
    GLuint _vertexBuffer;
    GLuint _indexBuffer;
    unsigned int _vertexCount;
    unsigned int _indexCount;
    RWTBaseEffect *_shader;

}

- (instancetype)initWithName:(const char *)name shader:(RWTBaseEffect *)shader vertices:(RWTVertex *)vertices vertexCount:(unsigned int)vertexCount inidices:(GLubyte *)indices indexCount:(unsigned int)indexCount
{
    self = [super init];
    if (self) {
        _name = name;
        _shader = shader;
        _vertexCount = vertexCount;
        _indexCount  = indexCount;
        
        glGenVertexArraysOES(1, &_vao);
        glBindVertexArrayOES(_vao);
        
        glGenBuffers(1, &_vertexBuffer);
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBufferData(GL_ARRAY_BUFFER, sizeof(RWTVertex)*vertexCount, vertices, GL_STATIC_DRAW);
        
        glGenBuffers(1, &_indexBuffer);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
        glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(GLubyte)*indexCount, indices, GL_STATIC_DRAW);
        
        glEnableVertexAttribArray(RWTVertexAttribPosition);
        glVertexAttribPointer(RWTVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(RWTVertex), (const GLvoid*)offsetof(RWTVertex, Position));
        
        glEnableVertexAttribArray(RWTVertexAttribColor);
        glVertexAttribPointer(RWTVertexAttribColor, 4, GL_FLOAT, GL_FALSE, sizeof(RWTVertex), (const GLvoid*)offsetof(RWTVertex, Color));
        
        glBindVertexArrayOES(0);
        glBindBuffer(GL_ARRAY_BUFFER, 0);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
    }
    return self;
}

-(void)render {
    [_shader prepareToDraw];
    
    glBindVertexArrayOES(_vao);
    glDrawElements(GL_TRIANGLES, _indexCount, GL_UNSIGNED_BYTE, 0);
    glBindVertexArrayOES(0);    
}
@end
