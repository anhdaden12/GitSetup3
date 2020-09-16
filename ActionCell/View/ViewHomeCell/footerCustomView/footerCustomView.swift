//
//  footerCustomView.swift
//  ActionCell
//
//  Created by Boss on 1/12/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class footerCustomView: UIView {
    @IBOutlet weak var buttonFooter: UIButton!
    
   
    static var instanceFromNib : footerCustomView {
        let uiNib = UINib(nibName: "footerCustomView", bundle: nil)
        return uiNib.instantiate(withOwner: nil, options: nil)[0] as! footerCustomView
    }

}
