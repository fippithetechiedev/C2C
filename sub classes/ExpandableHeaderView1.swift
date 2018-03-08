//
//  ExpandableHeaderView.swift
//  c2cfinal
//
//  Created by Mufaddal Ibrahimjee on 22/02/18.
//  Copyright © 2018 mufaddal. All rights reserved.
//

import UIKit

protocol ExpandableHeaderViewDelegate1
{
    func toggleSection(header: ExpandableHeaderView1, section: Int)
}

class ExpandableHeaderView1: UITableViewHeaderFooterView {

    var delegate: ExpandableHeaderViewDelegate1?
    var section: Int!
    
    override init(reuseIdentifier: String?)
    {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selectHeaderAction(gestureRecognizer:UITapGestureRecognizer)
    {
        let cell = gestureRecognizer.view as! ExpandableHeaderView1
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    func customInit(title:String, section: Int, delegate: ExpandableHeaderViewDelegate1)
    {
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.textColor = UIColor.white
        self.contentView.backgroundColor = UIColor.darkGray
    }
    

}
