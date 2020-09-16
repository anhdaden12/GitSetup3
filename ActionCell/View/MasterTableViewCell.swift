//
//  MasterTableViewCell.swift
//  ActionCell
//
//  Created by Đặng Duy Cường on 10/25/19.
//  Copyright © 2019 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource, SubTableViewCellDelegate {
    
    
    
    
    @IBOutlet weak var printButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var subTableView: UITableView!
    @IBOutlet weak var heightContrain: NSLayoutConstraint!
    
    var numbers = [Int](0...5)
    var listNames: [String] = []
    var test: String?
//    var middlemenName: String? {
//        didSet {
//            if !(self.middlemenName == nil && self.middlemenName == self.test) {
//                self.listNames.append(self.middlemenName!)
//            }
//        }
//    }
    
    var middlemenName: String? {
        didSet {
            if self.middlemenName != nil {
                if !(listNames.contains(self.middlemenName!)) {
                    listNames.append(self.middlemenName!)
                    subTableView.reloadData()
                } else {
                    print("existed")
                }
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        subTableView.register(SubTableViewCell.nib(), forCellReuseIdentifier: SubTableViewCell.identifier)
        subTableView.delegate = self
        subTableView.dataSource = self
        subTableView.isScrollEnabled = false
        subTableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func layoutSubviews() {
        subTableView.isHidden = listNames.count > 0 ? false : true
        heightContrain.constant = CGFloat((listNames.count))
        subTableView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func onClickButtonTapped(cell: SubTableViewCell) {
        guard let index = self.subTableView.indexPath(for: cell) else{ return }
        listNames.remove(at: index.row)
        //heightContrain.constant = CGFloat((listNames.count) * 100)
//        if listNames.count == 0 {
//            heightContrain.constant = 0
//        }
        heightContrain.constant = CGFloat((listNames.count) * 100)
        subTableView.reloadData()
    }
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNames.count > 0 ? listNames.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubTableViewCell.identifier, for: indexPath) as! SubTableViewCell
        let test1 = listNames[indexPath.row]
        cell.nameLabel.text = test1
        
        cell.buttonXoa.tag  = indexPath.row
        cell.delegate = self
        cell.temp = middlemenName
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if listNames.count == 0 {
            subTableView.isHidden = true
        }
        heightContrain.constant = CGFloat((listNames.count) * 100)
    }
    
    
    
    
    static func nib() -> UINib {
        return UINib(nibName: MasterTableViewCell.identifier, bundle: nil)
    }
    
    func fillData() {
//        tableView.reloadData()
    }
    
    static var identifier: String {
        return "MasterTableViewCell"
    }
}
