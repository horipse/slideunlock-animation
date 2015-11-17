//
//  ViewController.m
//  slideunlock-animation
//
//  Created by Zhipeng Li on 15/11/17.
//  Copyright © 2015年 Zhipeng Li. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CAGradientLayer *gradientLayer;
    CABasicAnimation *gradient;
    NSString *text;
}

- (void) initGradientLayer
{
    gradientLayer = [CAGradientLayer layer];
    
    gradientLayer.bounds = CGRectMake(0, 0, _slideView.frame.size.width,        //setBounds
                                      _slideLabel.frame.size.height);
    gradientLayer.position = CGPointMake(_slideLabel.frame.size.width/2,        //setPosition
                                         _slideLabel.frame.size.height/2);
    
    
    gradientLayer.startPoint = CGPointMake(0, 0.5);                             //Color Gradient from CGPoint(x,y)
    gradientLayer.endPoint = CGPointMake(1, 0.5);                               //Color Gradient to CGPoint(x,y)
    
    
    gradientLayer.colors = @[                                                   //NSArray color
                             (id)[UIColor blackColor].CGColor,
                             (id)[UIColor whiteColor].CGColor,
                             (id)[UIColor blackColor].CGColor
                             ];
    gradientLayer.locations = @[@0.2,@0.5,@0.8];                                //setColor Gradient startPoint * 3
    [_slideView.layer addSublayer:gradientLayer];

}

- (void) gradientAnimate
{
    gradient = [CABasicAnimation animationWithKeyPath:@"locations"];
    gradient.fromValue = @[@0,@0,@0.25];
    gradient.toValue = @[@0.75,@1,@1];
    gradient.duration = 2.5;
    gradient.repeatCount = HUGE;
    [gradientLayer addAnimation:gradient forKey:nil];
}

- (void) viewDidLoad {
    [super viewDidLoad];
    text = @"Slide to Unlock";
    [self initGradientLayer];
    
    
}

- (void) viewDidAppear:(BOOL)animated
{
    _slideLabel.text = text;
    gradientLayer.mask = _slideLabel.layer;
    [self gradientAnimate];
}


- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
