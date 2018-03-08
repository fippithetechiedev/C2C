//
//  customsponsor.swift
//  c2cfinal
//
//  Created by Mufaddal Ibrahimjee on 21/02/18.
//  Copyright © 2018 mufaddal. All rights reserved.
//

import UIKit

class customsponsor: UITableViewCell {
    
    
   
    @IBOutlet weak var animalLbl: UILabel!
    
    @IBOutlet weak var animalImage: UIImageView!
    
    @IBOutlet weak var cellView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
