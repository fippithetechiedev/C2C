//
//  fbViewController.swift
//  c2cFINAL
//
//  Created by Ujjwal Khosla on 24/02/18.
//  Copyright © 2018 mufaddal. All rights reserved.
//

import UIKit
import WebKit

class SlackViewController: UIViewController {
    
    @IBOutlet weak var slackwebview: WKWebView!
    
    @IBOutlet weak var fbwebview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Slack"
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        let url = URL(string: "https://code2creategroup.slack.com")
        let request = URLRequest(url: url!)
        slackwebview.load(request)
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

