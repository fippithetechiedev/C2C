//
//  CoreDataHandler.swift
//  c2cfinal
//
//  Created by Mufaddal Ibrahimjee on 23/02/18.
//  Copyright © 2018 mufaddal. All rights reserved.
//

import UIKit
import CoreData

var username : String = "N/A"
var password : String = "N/A"
var isLoggedIn : String = "false"
var wifiUsername : String = ""
var wifiPassword : String = ""

class CoreDataHandler {
    
    static let shared : CoreDataHandler = CoreDataHandler()

    func cacheUser(completion : @escaping (Bool) -> ()) {
        
        DispatchQueue.main.async {
            let delegate = UIApplication.shared.delegate as! AppDelegate
            let context = delegate.persistentContainer.viewContext
            
            let entity = NSEntityDescription.insertNewObject(forEntityName: "UserDetails", into: context)
            
            entity.setValue(username, forKey: "username")
            entity.setValue(password, forKey: "password")
            entity.setValue(isLoggedIn, forKey: "status")
            entity.setValue(wifiPassword, forKey: "wifiP")
            entity.setValue(wifiUsername, forKey: "wifiU")
            
            do {
                try context.save()
                completion(true)
            } catch {
                print("error")
            }
        }
    }
    
    func fetchData(completion : @escaping (Bool) -> ()) {
        
        DispatchQueue.main.async {
            let delegate = UIApplication.shared.delegate as! AppDelegate
            let context = delegate.persistentContainer.viewContext
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserDetails")
            
            do {
                let results = try context.fetch(request)
                
                for result in results as! [NSManagedObject]
                {
                
                username = result.value(forKey: "username") as? String ?? "N/A"
                password = result.value(forKey: "password") as? String ?? "N/A"
                wifiUsername = result.value(forKey: "wifiU") as? String ?? "N/A"
                wifiPassword = result.value(forKey: "wifiP") as? String ?? "N/A"
                isLoggedIn = result.value(forKey: "status") as? String ?? "false"
                
                
                }
                completion(true)
                
            } catch {
                completion(false)
                print("error")
            }
        }
    }
    
    func deleteData(completion : @escaping(Bool) -> ()) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserDetails")
        
        do {
            let results = try context.fetch(request)
            for result in results as! [NSManagedObject] {
                context.delete(result)
            }
            try context.save()
            completion(true)
            
        } catch {
            print("error")
            completion(false)
        }
    }
    
    func updateValues() {
        deleteData { (deleted) in
            if deleted {
                self.cacheUser(completion: { (_ ) in
                    
                })
            }
        }
    }
    
}
