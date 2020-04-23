//
//  ContentTVC.swift
//  popViewController
//
//  Created by 王玲峰 on 4/8/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

let kMenuChangeNotification = "menu"

class ContentTVC: UITableViewController {

    lazy var dataSource:[String] = {
        var array = [String]()
        for i in 0..<100 {
            array.append("菜单\(i)")
        }
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //在控制器内容，也可以去修改popoverController的大小
        preferredContentSize = CGSize(width: 150, height: 500)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "Menu"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        cell?.textLabel?.text = dataSource[indexPath.row]
        
        return cell!
        
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kMenuChangeNotification), object: dataSource[indexPath.row])
    }

}
