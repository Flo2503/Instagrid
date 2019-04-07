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
    @IBOutlet weak var firstGrid: FirstGrid!
    @IBOutlet weak var secondGrid: SecondGrid!
    @IBOutlet weak var thirdGrid: ThirdGrid!


    var imagePicker = UIImagePickerController()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(tapOnGridButtons), name: NSNotification.Name("tapOnGridButtons"), object: nil)
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
    
    
//Access photo library
    @objc func tapOnGridButtons() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    


}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            firstGrid.bottomLetftImage.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
    
   
}



