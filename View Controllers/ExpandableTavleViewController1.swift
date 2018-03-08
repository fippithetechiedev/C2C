//
//  ViewController.swift
//  customTableViewCell
//
//  Created by Yash Patel on 01/11/17.
//  Copyright © 2017 Yash Patel. All rights reserved.
//

import UIKit

class ExpandableTableViewController1: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate1{
    
  //  let elements = ["horse", "cat", "dog", "potato","horse", "cat", "dog", "potato","horse", "cat", "dog", "potato"]

    var sections = [
        Section1(genre: "Faculty Organizers", movies: ["dean_site", "hrv","divya"], name: ["Dr. Aswani Kumar Cherukuri","Prof. H.R.Vishwakarma","Dr. Divya Udayan J"], work:["Dean SITE","Faculty Coordinator - ACM VIT","Faculty Coordinator - ACM VIT"], expanded: false),
        Section1(genre: "Student Organizers", movies: ["abhitej", "hardika", "sourish", "harshit","yash", "ri", "anmol", "vibhore-1"], name:["Abhitej","Hardika","Sourish","Harshit","Yash","Rishabh","Anmol","Vibhore"], work:["President","Managing Director","Technical Director","Associate Technical Head","Research And ICPC Head","Operations Head","Marketing Head","Finance Head"], expanded: false),Section1(genre: "App Developer", movies: ["appdev"],name: ["Mufaddal Ibrahimjee"], work: ["mufaddaljamaly2752@gmail.com"], expanded: false)]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        title = "About Us"
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
  /*  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }*/
    
  /* func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }*/
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sections[section].movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(sections[indexPath.section].expanded)
        {
            
            return 100
            
        }
        else
        {
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = ExpandableHeaderView1()
        header.customInit(title: sections[section].genre, section: section, delegate: self)
        return header
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
       // cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        
        cell.animalLbl.text = sections[indexPath.section].name[indexPath.row]
        cell.animalLbl.textColor = UIColor.white
        cell.theydo.text = sections[indexPath.section].work[indexPath.row]
        cell.theydo.textColor = UIColor.white
        cell.animalImage.image = UIImage(named: sections[indexPath.section].movies[indexPath.row])
        cell.animalImage.layer.cornerRadius = cell.animalImage.frame.height / 2
       //cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2

        
        return cell
    }
    func toggleSection(header: ExpandableHeaderView1, section: Int) {
        sections[section].expanded = !sections[section].expanded
        
        tableView.beginUpdates()
        for i in 0 ..< sections[section].movies.count
        {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
        self.tableView.reloadData()
    }
    


}
















