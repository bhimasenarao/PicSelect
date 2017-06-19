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
    
    var imagePicker = UIImagePickerController()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
    }

    
    @IBAction func cameraTapped(_ sender: Any) {
        
    }
    
    @IBAction func photoLibraryTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
    }
    
    
    
    
}
