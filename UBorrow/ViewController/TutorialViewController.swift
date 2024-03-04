//
//  TutorialViewController.swift
//  UBorrow
//
//  Created by Lucas Barros on 17/01/18.
//  Copyright © 2018 Lucas C Barros. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func click_EndTutorialBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}
