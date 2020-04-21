//
//  ContentVC.swift
//  MeiTuanPractice
//
//  Created by 王玲峰 on 4/19/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class ContentVC: UIViewController {

    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var rightTableView: UITableView!
    
    //数据源
    var leftRightModels : [MTLeftRightModel] = [MTLeftRightModel](){
        didSet{
//            self.leftTableView.reloadData()
        }
    }
    var currentLRM : MTLeftRightModel = MTLeftRightModel()
}

extension ContentVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.leftTableView {
            return leftRightModels.count;
        }
        if tableView == self.rightTableView {
            if currentLRM.hasSubModel {
                return currentLRM.subMenue!.count
            }else{
                return 0
            }
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //确定当前显示的数据模型
        let model = (tableView == leftTableView) ? leftRightModels[indexPath.row] : currentLRM.subMenue![indexPath.row]
        
        let cellId = (model.type == .ImageAndTitle) ? "imageAndTitle" : "Title"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellId)
        }
        //赋值
        cell?.imageView?.image = model.image
        
        cell?.textLabel?.text = model.title
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == leftTableView {
            //判断是否有子菜单
            let model = leftRightModels[indexPath.row]
            currentLRM = model
            if model.hasSubModel {
                //刷新右边表格
                rightTableView.reloadData()
                preferredContentSize = CGSize(width: 300, height: 500)
            }else{
                print(model.title as Any)
                preferredContentSize = CGSize(width: 150, height: 500)

            }
        }
        
        if tableView == rightTableView {
            let model = currentLRM.subMenue![indexPath.row]
            print(model.title as Any)

        }
    }
}
