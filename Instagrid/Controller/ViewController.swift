//
//  ViewController.swift
//  Instagrid
//
//  Created by Flo on 18/03/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var firstIconCorrect: UIImageView!
    @IBOutlet weak var secondIconCorrect: UIImageView!
    @IBOutlet weak var thirdIconCorrect: UIImageView!
    
    
    @IBOutlet weak var firstGridButton: UIButton!
    @IBOutlet weak var secondGridButton: UIButton!
    @IBOutlet weak var thirdGridButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func showFirstGrid(_ sender: Any) {
        thirdIconCorrect.isHidden = true
        firstIconCorrect.isHidden = false
        secondIconCorrect.isHidden = true
    }
    
    @IBAction func showSecondGrid(_ sender: Any) {
        thirdIconCorrect.isHidden = true
        firstIconCorrect.isHidden = true
        secondIconCorrect.isHidden = false
    }
    
    
    @IBAction func showThirdGrid(_ sender: Any) {
        thirdIconCorrect.isHidden = false
        firstIconCorrect.isHidden = true
        secondIconCorrect.isHidden = true
        
    }
    
}
