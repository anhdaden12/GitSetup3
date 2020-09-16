//
//  CustomTableViewCell.swift
//  ActionCell
//
//  Created by Boss on 1/12/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit


protocol CustomTableViewCellDelelgate: AnyObject {
    func onClickButtonTapped(cell: CustomTableViewCell) -> Void
}
class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var buttonXoa: UIButton!
    
    var delegate: CustomTableViewCellDelelgate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func OnClickXoa(_ sender: Any) {
        delegate?.onClickButtonTapped(cell: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
    }
    
    static var identifier: String {
        return "CustomTableViewCell"
    }
    
}
