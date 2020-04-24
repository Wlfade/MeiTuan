//
//  CPFoodDetailModel.swift
//  菜谱
//
//  Created by 王玲峰 on 4/24/20.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit

@objcMembers
class CPFoodDetailModel: NSObject {
    var diff : String?
    var idstr : String?
    var imageUrl : String?
    var name : String?
    var time : String?
    var url : String?

    override init() {
        super.init()
    }
    
    init(dic:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
