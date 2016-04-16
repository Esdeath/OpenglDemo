//
//  ViewController.m
//  Lesson2_draw5Star
//
//  Created by Asuna on 16/4/16.
//  Copyright © 2016年 Asuna. All rights reserved.
//

#import "ViewController.h"
#import "RWTBaseEffect.h"
#import "RWTVertex.h"

@interface ViewController ()
@property (strong, nonatomic) RWTBaseEffect *shader;
@end

@implementation ViewController {

    GLuint _bufferID;
    
    GLuint _indexbufferID;
    GLuint _indexCount;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GLKView *glkView = (GLKView*)self.view;
    
    EAGLContext *context = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
    glkView.context = context;
    [EAGLContext setCurrentContext:context];
    
    
    
    [self setupShader];
    [self setupBuffer];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClearColor(0.0, 104.0/255.0, 55.0/255.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    
    [self.shader prepareToDraw];
    
    glEnableVertexAttribArray(RWTVertexAttribPosition);
    glVertexAttribPointer(RWTVertexAttribPosition, 3, GL_FLOAT, GL_TRUE, sizeof(RWTVertex),  (const GLvoid *)offsetof(RWTVertex, Position));
    
    glEnableVertexAttribArray(RWTVertexAttribColor);
    glVertexAttribPointer(RWTVertexAttribColor, 4, GL_FLOAT, GL_TRUE, sizeof(RWTVertex),  (const GLvoid *)offsetof(RWTVertex, Color));
    
    glBindBuffer(GL_ARRAY_BUFFER, _bufferID);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexbufferID);
    glDrawElements(GL_TRIANGLES, _indexCount, GL_UNSIGNED_BYTE, 0);
    
    glDisableVertexAttribArray(RWTVertexAttribPosition);
    glDisableVertexAttribArray(RWTVertexAttribColor);

}

-(void)setupShader{
    self.shader = [[RWTBaseEffect alloc]initWithVertexShader:@"RWTSimpleVertex.glsl" fragmentShader:@"RWTSimpleFragment.glsl"];
}

-(void)setupBuffer
{
    const static RWTVertex  vertex[] = {
        {{-0.5,-0.5,0.0} ,  {1, 0, 0, 1} }, //v0
        {{0.5,-0.5,0.0} ,   {0, 1, 0, 1} }, //v1
        {{0.5,0.5,0.0}  ,  {0, 0, 1, 1} }, //v2
        {{-0.5,0.5,0.0} , {0, 0, 0, 0} } //v3
    };
    
    
    const static GLubyte index[] = {
        0,1,2,
        2,3,0,
    };
    
    _indexCount = sizeof(index)/sizeof(index[0]);
    
    glGenBuffers(1, &_bufferID);
    glBindBuffer(GL_ARRAY_BUFFER, _bufferID);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertex), vertex, GL_STATIC_DRAW);
    
    glGenBuffers(1, &_indexbufferID);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexbufferID);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(index), index, GL_STATIC_DRAW);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
