//
//  LandingViewController.swift
//  ACM
//
//  Created by Mufaddal Ibrahimjee on 21/02/18.
//  Copyright © 2018 mufaddal. All rights reserved.
//

import UIKit
import Firebase

//var appTimer = Timer()

class LandingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var ref : DatabaseReference!
    
    @IBAction func slack(_ sender: Any) {
        openCustomApp()
    }
    let kCustomURLScheme = "slack://open"
    
    func openCustomApp() {
        
        let Url = NSURL(string: kCustomURLScheme)
        if UIApplication.shared.canOpenURL(Url! as URL)
        {
            UIApplication.shared.open(Url! as URL)
            
            //(Url! as URL)
            
        }
         else {
            //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.open(NSURL(string: "https://itunes.apple.com/us/app/slack/id618783545?mt=8")! as URL)


        //UIApplication.shared.openURL(NSURL(string: kCustomURLScheme)! as URL)
        }
        
    }

    
    
    @IBAction func bttn6(_ sender: Any) {
        //self.performSegue(withIdentifier: "back", sender: self)
        self.dismiss(animated: true, completion: {
            self.ref = Database.database().reference().child("Users").child(username)
            self.ref.updateChildValues(["loginStatus":"false"])
            //self.ref.setValue("false")
            
            username = ""
            password = ""
            //flag = 1
            //helloflg = false
            
            CoreDataHandler.shared.deleteData(completion: { (_ ) in
                
            })
        })
    }
    
    
    @IBOutlet weak var timeline: UITableView!
    @IBAction func bttn5(_ sender: Any) {
        
    }
    @IBAction func bttn4(_ sender: Any) {
        
    }
    @IBAction func bttn3(_ sender: Any) {
        if !guestUser {
            self.performSegue(withIdentifier: "scanner", sender: Any?.self)
        }
        else {
            self.showAlert(title: "Error", message: "This feature is only for registered participants")
        }
        
    }
    
    @IBAction func bttn2(_ sender: Any) {
        print("!!!!!!!!!")
        print(wifiPassword)
        print(wifiUsername)
    }
    
    @IBAction func bttn1(_ sender: Any) {
        
    }
    let tm1: [String] = ["Registration","Orientation","Opening Ceremony","Pitch Pits (team formation)","Hack Starts","Dinner","Quiz"]
    
    let pm1: [String] = ["05:30 PM - 07:30 PM, 10-Mar-2018","05:30 PM - 07:30 PM, 10-Mar-2018","07:00 PM - 08:00 PM, 10-Mar-2018","08:00 PM - 09:00 PM, 10-Mar-2018","08:30 PM, 10-Mar-2018","09:00 PM - 10:00 PM, 10-Mar-2018","10:30 PM - 11:30 PM, 10-Mar-2018"]
    
    let tm2: [String] = ["Late Night Snack","Naptime","Coffee","Breakfast","Session 1","Session 2","Lunch","Technical Inspection","Snacks","Elimination Results","Music","Dinner","Jenga Challenge"]
    
    let pm2: [String] = ["02:00 AM, 11-Mar-2018","02:00 AM, 11-Mar-2018","06:00 AM, 11-Mar-2018","08:00 AM - 09:00 AM, 11-Mar-2018","10:00 AM - 11:00 AM, 11-Mar-2018","12:00 PM - 01:00 PM, 11-Mar-2018","01:00 PM - 02:00 PM 11/03/18","03:00 PM, 11-Mar-2018","06:00 PM, 11-Mar-2018","07:00 PM, 11-Mar-2018","07:30 PM, 11-Mar-2018","09:00 PM - 10:00 PM, 11-Mar-2018","11:00 PM - 01:00 AM, 11-Mar-2018"]
    
    let tm3: [String] = ["Late Night Snack","Naptime","Coffee","Alarming Call","Breakfast","Hack Ends","Expo","Experience Sharing","Closing Ceremony"]
    
    let pm3: [String] = ["02:00 AM, 12-Mar-2018","02:00 AM, 12-Mar-2018","06:00 AM, 12-Mar-2018","07:00 AM, 12-Mar-2018","08:00 AM - 09:00 AM, 12-Mar-2018","08:30 AM, 12-Mar-2018","09:00 AM - 11:30 AM, 12-Mar-2018","11:30 AM - 12:00 PM, 12-Mar-2018","12:00 PM - 02:00 PM, 12-Mar-2018"]
    
    var tm : [String] = []
    var pm : [String] = []
    
    var isTapped: Bool = false
    @IBAction func hamburger(_ sender: Any) {
        if isTapped == false {
            UIView.animate(withDuration: 0.5, animations: {
                self.navBar.transform = CGAffineTransform(translationX:  CGFloat(self.navBar.frame.width), y: 0)
            }, completion: nil)
            isTapped = true
        }
        else if isTapped == true {
            isTapped = false
            UIView.animate(withDuration: 0.5, animations: {
                self.navBar.transform = CGAffineTransform(translationX:  CGFloat(-self.navBar.frame.width), y: 0)
            }, completion: nil)
        }
    }
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var navBar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hello(title: "Hey \(username.capitalized)!", message: "Let's Code2Create! Shall we?")
        //UserDefaults.standard.set(true, forKey: "helloflg")
        //print("set true")
        
        
        //runapptimer()
        
        title = "Timeline"
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        tm = tm1 + tm2 + tm3
        pm = pm1 + pm2 + pm3
    }
    
//    func runapptimer()
//    {
//        appTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timer), userInfo: nil, repeats: true)
//    }
//
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        leadingConstraint.constant = CGFloat(-navBar.frame.width)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        timeline.backgroundColor = Colors.outer
    
            
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TimelineTableViewCell
        if indexPath.row == 0 {
            cell.cellmarker.image = UIImage(named : "first")
        }
        else if indexPath.row == tm.count-1 {
            cell.cellmarker.image = UIImage(named : "last")
        }
        else {
            cell.cellmarker.image = UIImage(named  : "middle")
        }
        cell.title.text = tm[indexPath.row]
        cell.time.text = pm[indexPath.row]
        cell.container.backgroundColor = Colors.inner
        cell.contentView.backgroundColor = Colors.outer
        cell.time.textColor = Colors.button
        return cell
        
    }
    
    
    
//    @objc func timer()
//
//    {
//    switch UIApplication.shared.applicationState {
//
//    case .active:
//    print("cool")
//    break
//
//    case .background:
//        self.ref = Database.database().reference().child("Users").child(username)
//        self.ref.updateChildValues(["loginStatus":"false"])
//        print("ohno")
//
//    break
//
//    case .inactive:
//        self.ref = Database.database().reference().child("Users").child(username)
//        self.ref.updateChildValues(["loginStatus":"false"])
//        //appTimer.invalidate()
//
//
//    break
//    }
//    }
//
    
    
    func hello(title:String, message:String)
    {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        
        
        
        alert.addAction(UIAlertAction(title: "Okay!", style: UIAlertActionStyle.default, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func showAlert(title :String , message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let bttn = UIAlertAction(title: "Done", style: .cancel, handler: nil)
        alert.addAction(bttn)
        present(alert, animated: true, completion: nil)
    }
}
