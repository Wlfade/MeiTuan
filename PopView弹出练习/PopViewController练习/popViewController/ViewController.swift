//
//  ViewController.swift
//  popViewController
//
//  Created by 王玲峰 on 4/8/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentpoper : UIPopoverController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.menuChange(notification:)), name: NSNotification.Name(rawValue: kMenuChangeNotification), object: nil)
    }
    
    @objc func menuChange(notification:NSNotification) -> () {
        print(notification)
        let str = notification.object as? String
        title = str
        
        currentpoper?.dismiss(animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @IBAction func leftAction(_ sender: UIBarButtonItem) {
        
        //1.创建uipopViewController
        let contentVC = ContentTVC()
        
        let popVer = UIPopoverController(contentViewController: contentVC)
        popVer.backgroundColor = UIColor.white
        currentpoper = popVer
        popVer.contentSize = CGSize(width: 150,height: 300)
        popVer.present(from: sender, permittedArrowDirections: .any, animated: true)
        
    }
    
    @IBAction func rightAction(_ sender: UIBarButtonItem) {
        let first = FirstVC()
        let nav = UINavigationController(rootViewController: first)
            
        let popVer = UIPopoverController(contentViewController: nav)
        popVer.backgroundColor = UIColor.white
        currentpoper = popVer
        
        popVer.present(from: sender, permittedArrowDirections: .any, animated: true)


    }
    
    @IBAction func openOrClose(_ sender: UISwitch) {
        
        if sender.isOn {
            //1.创建POP
            let contentVC = UIViewController()
            let imageView = UIImageView(image: UIImage(named: "test.jpeg"))
            imageView.isUserInteractionEnabled = true
            contentVC.view.addSubview(imageView)
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.pixColor(getster:)))
            imageView.addGestureRecognizer(tap)
            
            let popVer = UIPopoverController(contentViewController: contentVC)
            popVer.contentSize = imageView.frame.size
            popVer.backgroundColor = UIColor.white
            currentpoper = popVer
            popVer.passthroughViews = [sender,view]

            //1.位置 2.相对于谁的位置  3.箭头方向
            popVer.present(from: sender.bounds, in: sender, permittedArrowDirections: .any, animated: true)
        }else{
            currentpoper?.dismiss(animated: true)
        }
    }
    
    @objc func pixColor(getster:UITapGestureRecognizer) -> () {
        let iamgeView = getster.view as? UIImageView
        
        
        let point = getster.location(in: getster.view)
        
        guard let image = iamgeView?.image else {
            return
        }
        
        let color = image.color(atPixel: point)
        
        view.backgroundColor = color
    }
}

