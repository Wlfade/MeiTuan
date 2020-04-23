//
//  MTLeftRightModel.swift
//  MeiTuanPractice
//
//  Created by 王玲峰 on 4/20/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

enum LRType : Int {
    case ImageAndTitle
    case Title
}
@objcMembers

class MTLeftRightModel: NSObject {
    
    var type : LRType?
    
    var image : UIImage?
    var title : String?
    
    var hasSubModel : Bool{
        if subMenue == nil || subMenue!.count == 0 {
            return false
        }
        return true
    }
    
    //子菜单
    var subMenue:[MTLeftRightModel]?
    
}
