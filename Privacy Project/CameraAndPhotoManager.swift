//
//  CameraAndPhotoManager.swift
//  Privacy Project
//
//  Created by Timothy/Ammar/Chandra on 10/17/19.
//  Copyright © 2019 PETS. All rights reserved.
//

import UIKit

class CameraAndPhotoManager: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func chooseImage(_ sender: Any) {
        
        print("choose image")
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: . actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
            }else{
                print("Camera not available")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            print("photo lib")
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    //func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any], imageName: String) {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        print("image picker controller")
        
        //get the image path
        //let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        //print(imagePath)

        
        let myimage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
       // image = UIImage(info[UIImagePickerController.InfoKey.originalImage])
        image = myimage
        
        if image != nil {
             print("Contains a value!")
         } else {
             print("Doesn’t contain a value.")
         }
        
       
        //added code
      //  let fileManager = FileManager.default

        //Code to send to private gallery
        //get the PNG data for this image
       // let data = image.pngData()
        
        //store it in the document directory
        //fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
        
        imageView.image = image
        
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        let vc = segue.destination as! ViewController
        vc.Image = image
      
        if image != nil {
              print("Contains a value segway code!")
          } else {
              print("Doesn’t contain a value. Segway")
          }
        
    }
}

