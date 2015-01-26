//
//  YCStatusHUD.m
//  YCStatusHUD
//
//  Created by PP on 15/1/26.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "YCStatusHUD.h"

//提示的高度
#define rowHigh 30

//提示渐渐出现所需的时长
#define waitTime 0.5

//提示出现持续的时长
#define keepTime 1.5

UIWindow *window = nil;

@implementation YCStatusHUD

//搞一个全局变量，用来引用UIWindow对象，使其不会被释放掉。


/**
 *  抽取一个公共的方法，共这三个方法调用
 *  抽取的原因：大部分的代码相似。
 */
+ (void)showWith:(NSString *)string image:(UIImage *)image{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置文字
    [btn setTitle:string forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    //设置图片
    [btn setImage:image forState:UIControlStateNormal];
    //搞一个UIWindow，把button放到UIWindow上面
    window = [[UIWindow alloc] init];
    //设置window的windowLevel为UIWindowLevelAlert。
    window.windowLevel = UIWindowLevelAlert;
    window.backgroundColor = [UIColor blackColor];
    window.frame = CGRectMake(0, -rowHigh, [UIScreen mainScreen].bounds.size.width, rowHigh);
    btn.frame = CGRectMake(0, 0, window.frame.size.width, window.frame.size.height);
    window.hidden = NO;
    [window addSubview:btn];
    
    //添加动画
    [UIView animateWithDuration:0.5 animations:^{
        window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, rowHigh+10);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, rowHigh-5);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, rowHigh+5);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 animations:^{
                    window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, rowHigh-2);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.1 animations:^{
                        window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, rowHigh+2);
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:0.1 animations:^{
                            window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, rowHigh);
                        } completion:^(BOOL finished) {
                            //消失的
                            [UIView animateKeyframesWithDuration:0.5 delay:1.5 options:kNilOptions animations:^{
                                window.frame = CGRectMake(0, -rowHigh, [UIScreen mainScreen].bounds.size.width, rowHigh);
                            } completion:^(BOOL finished) {
                                window.hidden = YES;
                            }];
                        }];
                    }];
                }];
            }];
        }];
    }];
    
    
    
   
//    //添加动画，使提示慢慢显示出来
//    [UIView animateWithDuration:waitTime animations:^{
//            window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, rowHigh);
//    } completion:^(BOOL finished) {
//        [UIView animateKeyframesWithDuration:waitTime delay:keepTime options:kNilOptions animations:^{
//            window.frame = CGRectMake(0, -rowHigh, [UIScreen mainScreen].bounds.size.width, rowHigh);
//        } completion:^(BOOL finished) {
//            NSLog(@"动画完成..");
//            //这里不用释放window对象，以备下次使用(不用重复生成对象)，但是为了节约性能，可以隐藏window
//            window.hidden = YES;
//        }];
//    }];
    
    
    
}

/**
 *  成功的提示
 *
 *  @param string 成功的提示字符串
 */
+ (void)showSuccessWith:(NSString *)string{
    [self showWith:string image:[UIImage imageNamed:@"YCStatusHUD.bundle/success"]];
}

/**
 *  失败的提示
 *
 *  @param string 失败的提示字符串
 */
+ (void)showFailWith:(NSString *)string{
    [self showWith:string image:[UIImage imageNamed:@"YCStatusHUD.bundle/error"]];
}

/**
 *  加载的提示
 *
 *  @param string 加载的提示字符串
 */
+ (void)showLoadingWith:(NSString *)string{
    //搞一个UIWindow，把button放到UIWindow上面
    window = [[UIWindow alloc] init];
    //设置window的windowLevel为UIWindowLevelAlert。
    window.windowLevel = UIWindowLevelAlert;
    window.backgroundColor = [UIColor blackColor];
    window.frame = CGRectMake(0, -rowHigh, [UIScreen mainScreen].bounds.size.width, rowHigh);
    window.hidden = NO;
    
    //在window上面添加一朵菊花
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicatorView.frame = CGRectMake(50, 0, rowHigh, rowHigh);
    [indicatorView startAnimating];
    //在window上面添加一个Label
    UILabel *label = [[UILabel alloc] init];
    label.text = string;
    label.textColor = [UIColor whiteColor];
    //设置label的位置和尺寸。
    label.frame = CGRectMake(0, 0, 300, rowHigh);
    label.textAlignment = NSTextAlignmentCenter;
    //添加到window上面。
    [window addSubview:indicatorView];
    [window addSubview:label];
    
    //添加动画
    [UIView animateWithDuration:0.5 animations:^{
        window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, rowHigh+10);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, rowHigh-5);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, rowHigh+5);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 animations:^{
                    window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, rowHigh-2);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.1 animations:^{
                        window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, rowHigh+2);
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:0.1 animations:^{
                            window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, rowHigh);
                        } completion:^(BOOL finished) {
                            NSLog(@"正在加载...");
                        }];
                    }];
                }];
            }];
        }];
    }];
    
//    //添加动画，使提示慢慢显示出来
//    [UIView animateWithDuration:waitTime animations:^{
//        window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, rowHigh);
//    } completion:^(BOOL finished) {
//        NSLog(@"正在加载...");
//    }];

}
/**
 *  取消加载（提供用来手工把加载的提示取消的方法）
 */
+ (void)cancelLoading{
    [UIView animateWithDuration:waitTime animations:^{
        window.frame = CGRectMake(0, -rowHigh, [UIScreen mainScreen].bounds.size.width, rowHigh);
    } completion:^(BOOL finished) {
        //把window释放，则它的子控件也跟着释放。
        window = nil;
    }];
}


@end
