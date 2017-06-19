//
//  PicsViewController.swift
//  PicSelect
//
//  Created by Bhimasena Patri on 19/6/2017.
//  Copyright © 2017 Bhimasena Patri. All rights reserved.
//

import UIKit

class PicsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePickerPic = UIImagePickerController()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePickerPic.delegate = self
        
    }

    
    @IBAction func cameraTapped(_ sender: Any) {
        
    }
    
    @IBAction func photoLibraryTapped(_ sender: Any) {
        
        imagePickerPic.sourceType = .photoLibrary
        present(imagePickerPic, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        imagePickerPic.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }
    
    
    
    
}
