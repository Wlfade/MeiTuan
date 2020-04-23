//
//  MTDataBridgeTool.swift
//  MeiTuanPractice
//
//  Created by 王玲峰 on 4/22/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class MTDataBridgeTool: NSObject {
    class func chageCategoryModel(categoryMs:[MTCategoriesModel])->([MTLeftRightModel]){
        
        var resultMs = [MTLeftRightModel]()
        
        for cateM in categoryMs{
            let lrM = MTLeftRightModel()
            resultMs.append(lrM)
            
            if cateM.icon != nil {
                lrM.image = UIImage(named: cateM.icon!)
            }
            lrM.title = cateM.name
            
            //子菜单
            guard let subCategory = cateM.subcategories else { continue }
            var subMs = [MTLeftRightModel]()

            for str in subCategory {
                let sublrm = MTLeftRightModel()
                sublrm.title = str
                subMs.append(sublrm)
            }
            lrM.subMenue = subMs
            
            
        }
        
        return resultMs
        
    }
    
    class func chageAddressModel(addressModels:[MTAddressModel])->([MTLeftRightModel]){
        var resultMs = [MTLeftRightModel]()
        
        for addressM in addressModels{
            let lrM = MTLeftRightModel()
            resultMs.append(lrM)

            lrM.title = addressM.name
            
            //子菜单
            guard let subRegions = addressM.subregions else { continue }
            var subMs = [MTLeftRightModel]()

            for str in subRegions {
                let sublrm = MTLeftRightModel()
                sublrm.title = str
                subMs.append(sublrm)
            }
            lrM.subMenue = subMs

        }
        
        return resultMs
    }
    class func chageSortModel(sortModels:[MTSortModel])->([MTLeftRightModel]){
        var resultMs = [MTLeftRightModel]()
        
        for sortM in sortModels{
            let lrM = MTLeftRightModel()
            resultMs.append(lrM)

            lrM.title = sortM.label
            

        }
        
        return resultMs

    }
}
