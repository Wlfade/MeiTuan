//
//  popVCViewController.h
//  popViewDemo
//
//  Created by Raymon on 2019/6/27.
//  Copyright © 2019 Raymon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface popVCViewController : UIViewController

@property (copy, nonatomic) void(^didSelectedCellBlock)(NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END
