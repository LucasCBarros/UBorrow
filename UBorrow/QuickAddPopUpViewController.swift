//
//  QuickAddPopUpViewController.swift
//  UBorrow
//
//  Created by Lucas Barros on 09/01/18.
//  Copyright © 2018 Lucas C Barros. All rights reserved.
//

import UIKit

class QuickAddPopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(red: 00, green: 00, blue: 00, alpha: 0.8)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click_DoneBtn(_ sender: Any) {
    }
    
    @IBAction func click_CancelBtn(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
}
