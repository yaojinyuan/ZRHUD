//
//  ZRHUD.m
//  ZRHUDExample
//
//  Created by etcxm on 16/7/22.
//  Copyright © 2016年 中软国际. All rights reserved.
//

#import "ZRHUD.h"

@implementation ZRHUD
/** 全局的窗口 */
static UIWindow *_window;
/** 定时器 */
static NSTimer *_timer;

static UIView *suggestionView;

static NSTimer *fadeOutTimer;

+(void)window
{
    // 显示窗口
    _window.hidden = YES;
    _window = [[UIWindow alloc] init];
    _window.backgroundColor = [UIColor clearColor];
    _window.windowLevel = UIWindowLevelAlert;
    _window.frame = CGRectMake(0, 0, 0, 0);
    _window.hidden = NO;
}
//定位成功提示
+(void)SuccessSuggestion:(NSString *)message
{
    //    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //    [self showWindow];
    
    
    [fadeOutTimer invalidate];
    fadeOutTimer = nil;
    
    [self window];
    
    
    suggestionView = [[UIView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-200)/2, [UIScreen mainScreen].bounds.size.height-104, 200, 40)];
    suggestionView.layer.cornerRadius = 10;//圆角
    suggestionView.layer.shadowColor = [[UIColor blackColor] CGColor];
    suggestionView.layer.shadowOffset = CGSizeMake(0.5, 0.5f);
    suggestionView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    suggestionView.autoresizingMask = (UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin |
                                       UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin);
    //笑脸图片
    //        UIImageView *sadImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"smile_7.png"]];
    //        sadImage.frame = CGRectMake(10, 20, 32, 32);
    //  [suggestionView addSubview:sadImage];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 3, 180, 35)];
    title.numberOfLines = 2;
    title.backgroundColor = [UIColor clearColor];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = message;
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"Verdana" size:13];
    [suggestionView addSubview:title];
    suggestionView.transform = CGAffineTransformScale(suggestionView.transform, 1.3, 1.3);
    
    [UIView animateWithDuration:0.15
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         suggestionView.transform = CGAffineTransformScale(suggestionView.transform, 1/1.3, 1/1.3);
                         suggestionView.alpha = 1;
                     }
                     completion:NULL];
    [_window addSubview:suggestionView];
    fadeOutTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
    
}

//隐藏定位成功提示
+ (void)dismiss {
    
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         suggestionView.transform = CGAffineTransformScale(suggestionView.transform, 0.8, 0.8);
                         suggestionView.alpha = 0;
                     }
                     completion:^(BOOL finished){
                         if(suggestionView.alpha == 0) {
                             [suggestionView removeFromSuperview];
                             suggestionView = nil;
                             // collectBtn.enabled = YES;
                         }
                     }];
}
@end
