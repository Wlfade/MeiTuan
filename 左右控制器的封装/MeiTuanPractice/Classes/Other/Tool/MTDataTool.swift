//
//  MTDataTool.swift
//  MeiTuanPractice
//
//  Created by 王玲峰 on 4/21/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class MTDataTool: NSObject {
    class func getCategoryData(result:([MTCategoriesModel]) ->()){
        //1.获取categories.plist
        guard let path = Bundle.main.path(forResource: "categories.plist", ofType: nil) else{
            result([MTCategoriesModel]())
            return
        }
        
        //1.获取里面的内容
        guard let dicArray = NSArray(contentsOfFile: path) else {
            result([MTCategoriesModel]())
            return
        }
        var models = [MTCategoriesModel]()
        for dic in dicArray {
            let dicResult = dic as! [String : AnyObject]
            let model = MTCategoriesModel(dic: dicResult)
            models.append(model)
            
            //解析子菜单
        }
        result(models)
    }
}
 
