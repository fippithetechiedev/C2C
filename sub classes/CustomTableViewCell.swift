//
//  CustomTableViewCell.swift
//  customTableViewCell
//
//  Created by Yash Patel on 01/11/17.
//  Copyright © 2017 Yash Patel. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var theydo: UILabel!
    @IBOutlet weak var animalLbl: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var animalImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
