//
//  CountryTableViewCell.swift
//  toy03-Weather
//
//  Created by 최은지 on 17/03/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
