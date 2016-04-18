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
#import <OpenGLES/ES2/glext.h>
#import "RWTSquare.h"
@interface ViewController ()
@property (strong, nonatomic) RWTBaseEffect *shader;
@end

@implementation ViewController {

    RWTSquare *_square;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GLKView *glkView = (GLKView*)self.view;
    
    EAGLContext *context = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
    glkView.context = context;
    [EAGLContext setCurrentContext:context];
    
    [self setupShader];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClearColor(0, 104.0/255.0, 55.0/255.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);

    [_square render];
}

-(void)setupShader{
    self.shader = [[RWTBaseEffect alloc]initWithVertexShader:@"RWTSimpleVertex.glsl" fragmentShader:@"RWTSimpleFragment.glsl"];
    _square = [[RWTSquare alloc]initWithShader:self.shader];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
