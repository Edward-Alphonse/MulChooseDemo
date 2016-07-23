//
//  ViewController.m
//  MulChooseDemo
//
//  Created by QITMAC000242 on 7/23/16.
//  Copyright © 2016 QITMAC000242. All rights reserved.
//

#import "ViewController.h"
#import "SingleChooseTableVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat btnX = 125;
    CGFloat btnY = 100;
    CGFloat padding = 10;
    CGFloat btnWidth = 125;
    CGFloat btnHeight = 50;
    
    CGRect frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
    UIButton *singleChooseTVBtn = [self createBtnWithTitle:@"TableView单选" withFrame:frame];
    singleChooseTVBtn.tag = 101;
    [self.view addSubview:singleChooseTVBtn];
//    btnY += btnHeight + padding;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  创建菜单按钮
 *
 *  @param title 按钮名
 *  @param frame 按钮尺寸
 *
 *  @return 按钮
 */
-(UIButton *)createBtnWithTitle:(NSString *)title withFrame:(CGRect)frame{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTintColor:[UIColor blueColor]];
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

/**
 *  菜单按钮点击事件
 *
 *  @param sender 被点击的按钮
 */
-(void)clickBtn:(id)sender {
    NSInteger tag = [sender tag];
    switch (tag) {
        case 101:{
            SingleChooseTableVC *vc1 = [[SingleChooseTableVC alloc]init];
            [self.navigationController pushViewController:vc1 animated:YES];
            break;
        }
        default:
            break;
    }
}

@end
