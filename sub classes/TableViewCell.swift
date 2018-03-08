//
//  TableViewCell.swift
//  Cutom Header With Nib
//
//  Created by Parth Changela on 18/12/16.
//  Copyright © 2016 Parth Changela. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
