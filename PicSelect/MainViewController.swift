//
//  MainViewController.swift
//  PicSelect
//
//  Created by Bhimasena Patri on 19/6/2017.
//  Copyright © 2017 Bhimasena Patri. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var pics: [MyPhotos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            pics = try context.fetch(MyPhotos.fetchRequest())
            tableView.reloadData()
            
        }catch{
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pics.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let pic = pics[indexPath.row]
        cell.textLabel?.text = pic.title
        cell.imageView?.image = UIImage(data: pic.image! as Data)
        return cell
    }
}

