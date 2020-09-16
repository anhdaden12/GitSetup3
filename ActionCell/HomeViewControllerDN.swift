//
//  HomeViewControllerDN.swift
//  ActionCell
//
//  Created by Boss on 2/8/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class HomeViewControllerDN: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ClickToButton(_ sender: Any) {
        let customViewController = CrollViewViewController(nibName: "CrollViewViewController", bundle: nil)
        navigationController?.pushViewController(customViewController, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
