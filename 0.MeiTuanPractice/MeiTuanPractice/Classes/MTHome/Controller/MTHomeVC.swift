//
//  MTHomeVC.swift
//  MeiTuanPractice
//
//  Created by 王玲峰 on 4/19/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class MTHomeVC: UIViewController {

    var currentpoper : UIPopoverController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //0.背景图片
        navigationController?.navigationBar .setBackgroundImage(UIImage(named: "bg_navigationBar_normal"), for: UIBarMetrics.default)
        
        
        //1.设置导航栏左侧的logo
        let logoView = UIImageView(image:UIImage(named: "icon_meituan_logo"))
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoView)
        let logoItem = UIBarButtonItem(customView: logoView)
        
        let menu1 = createItem(imageName: "icon_category_-1", title: "美团网", des: "全部分类")
        
        menu1.menu.addTarget(target: self, action: #selector(category))
        
        let menu2 = createItem(imageName: "icon_district_highlighted", title: "广东省", des: "广州市")
        menu2.menu.addTarget(target: self, action: #selector(address))

        
        let menu3 = createItem(imageName: "icon_sort_highlighted", title: "排序", des: "最新发布")
        menu3.menu.addTarget(target: self, action: #selector(sort))


        navigationItem.leftBarButtonItems = [logoItem,menu1.item,menu2.item,menu3.item]
        
    }
    func createItem(imageName:String,title:String,des:String) -> (item:UIBarButtonItem,menu:MTMenuView ){
        let menu = MTMenuView.menuView(icon: UIImage(named: imageName), title:title, des:des)
        
        let menuItem = UIBarButtonItem(customView: menu)

        return (menuItem,menu)
    }
}

extension MTHomeVC {
    @objc func category(){
        print("分类")
        currentpoper?.dismiss(animated: true)

        //1.创建pop
        let content = ContentVC()
        let popver = UIPopoverController(contentViewController: content)
        currentpoper = popver

        //2.弹出
        let barItem = navigationItem.leftBarButtonItems![1]
        
        popver.present(from: barItem, permittedArrowDirections: .any, animated: true)
        
        
    }
    @objc func address(){
        print("地址")
        currentpoper?.dismiss(animated: true)

        //1.创建pop
         let content = ContentVC()
         let popver = UIPopoverController(contentViewController: content)
        currentpoper = popver
         //2.弹出
         let barItem = navigationItem.leftBarButtonItems![2]
         
         popver.present(from: barItem, permittedArrowDirections: .any, animated: true)
         
         
    }
    @objc func sort(){
        print("排序")
        currentpoper?.dismiss(animated: true)

        //1.创建pop
         let content = ContentVC()
         let popver = UIPopoverController(contentViewController: content)
        currentpoper = popver

         //2.弹出
         let barItem = navigationItem.leftBarButtonItems![3]
         
         popver.present(from: barItem, permittedArrowDirections: .any, animated: true)
         
         
    }
}
