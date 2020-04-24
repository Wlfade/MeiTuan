//
//  CPDataTool.swift
//  菜谱
//
//  Created by 单车 on 2020/4/24.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit

class CPDataTool: NSObject {
    
    class func getFoodListData(idStr:String)->[CPFoodDetailModel] {
        //1.获取文件路径
        guard let path = Bundle.main.path(forResource: "type_" + idStr + "_foods.plist", ofType: nil) else {
            return([CPFoodDetailModel]())
        }
        
        //2.加载文件内容
        guard let dicArray = NSArray(contentsOfFile: path) else {
            return([CPFoodDetailModel]())
        }
        
        
        //3.转换成模型
        var modelArr = [CPFoodDetailModel]()
        
        for dic in dicArray {
            let resultDic = dic as![String : AnyObject]
            let model = CPFoodDetailModel(dic: resultDic)
            modelArr.append(model)
        }
        
        
        //4.返回数据
        return modelArr
    }
    
    class func getTypeData()->[CPTypeModel]{
        //1.获取文件路径
        guard let path = Bundle.main.path(forResource: "food_types.plist", ofType: nil) else {
            return([CPTypeModel]())
        }
        
        //2.加载文件内容
        guard let dicArray = NSArray(contentsOfFile: path) else {
            return([CPTypeModel]())
        }
        
        
        //3.转换成模型
        var modelArr = [CPTypeModel]()
        
        for dic in dicArray {
            let resultDic = dic as![String : AnyObject]
            let model = CPTypeModel(dic: resultDic)
            modelArr.append(model)
        }
        
        
        //4.返回数据
        return modelArr
    }
}
