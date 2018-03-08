//
//  FetchViewController.swift
//  c2cFINAL
//
//  Created by Mufaddal Ibrahimjee on 24/02/18.
//  Copyright © 2018 mufaddal. All rights reserved.
//

import UIKit
import Firebase
class FetchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("isLogged",isLoggedIn)
        CoreDataHandler.shared.fetchData { (fetched) in
            
            print("isLogged",isLoggedIn)
            if fetched {
                if isLoggedIn == "true" {
                    var ref : DatabaseReference!
                    ref = Database.database().reference().child("Users").child(username)
                    self.performSegue(withIdentifier: "toHomePage", sender: Any?.self)
                    ref.observe(.value, with: { (snapshot) in
                        print(snapshot)
                        let dictionary = snapshot.value as? [String:AnyObject]
                        wifiUsername = (dictionary!["wifiUsername"] as! String)
                        wifiPassword = (dictionary!["wifiPassword"] as! String)
                        CoreDataHandler.shared.updateValues()
                    })
                }
                else {
                    self.performSegue(withIdentifier: "toLoginPage", sender: Any?.self)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
