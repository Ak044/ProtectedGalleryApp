//
//  ProtectedGallery.swift
//  Privacy Project
//
//  Created by Timothy/Ammar/Chandra on 12/2/19.
//  Copyright © 2019 PETS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ProtectedGallery: UIViewController, UICollectionViewDataSource {

    @IBOutlet var imageCollection: UICollectionView!
    {
        didSet{
            imageCollection.dataSource = self
            imageCollection.delegate = self as? UICollectionViewDelegate
            
        }
    }
    
    /*
    @IBOutlet weak var imageCollection: UICollectionView!
    {
        didSet{
            imageCollection.dataSource = self
            imageCollection.delegate = self as? UICollectionViewDelegate
            
        }
    }
 
 */
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //print("Protected Gallery reached") //executed
        loadImages()
        //print("Protected Gallery loadimages executed") //executed
        
    }
    
    func loadImages()
    {
        //images.append(UIImage(named: "image1")!)
        images.append(UIImage(named: "image1")!)
        images.append(UIImage(named: "image1")!)


        self.imageCollection.reloadData()

    }
    
    func collectionView(_ imageCollection: UICollectionView, numberOfItemsInSection section: Int)-> Int{
        return images.count
    }
    
    func collectionView(_ imageCollection: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCollectionViewCell
   
        let image = images[indexPath.row]
        
        cell.imageView.image = image;
        return cell
        
    }
}
