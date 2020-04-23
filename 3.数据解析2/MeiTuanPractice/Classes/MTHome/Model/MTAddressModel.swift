//
//  MTAddressModel.swift
//  MeiTuanPractice
//
//  Created by 单车 on 2020/4/23.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class MTAddressModel: NSObject {
    
    @objc var name : String?
    @objc var subregions : [String]?
    
    override init() {
        
    }
    init(dic:[String : AnyObject]) {
        super.init()
        self.setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
