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
    @IBOutlet weak var currentView: CurrentView!
    @IBOutlet weak var shareView: Share!
    
    private var imagePicker = UIImagePickerController()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        setUpObserver()
        buttonView.firstButtonClick(self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shareView.swipeOrientation()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        shareView.swipeOrientation()

    }

// Listeners
    private func setUpObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(chooseImage), name: NSNotification.Name("tapOnGridButtons"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(shareGrid),name: NSNotification.Name("swipeToShare"), object: nil)
    }
    
    
    
   
    
// Photo library access
    @objc private func libraryAccess() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
  
// Camera access (Bonus)
    @objc private func cameraAccess() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        }else {
            let alert = UIAlertController(title: "Sorry !", message: "Camera not available, select image in Library", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Got it 👌", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
// Alert to display source choice : camera or library
    @objc private func chooseImage() {
        let alert = UIAlertController(title: "Photo Source", message: "Please choose a source", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera 📷", style: .default, handler: { _ in
            self.cameraAccess()
        }))
        alert.addAction(UIAlertAction(title: "Library 🗂️", style: .default, handler: { _ in
            self.libraryAccess()
        }))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    
    
// Convert UIView to UIImage
    private func convertUIV(with view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext() {
            view.layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image
        }
        return nil
    }

    
// Grid animation when swipe to share
    private func transformCurrentView() {
        if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
            UIView.animate(withDuration: 2.0, animations: {
                self.currentView.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
            })
        } else {
            UIView.animate(withDuration: 2.0, animations: {
                self.currentView.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height)
            })
        }
    }

    
// Share grids if all iamges are selected and then animate the grid
    @objc private func shareGrid() {
        guard currentView.isAllImageSelected() else {
            let alert = UIAlertController(title: "Sorry !", message: "Please select all images before sharing", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Got it 👌", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        if let image = convertUIV(with: currentView) {
            transformCurrentView()
            let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil)
            activityVC.completionWithItemsHandler = { _ , _ , _, _ in
                UIView.animate(withDuration: 2.0, animations: {
                    self.currentView.transform = .identity
                })
            }
        }

    }
    

}
// Extension
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            currentView.setImage(image: image)

    }
        
        dismiss(animated: true, completion: nil)
    }
    
}





