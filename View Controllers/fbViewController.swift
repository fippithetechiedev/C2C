//
//  fbViewController.swift
//  c2cFINAL
//
//  Created by Ujjwal Khosla on 24/02/18.
//  Copyright © 2018 mufaddal. All rights reserved.
//

import UIKit
import WebKit

class fbViewController: UIViewController {

    @IBOutlet weak var fbwebview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ACM"
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        let url = URL(string: "https://www.facebook.com/ACM.VITU/")
        let request = URLRequest(url: url!)
        fbwebview.load(request)
        // Do any additional setup after loading the view.
    }

    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
