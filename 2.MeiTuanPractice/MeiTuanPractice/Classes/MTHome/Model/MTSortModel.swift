//
//  MTSortModel.swift
//  MeiTuanPractice
//
//  Created by 王玲峰 on 4/23/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class MTSortModel: NSObject {
    @objc var label : String?
    @objc var value : Int = -1
    
    override init() {
        
    }
    init(dic:[String : AnyObject]) {
        super.init()
        self.setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }


}
