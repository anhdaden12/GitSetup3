//
//  HomeViewController.swift
//  ActionCell
//
//  Created by Boss on 1/12/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, CustomTableViewCellDelelgate {
   
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableviewheight: NSLayoutConstraint!
    
     let dropdownListTestSuite = DropDown()
    var ages = [Int](0...15)
    var listNames = [String]()
    var listNameTable: [String] = []
    var name: String?
    
    var middlemenName: String? {
        didSet {
            if self.middlemenName != nil {
                if !(listNameTable.contains(self.middlemenName!)) {
                    listNameTable.append(self.middlemenName!)
                    tableView.reloadData()
                } else {
                    print("existed")
                }
            }
        }
    }
    
    func setName() {
        for item in ages {
            listNames.append("Name: \(item)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TopTableViewCell.nib(), forCellReuseIdentifier: TopTableViewCell.identifier)
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.register(BottomTableViewCell.nib(), forCellReuseIdentifier: BottomTableViewCell.identifier)
        setName()
        self.configTableviewHeight(with: self.listNames)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 50
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1{
            return 50
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1{
            return "Đây là bài Demo by Luyện"
        }
        return ""
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1 {
            let footerView = footerCustomView.instanceFromNib
            footerView.buttonFooter.addTarget(self, action: #selector(showDropDown(_:)), for: .touchUpInside)
            footerView.buttonFooter.setTitle("Lựa Chọn", for: .normal)
            return footerView
        }
        return UIView()
    }
    // Dropdown List
    @objc func showDropDown(_ sender: UIButton) {
        
        //        dropdownListTestSuite.dataSource = self.listTestSuite!.map({$0.name ?? ""})
        dropdownListTestSuite.dataSource = listNames
        dropdownListTestSuite.direction = .bottom
        dropdownListTestSuite.textFont = Constant.font.robotoRegular(ofSize: 15)
        dropdownListTestSuite.anchorView = sender
        dropdownListTestSuite.bottomOffset = CGPoint(x: 4, y: sender.bounds.size.height)
        //        dropdownListTestSuite.width = sender.bounds.size.width
        dropdownListTestSuite.width = UIScreen.main.bounds.width - 8
        
        dropdownListTestSuite.selectionAction = { (index, item) in
            sender.setTitle(item, for: .normal)
            //            self.btnDropDown.setTitle(self.listTestSuite![index].name ?? " ", for: .normal)
            //            self.testSuiteCode = self.listTestSuite![index].code ?? ""
            //            self.selectedTest = true
            self.middlemenName = item
            self.configTableviewHeight(with: self.listNames)
            self.tableView.reloadData()
        }
        dropdownListTestSuite.show()
    }
    
    func configTableviewHeight(with list: [String]) {
        let tableViewCellHeight: CGFloat = 100
        let section0Height: CGFloat = 100
        let section2Height: CGFloat = 100
        let headerFootersection1: CGFloat = 100
        tableviewheight.constant = (CGFloat(list.count) * tableViewCellHeight) + section0Height + section2Height + headerFootersection1
        tableView.reloadData()
    }
    
    func onClickButtonTapped(cell: CustomTableViewCell) {
        guard let index = self.tableView.indexPath(for: cell) else{ return }
        listNameTable.remove(at: index.row)
        tableView.reloadData()
    }
    
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return  listNameTable.count > 0 ? listNameTable.count : 0
        case 2:
            return 1
        default:
             return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TopTableViewCell.identifier, for: indexPath) as! TopTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
            let test1 = listNameTable[indexPath.row]
            cell.nameLabel.text = test1
            cell.delegate = self
            return cell
        case 2:
              let cell = tableView.dequeueReusableCell(withIdentifier: BottomTableViewCell.identifier, for: indexPath) as! BottomTableViewCell
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
    
}
