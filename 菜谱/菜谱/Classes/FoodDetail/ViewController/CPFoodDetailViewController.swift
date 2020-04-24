//
//  CPFoodDetailViewController.swift
//  菜谱
//
//  Created by 单车 on 2020/4/24.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit

class CPFoodDetailViewController: UITableViewController {

    
    var foodMs: [CPFoodDetailModel] = [CPFoodDetailModel]() {
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(CPFoodDetailViewController.typeChange(notification:)), name: NSNotification.Name(rawValue: kTypeChang), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func typeChange(notification:NSNotification) -> () {
        print(notification)
        
        let obj = notification.object as? CPTypeModel
        
        let data = CPDataTool.getFoodListData(idStr: (obj?.idstr!)!)
        foodMs = data
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodMs.count

    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "type"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellId)
        }

        let food = foodMs[indexPath.row]
        cell!.textLabel?.text = food.name

        return cell!

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = foodMs[indexPath.row]
        print(food.name)
        
        let url = Bundle.main.url(forResource: food.idstr! + ".html", withExtension: nil, subdirectory: "Html/food/")
        
        
        
        let webVC = CPWebViewController()
        webVC.url = url as NSURL?
        let nav = UINavigationController(rootViewController: webVC)

        nav.modalPresentationStyle = .formSheet

        present(nav, animated: true, completion: nil)
        
        
        print(url)
    }


}
