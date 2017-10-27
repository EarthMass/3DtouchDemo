//
//  ViewController.m
//  3DtouchDemo
//
//  Created by 郭海祥 on 2017/10/18.
//  Copyright © 2017年 ghx. All rights reserved.
//

#import "ViewController.h"
#import "ScanVC.h"

@interface ViewController ()<UIViewControllerPreviewingDelegate,UIPreviewActionItem> {
    UILabel * lab;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initUI];
    
    [self registerForPreviewingWithDelegate:self sourceView:lab];
    
}

- (void)initUI {
    self.view.backgroundColor = [UIColor brownColor];
    lab = [[UILabel alloc] initWithFrame:CGRectMake(50, 80, 200, 100)];
    lab.text = @"测试lab";
    lab.userInteractionEnabled = YES;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:lab];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- UIViewContollerPreviewing delegate
//peek(预览)
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    // previewingContext.sourceView: 触发Peek & Pop操作的视图
    // previewingContext.sourceRect: 设置触发操作的视图的不被虚化的区域
    
    ScanVC *detailVC = [[ScanVC alloc] init];
    
    // 预览区域大小(可不设置)
    detailVC.preferredContentSize = CGSizeMake(0, 300);
    
    return detailVC;
    
}
//pop（按用点力进入）
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    NSLog(@"pop");
    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
}

//自定义 peek 快捷选项 [不能在这边 实现，要在 预览的类中实现]
//- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {


@end
