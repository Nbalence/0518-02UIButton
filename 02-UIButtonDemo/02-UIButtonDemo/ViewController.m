//
//  ViewController.m
//  02-UIButtonDemo
//
//  Created by qingyun on 16/3/21.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *headerBtn;

@end

@implementation ViewController
static CGFloat delta = 20;

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加事件监听（）
    [_headerBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
       // Do any additional setup after loading the view, typically from a nib.
}

-(void)btnClick:(UIButton *)sender{
    NSLog(@"%s",__func__);
}

- (IBAction)move:(UIButton *)sender {
    
    CGPoint tempCenter = _headerBtn.center;
    switch (sender.tag) {
        case 100://向上
            tempCenter.y -= delta;
            break;
        case 101://向左
            tempCenter.x -= delta;
            break;
        case 102://向下
            tempCenter.y += delta;
            break;
        case 103://向右
            tempCenter.x += delta;
            break;
            
        default:
            break;
    }
    //头尾式动画
    [UIView beginAnimations:nil context:nil];
    //设置动画的时间
    [UIView setAnimationDuration:.5];
    //执行动画的代码
    _headerBtn.center = tempCenter;
    [UIView commitAnimations];
}

- (IBAction)scale:(UIButton *)sender {
#if 0
    CGRect tempRect = _headerBtn.frame;
    if (sender.tag == 104) {//放大
        tempRect.origin.x -= delta / 2.0;
        tempRect.origin.y -= delta / 2.0;
        tempRect.size.width += delta;
        tempRect.size.height += delta;
    }else if (sender.tag == 105){//缩小
        tempRect.origin.x += delta / 2.0;
        tempRect.origin.y += delta / 2.0;
        tempRect.size.width -= delta;
        tempRect.size.height -= delta;
    }
    [UIView animateWithDuration:0.5 animations:^{
        _headerBtn.frame = tempRect;
    }];
#else
    [UIView animateWithDuration:0.5 animations:^{
        if (sender.tag == 104) {//放大
            _headerBtn.transform = CGAffineTransformScale(_headerBtn.transform, 1.2, 1.2);
        }else if (sender.tag == 105){//缩小
            _headerBtn.transform = CGAffineTransformScale(_headerBtn.transform, 0.8, 0.8);
        }
    }];
    

#endif
}

- (IBAction)rotate:(UIButton *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        if (sender.tag == 106) {//逆时针旋转
            _headerBtn.transform = CGAffineTransformRotate(_headerBtn.transform, -(M_PI / 6));
        }else if (sender.tag == 107){//顺时针旋转
            _headerBtn.transform = CGAffineTransformRotate(_headerBtn.transform, (M_PI / 6));
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
