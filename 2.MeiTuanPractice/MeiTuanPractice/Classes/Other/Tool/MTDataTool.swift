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
    
    //获取 地址数据模型
    class func getAddRessData(result:([MTAddressModel]) ->()){
        //1.获取categories.plist
        guard let path = Bundle.main.path(forResource: "gz.plist", ofType: nil) else{
            result([MTAddressModel]())
            return
        }
        
        //1.获取里面的内容
        guard let dicArray = NSArray(contentsOfFile: path) else {
            result([MTAddressModel]())
            return
        }
        var models = [MTAddressModel]()
        for dic in dicArray {
            let dicResult = dic as! [String : AnyObject]
            let model = MTAddressModel(dic: dicResult)
            models.append(model)
            
            //解析子菜单
        }
        result(models)
    }
    
    //获取 排序数据模型
    class func getSortData(result:([MTSortModel]) ->()){
        //1.获取categories.plist
        guard let path = Bundle.main.path(forResource: "sorts.plist", ofType: nil) else{
            result([MTSortModel]())
            return
        }
        
        //1.获取里面的内容
        guard let dicArray = NSArray(contentsOfFile: path) else {
            result([MTSortModel]())
            return
        }
        var models = [MTSortModel]()
        for dic in dicArray {
            let dicResult = dic as! [String : AnyObject]
            let model = MTSortModel(dic: dicResult)
            models.append(model)
            
            //解析子菜单
        }
        result(models)
    }

}
 
