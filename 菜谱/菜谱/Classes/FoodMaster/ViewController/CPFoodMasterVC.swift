//
//  CPFoodMasterVC.swift
//  菜谱
//
//  Created by 单车 on 2020/4/24.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit

let kTypeChang = "TYPECHANGE"


class CPFoodMasterVC: UITableViewController {

    var typeMs: [CPTypeModel] = [CPTypeModel]() {
        didSet{
            tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        typeMs = CPDataTool.getTypeData()
        self.view.backgroundColor = .red
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeMs.count

    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "type"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellId)
        }

        let typeModel = typeMs[indexPath.row]
        cell!.textLabel?.text = typeModel.name

        return cell!

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = typeMs[indexPath.row]
        
        //通过通知传值
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kTypeChang), object: type)
        
    }

}
