//
//  ViewController.swift
//  popView2
//
//  Created by 王玲峰 on 4/12/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func open(_ sender: UISwitch) {
        //1.创建控制器
        let controller = UIViewController()
        controller.view.backgroundColor = UIColor.red
        
        //2.设置b模态的效果
        controller.modalPresentationStyle = .popover
        
        //2.1 方向
        controller.popoverPresentationController?.sourceView = sender
        controller.popoverPresentationController?.sourceRect = sender.bounds
        
        //2.2 设置穿透视图
        controller.popoverPresentationController?.passthroughViews = [sender]
        
        //2.3 设置背景
        controller.popoverPresentationController?.backgroundColor = UIColor.cyan
        
        controller.preferredContentSize = CGSize(width: 300, height: 300)
        
        controller.popoverPresentationController?.delegate = (self as UIPopoverPresentationControllerDelegate)
        
        //3.弹出
        present(controller, animated: true, completion: nil)
        
    }
    
}

extension ViewController:UIPopoverPresentationControllerDelegate{
    // 默认返回的是覆盖整个屏幕
//    - (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
//        return UIModalPresentationNone;
//    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    

}

