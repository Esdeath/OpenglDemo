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

#define kSetBackgoundColor glClearColor(0.0, 104.0/255.0, 55.0/255.0, 1.0)

@interface ViewController ()
@property (strong, nonatomic) RWTBaseEffect *baseEffect;
@end

@implementation ViewController {

    GLuint _bufferID;
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
    glClear(GL_COLOR_BUFFER_BIT);
    kSetBackgoundColor;
    
    
    [self.baseEffect prepareToDraw];
    
    glEnableVertexAttribArray(RWTVertexAttribPosition);
    glVertexAttribPointer(RWTVertexAttribPosition, 3, GL_FLOAT, GL_TRUE, sizeof(RWTVertex),  (const GLvoid *)offsetof(RWTVertex, Position));
    
    glBindBuffer(GL_ARRAY_BUFFER, _bufferID);
    glDrawArrays(GL_TRIANGLES, 0, 30);
    
    glDisableVertexAttribArray(RWTVertexAttribPosition);
}

-(void)setupShader{
    self.baseEffect = [[RWTBaseEffect alloc]initWithVertexShader:@"RWTSimpleVertex.glsl" fragmentShader:@"RWTSimpleFragment.glsl"];
}

-(void)setupBuffer
{
    const static RWTVertex  vertex[] = {
        {{+0.37, -0.12, 0}}, // A
        {{+0.95, +0.30, 0}}, // B
        {{+0.23, +0.30, 0}}, // C
        
        {{+0.23, +0.30, 0}}, // C
        {{+0.00, +0.90, 0}}, // D
        {{-0.23, +0.30, 0}}, // E
        
        {{-0.23, +0.30, 0}}, // E
        {{-0.95, +0.30, 0}}, // F
        {{-0.37, -0.12, 0}}, // G
        
        {{-0.37, -0.12, 0}}, // G
        {{-0.57, -0.81, 0}}, // H
        {{+0.00, -0.40, 0}}, // I
        
        {{+0.00, -0.40, 0}}, // I
        {{+0.57, -0.81, 0}}, // J
        {{+0.37, -0.12, 0}}, // A
        
        {{+0.37, -0.12, 0}}, // A
        {{+0.00, +0.00, 0}}, // 0
        {{+0.23, +0.30, 0}}, // C
        
        {{+0.23, +0.30, 0}}, // C
        {{+0.00, +0.00, 0}}, // 0
        {{-0.23, +0.30, 0}}, // E
        
        {{-0.23, +0.30, 0}}, // E
        {{+0.00, +0.00, 0}}, // 0
        {{-0.37, -0.12, 0}}, // G
        
        {{-0.37, -0.12, 0}}, // G
        {{+0.00, +0.00, 0}}, // 0
        {{+0.00, -0.40, 0}}, // I
        
        {{+0.00, -0.40, 0}}, // I
        {{+0.00, +0.00, 0}}, // 0
        {{+0.37, -0.12, 0}}, // A

    };
    
    glGenBuffers(1, &_bufferID);
    glBindBuffer(GL_ARRAY_BUFFER, _bufferID);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertex), vertex, GL_STATIC_DRAW);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
