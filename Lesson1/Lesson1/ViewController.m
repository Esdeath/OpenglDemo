//
//  ViewController.m
//  Lesson1
//
//  Created by Asuna on 16/4/16.
//  Copyright © 2016年 Asuna. All rights reserved.
//

#import "ViewController.h"
#define kSetBackgoundColor glClearColor(0.0, 104.0/255.0, 55.0/255.0, 1.0)
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GLKView *glkView = (GLKView*)self.view;
    EAGLContext *context = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
    glkView.context = context;
}


- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClear(GL_COLOR_BUFFER_BIT);
    kSetBackgoundColor;
}

@end
