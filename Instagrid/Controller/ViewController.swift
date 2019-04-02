//
//  ViewController.swift
//  Instagrid
//
//  Created by Flo on 18/03/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  @IBOutlet weak var buttonView: ButtonView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func showFirstGrid(_ sender: Any) {
        buttonView.style = .firstButton
    }
    
    @IBAction func showSecondGrid(_ sender: Any) {
        buttonView.style = .secondButton
    }
    
    
    @IBAction func showThirdGrid(_ sender: Any) {
        buttonView.style = .thirdButton
    }
    
}
