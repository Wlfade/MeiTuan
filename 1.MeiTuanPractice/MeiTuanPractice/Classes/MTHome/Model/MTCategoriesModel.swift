//
//  MTCategoriesModel.swift
//  MeiTuanPractice
//
//  Created by 王玲峰 on 4/21/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit
@objcMembers

class MTCategoriesModel: NSObject {
    var highlighted_icon: String?
    var icon: String?
    var name: String?
    var small_highlighted_icon: String?
    var small_icon: String?
    var map_icon: String?
    var subcategories: [String]?

    override init() {
        super.init()
    }
    
    init(dic:[String : AnyObject]){
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    override var description: String{
        return  dictionaryWithValues(forKeys: ["icon","name"]).description
    }

}
