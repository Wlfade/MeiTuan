//
//  ViewController.m
//  Pop3-OC
//
//  Created by 王玲峰 on 4/12/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

#import "ViewController.h"
#import "POPViewController.h"

@interface ViewController ()
<UIPopoverPresentationControllerDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)action:(UISwitch *)sender {
    POPViewController *popVC = [[POPViewController alloc]init];
    popVC.modalPresentationStyle = UIModalPresentationPopover;
//    UIModalPresentationPageSheet
//    UIModalPresentationStyle
    popVC.preferredContentSize = CGSizeMake(200, 200);
    popVC.popoverPresentationController.delegate = self;
    popVC.popoverPresentationController.sourceView = sender;
    popVC.popoverPresentationController.sourceRect = sender.bounds;
    popVC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    [self presentViewController:popVC animated:YES completion:nil];
    
}

#pragma mark - popoverdelegate
// 设置点击蒙版是否消失
- (BOOL) popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    return YES;
}

// 默认返回的是覆盖整个屏幕
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    //这个 关键
    return UIModalPresentationNone;
}

// 弹出视图消失后调用的方法
- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    NSLog(@"dismissed");
}


@end
