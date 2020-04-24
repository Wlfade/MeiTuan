//
//  CPWebViewController.swift
//  菜谱
//
//  Created by 王玲峰 on 4/24/20.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit
import WebKit
class CPWebViewController: UIViewController {

    
    var url : NSURL?
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if url != nil {
            let request = URLRequest(url: url! as URL)
            webView.load(request)
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .done, target: self, action: #selector(CPWebViewController.closeAction))
    }
    
    @objc func closeAction()->(){
        dismiss(animated: true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
