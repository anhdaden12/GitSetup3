//
//  TableView+Util.swift
//  ActionCell
//
//  Created by Đặng Duy Cường on 1/9/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit
extension UITableView {
    func enableFullSeperatorTableView() {
        self.tableFooterView = UIView.init(frame: CGRect.zero)
        self.separatorInset = .zero
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = .zero
    }
}
