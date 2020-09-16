//
//  CrollViewViewController.swift
//  ActionCell
//
//  Created by Boss on 2/8/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class CrollViewViewController: UIViewController {
    @IBOutlet weak var dropListMainButton: UIButton!
    
    @IBOutlet weak var capNhatOutlet: UIButton!
    @IBOutlet weak var dropListHomeButton: UIButton!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var uiView2: UIView!
    @IBOutlet weak var ButtonCapNhatTong: UIButton!
    @IBOutlet weak var heightContentConstant: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let dropdown = DropDown()
    var isDisplayCell  = true
    
    var myArray = [Int](0...10)
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.isHidden = true
        uiView2.isHidden = true
        ButtonCapNhatTong.isHidden = true
        TableView.register(TableViewCell1.nib(), forCellReuseIdentifier: TableViewCell1.identifier)
        TableView.register(TableViewCell2.nib(), forCellReuseIdentifier: TableViewCell2.identifier)
        TableView.register(TableViewCell3.nib(), forCellReuseIdentifier: TableViewCell3.identifier)
    }
    
    override func viewDidLayoutSubviews() {
        heightContentConstant.constant = TableView.contentSize.height
    }

    @IBAction func DropListButton(_ sender: UIButton) {
        capNhatOutlet.setTitle("Tạm Hoãn", for: .normal)
         TableView.isHidden = true
        uiView2.isHidden = true
        ButtonCapNhatTong.isHidden = true
    }
    
    @IBAction func DropListHomeButton(_ sender: Any) {
        capNhatOutlet.setTitle("Hoàn Thành", for: .normal)
        TableView.isHidden = false
        heightContentConstant.constant = TableView.contentSize.height
        uiView2.isHidden = false
        ButtonCapNhatTong.isHidden = false
    }
    
    
    @IBAction func onclickHideCell(_ sender: Any) {
        isDisplayCell = !isDisplayCell
        TableView.estimatedRowHeight = 150
        TableView.reloadData()
        self.view.layoutIfNeeded()
        heightContentConstant.constant = TableView.contentSize.height
    }
    
}
extension CrollViewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return  isDisplayCell == true ? myArray.count : 0
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell1.identifier, for: indexPath) as! TableViewCell1
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell2.identifier, for: indexPath) as! TableViewCell2
            cell.textLabel?.text = "\(myArray[indexPath.row])"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell3.identifier, for: indexPath) as! TableViewCell3
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
    
}

