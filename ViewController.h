//
//  ViewController.h
//  slideunlock-animation
//
//  Created by Zhipeng Li on 15/11/17.
//  Copyright © 2015年 Zhipeng Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *slideView;
@property (weak, nonatomic) IBOutlet UILabel *slideLabel;
- (CAGradientLayer *) gradientLayer;
- (CABasicAnimation *) gradient;
- (void) initGradientLayer;
- (void) gradientAnimate;
- (NSString *) text;
@end

