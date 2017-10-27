//
//  ScanVC.m
//  3DtouchDemo
//
//  Created by 郭海祥 on 2017/10/18.
//  Copyright © 2017年 ghx. All rights reserved.
//

#import "ScanVC.h"

@interface ScanVC ()

@end

@implementation ScanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//自定义 peek 快捷选项
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"选项一" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"选项二" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"选项三" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    UIPreviewActionGroup *actionGroup = [UIPreviewActionGroup actionGroupWithTitle:@"选项组" style:UIPreviewActionStyleDefault actions:@[action1, action2]];
    
    return @[action1, action2, action3, actionGroup];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
