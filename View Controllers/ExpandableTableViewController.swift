//
//  ExpandableTableViewController.swift
//  c2cfinal
//
//  Created by Mufaddal Ibrahimjee on 22/02/18.
//  Copyright © 2018 mufaddal. All rights reserved.
//

import UIKit

class ExpandableTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ExpandableHeaderViewDelegate {
    
   
    

    @IBOutlet weak var tabView: UITableView!
    
    var sections = [
        Section(genre: "Who all can register?", movies: ["Any and all students from all over the country can register. We welcome you all!"], expanded: false),
        Section(genre: "What are the registration fees?", movies: ["Nothing, it’s absolutely free!"], expanded: false),
        Section(genre: "What kind of hackathon is this?", movies: ["This is a software hackathon. Although participants may use hardware if they wish to, they will be judged on their software implementation."], expanded: false),
        Section(genre: "The max. team size allowed:-", movies: ["You can have 1 to 4 people per team. You should either create your own team or accept invitations from other team admins."], expanded: false),
        Section(genre: "Tracks included:-", movies: ["For now we introduce the following tracks:   -FinTech ,-Smart Cities, -Education, -Health Care, -Space ,-AR/VR"], expanded: false),
        Section(genre: "How do I choose my track?", movies: ["When you register we will ask you to submit your idea proposal and on the basis of of your idea we will have shortlisting."], expanded: false),
        Section(genre: "How do I qualify for the pitching?", movies: ["There will be a technical inspection on Day 2 during the hack. After the inspection, we will shortlist 120 teams. These 120 teams will get a chance to present their hack in the expo for evaluation."], expanded: false),
        Section(genre: "Is it only about technology?", movies: ["We are tech enthusiasts but we believe 'All work and no play makes Jack a dull boy'.  We have numerous fun activities planned for you."], expanded: false),
        Section(genre: "Who will be on the Judges?", movies: ["We have experts from IBM, ACM India and Startup ecosphere to look into the details of your amazing projects."], expanded: false),
        Section(genre: "What all can I win?", movies: ["Cash prizes, original licenses for various softwares, cloud credits, exclusive goodies and swags for winners. But we have something special back in store for every participant."], expanded: false),
        Section(genre: "What if I get hungry?", movies: ["We’ll provide you with delicious food at regular intervals (breakfast, lunch, dinner and snacks) along with beverages."], expanded: false),
        Section(genre: "What about internet?", movies: ["You will be provided with free access to our beloved internet facility, VOLSBB."], expanded: false),
        Section(genre: "Accommodation for externals?", movies: ["We will not be providing any accomodation for external students. We expect our participants to stay at the venue for the full hack."], expanded: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "FAQ"
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


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
            
            return 120
            
        }
        else
        {
            return 0
        }
        
    }
    
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = ExpandableHeaderView()
        header.customInit(title: sections[section].genre, section: section, delegate: self)
        return header
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
        cell.textLabel?.text = sections[indexPath.section].movies[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
     //   cell.textLabel?.backgroundColor = UIColor.
        return cell
    }

    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        
        tabView.beginUpdates()
        for i in 0 ..< sections[section].movies.count
        {
            tabView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tabView.endUpdates()
        self.tabView.reloadData()
    }
   

}
