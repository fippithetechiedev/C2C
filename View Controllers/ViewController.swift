//
//  ViewController.swift
//  c2cfinal
//
//  Created by Mufaddal Ibrahimjee on 21/02/18.
//  Copyright © 2018 mufaddal. All rights reserved.
//

import UIKit
import FirebaseDatabase
//var flag = 0
var guestUser : Bool = false
var origin1: CGPoint!
var origin2: CGPoint!
class ViewController: UIViewController {
//    var x:CGFloat!
//    var y1:CGFloat!
//    var y2:CGFloat!
    
    
    var se1 = CGPoint(x: 30, y: 33)
    var se2 = CGPoint(x: 30, y: 88)
    var seven1 = CGPoint(x: 36, y: 39)
    var seven2 = CGPoint(x: 36, y: 106)
    var plus1 = CGPoint(x: 39, y: 44)
    var plus2 = CGPoint(x: 39, y: 118)
    var x1 = CGPoint(x: 36, y: 46)
    var x2 = CGPoint(x: 36, y: 122)
    
    
    
    
    
    
    
    var ref:DatabaseReference!
    var databaseHandle:DatabaseHandle?
    var rer: String = ""
    
    var postData = [String]()
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func passedit(_ sender: Any) {
     //passwordTextField.frame.origin = origin1
        UIView.animate(withDuration: 0.5, animations: {
            self.passwordTextField.frame.origin = origin1
        }) { (true) in
            self.passwordTextField.becomeFirstResponder()
        }
    }
    
    @IBAction func userdone(_ sender: Any) {
        usernameTextField.resignFirstResponder()
        //passwordTextField.becomeFirstResponder()
       
        UIView.animate(withDuration: 0.5, animations: {
            self.passwordTextField.frame.origin = origin1
        }) { (true) in
        self.passwordTextField.becomeFirstResponder()
        }
        
        //print(passwordTextField.frame.origin.x)

        
    }
    
    @IBAction func passdone(_ sender: Any) {
        self.passwordTextField.resignFirstResponder()
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.passwordTextField.frame.origin = origin2
        })
    
    }
    

    
    @IBOutlet weak var incorrectPasswordLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var guestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if(view.frame.width == 320.0)
        {
            origin1 = se1
            origin2 = se2
            //se
        }
        else if(view.frame.width == 414.0)
        {
            origin1 = plus1
            origin2 = plus2
            //plus
        }
        else if(view.frame.width == 375.0 && view.frame.height == 667.0)
        {
            origin1 = seven1
            origin2 = seven2
            //8
        }
        else if(view.frame.width == 375.0 && view.frame.height == 812.0)
        {
            origin1 = x1
            origin2 = x2
            //x
        }
        
        print(origin1)
        print(origin2)
       // print(usernameTextField.frame.width)
//        x = usernameTextField.frame.origin.x
//        y1 = usernameTextField.frame.origin.y
//        y2 = passwordTextField.frame.origin.y
//       print(usernameTextField.frame.origin.x)
//       print(passwordTextField.frame.origin.x)
//        print(usernameTextField.frame.origin.y)
//        print(passwordTextField.frame.origin.y)
//
        guestButton.layer.cornerRadius = 10
        signInButton.layer.cornerRadius = 10
        
        if #available(iOS 11, *) {
            // Disables the password autoFill accessory view.
            usernameTextField.textContentType = UITextContentType("")
            passwordTextField.textContentType = UITextContentType("")
        }

    }
    override func viewDidAppear(_ animated: Bool) {
        
        usernameTextField.text = ""
        passwordTextField.text = ""

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        
        guestUser = false
        
        username = usernameTextField.text ?? "N/A"
        password = passwordTextField.text ?? "N/A"
        if username == "" || password == "" {
            self.showAlert(title : "Error", message : "One of the fields is empty")
        }
        else {
            ref = Database.database().reference().child("Users").child(username)
            ref.observe(.value, with: { (snapshot) in
                print(snapshot)
                
                if snapshot.exists()
                {
                    let dictionary = snapshot.value as? [String:AnyObject]
                    self.rer = (dictionary!["password"] as! String)
                    isLoggedIn = dictionary!["loginStatus"] as! String
                    
                    if isLoggedIn == "false"
                    {
                        if self.rer == password {
                            //isLoggedIn = "true"
                            
                            wifiUsername = (dictionary!["wifiUsername"] as! String)
                            wifiPassword = (dictionary!["wifiPassword"] as! String)
                            print("THIS : \(isLoggedIn)")
                            //self.rer  = "N/A"
                            CoreDataHandler.shared.cacheUser(completion: { (isPersisted) in
                                if isPersisted {
                                    self.ref.updateChildValues(["loginStatus":"true"])
                                    self.performSegue(withIdentifier: "goToHomeScreen", sender: Any?.self)
                                }
                                
                            })
                        }
                        else if(self.rer != password && password != "") {
                            self.showAlert(title: "Error", message: "Invalid Password")

                        }
                        
                    }
                    else {
                        self.showAlert(title: "Error", message: "You are already logged in with some other device")
                    }
                }
                else{
                    self.showAlert(title: "Error", message: "Invalid Username Or Password")
                }
                
            })
            
        }
        
        
    }
    
    @IBAction func guestButtonTapped(_ sender: Any) {
        guestUser = true
        username = "Guest"
        password = "N/A"
        wifiUsername = "N/A"
        wifiPassword = "N/A"
        self.performSegue(withIdentifier: "goToHomeScreen", sender: Any?.self)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//        passwordTextField.frame.origin = CGPoint(x: x , y: y1 )
//    }

    
    func showAlert(title :String , message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let bttn = UIAlertAction(title: "Done", style: .cancel, handler: nil)
        alert.addAction(bttn)
        present(alert, animated: true, completion: nil)
    }
    
}



//SE - 320
//8 - 375,667
//+ - 414
//X - 375,812





