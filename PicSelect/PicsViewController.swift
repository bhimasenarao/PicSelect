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
    
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var addUpdateBtn: UIButton!
    var imagePickerPic = UIImagePickerController()
    var pic: MyPhotos? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePickerPic.delegate = self
        if pic != nil{
            imageView.image = UIImage(data: pic!.image! as Data)
            titleTextField.text = pic!.title
            addUpdateBtn.setTitle("Update", for: .normal)
        }else{
            deleteBtn.isHidden = true
        }
        
    }

    @IBAction func cameraTapped(_ sender: Any) {
        imagePickerPic.sourceType = .camera
        present(imagePickerPic, animated: true, completion: nil)
    }
    
    @IBAction func photosPressed(_ sender: Any) {
        
        imagePickerPic.sourceType = .photoLibrary
        present(imagePickerPic, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        imagePickerPic.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addTapped(_ sender: Any) {
        if pic != nil {
            pic?.title = titleTextField.text
            pic?.image = UIImagePNGRepresentation(imageView.image!) as NSData?
        }else{
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let pic = MyPhotos(context:context)
            pic.title = titleTextField.text
            pic.image = UIImagePNGRepresentation(imageView.image!) as NSData?
        }

        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)

    }
    
    @IBAction func deletePressed(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(pic!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        
    }
}
