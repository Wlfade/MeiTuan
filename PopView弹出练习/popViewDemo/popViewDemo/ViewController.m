//
//  ViewController.m
//  popViewDemo
//
//  Created by Raymon on 2019/6/27.
//  Copyright © 2019 Raymon. All rights reserved.
//

#import "ViewController.h"
#import "popVCViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate>

@property(nonatomic, strong) UITableView *tableview;

@property(nonatomic, strong) popVCViewController *popVC;

@property(nonatomic, strong) UITableViewCell *tableviewCell;

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.tableview];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.row == 0) {
        _tableviewCell = cell;
    }
    cell.textLabel.text = @"点我啊,快点我";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"1111");
    _popVC = [[popVCViewController alloc] init];
    _popVC.modalPresentationStyle = UIModalPresentationPopover;
    _popVC.preferredContentSize = CGSizeMake(300, 300);
    _popVC.popoverPresentationController.delegate = self;
    _popVC.popoverPresentationController.sourceView = _tableviewCell;//self.tableview;
    _popVC.popoverPresentationController.sourceRect = _tableviewCell.bounds;//self.tableview.bounds;
    _popVC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    _popVC.didSelectedCellBlock = ^(NSIndexPath * _Nonnull indexPath) {
        NSLog(@"%@",indexPath);
    };
    [self presentViewController:_popVC animated:YES completion:nil];
}

#pragma mark - popoverdelegate
// 设置点击蒙版是否消失
- (BOOL) popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    return YES;
}

// 默认返回的是覆盖整个屏幕
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}

// 弹出视图消失后调用的方法
- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    NSLog(@"dismissed");
}

- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(100, 100, [UIScreen mainScreen].bounds.size.width - 200, [UIScreen mainScreen].bounds.size.height - 300) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.rowHeight = 70;
    }
    return _tableview;
}



@end
