//
//  TableViewCell1.swift
//  ActionCell
//
//  Created by Boss on 2/8/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class TableViewCell1: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func nib() -> UINib {
        return UINib(nibName: TableViewCell1.identifier, bundle: nil)
    }
    
    static var identifier: String {
        return "TableViewCell1"
    }
    
}
