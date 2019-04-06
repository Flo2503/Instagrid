//
//  ViewController.swift
//  Instagrid
//
//  Created by Flo on 18/03/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var buttonView: ButtonView!
    @IBOutlet weak var firstGrid: FirstGrid!
    @IBOutlet weak var secondGrid: SecondGrid!
    @IBOutlet weak var thirdGrid: ThirdGrid!


    @IBOutlet weak var firstGridBotLeftIm: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    

    @IBAction func didTapFirstGridButton(_ sender: Any) {
        buttonView.style = .firstButton
        firstGrid.isHidden = false
        secondGrid.isHidden = true
        thirdGrid.isHidden = true
        
    }
    
    @IBAction func didTapSecondGridButton(_ sender: Any) {
        buttonView.style = .secondButton
        firstGrid.isHidden = true
        secondGrid.isHidden = false
        thirdGrid.isHidden = true
    }
    
    @IBAction func didTapThirdGridButton(_ sender: Any) {
        buttonView.style = .thirdButton
        firstGrid.isHidden = true
        secondGrid.isHidden = true
        thirdGrid.isHidden = false
    }
    
    
    @IBAction func clickOnGridButtons(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            firstGridBotLeftIm.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }


}




