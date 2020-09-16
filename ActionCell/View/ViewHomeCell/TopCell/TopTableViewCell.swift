//
//  TopTableViewCell.swift
//  ActionCell
//
//  Created by Boss on 1/12/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class TopTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: TopTableViewCell.identifier, bundle: nil)
    }
    
    static var identifier: String {
        return "TopTableViewCell"
    }
}
