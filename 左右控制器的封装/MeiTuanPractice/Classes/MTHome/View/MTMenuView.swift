//
//  MTMenuView.swift
//  MeiTuanPractice
//
//  Created by 王玲峰 on 4/19/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class MTMenuView: UIView {

    @IBOutlet weak var clickBtn: UIButton!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var desLabel: UILabel!
    
    class func menuView(icon:UIImage?,title:String,des:String) -> MTMenuView{
        let view = (Bundle.main.loadNibNamed("MTMenuView", owner: nil, options: nil)?.first as? MTMenuView)!
        view.iconImageView.image = icon
        view.titleLabel.text = title
        view.desLabel.text = des
        return view
    }
    
    func addTarget(target:Any?,action:Selector){
        clickBtn.addTarget(target, action: action, for: .touchUpInside)
    }

}
