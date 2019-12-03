//
//  ViewController.swift
//  Privacy Project
//
//  Created by Timothy/Ammar/Chandra on 10/17/19.
//  Copyright © 2019 PETS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Image : UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // let fileManager = FileManager.default
        
        if Image != nil {
            print("Contains a value segway in main view control!")
        } else {
            print("Doesn’t contain a value in main view control")
        }
            

    }

    @IBAction func onGoToPrivacyProject(_ sender: Any) {
        //Needed to segue to camera.
    }
    
    @IBAction func GoToPrivateGallery(_ sender: Any) {
      
        print("we are in private gallery.")

        let vc = PrivateGallery()
        vc.finalImage = Image
        navigationController?.pushViewController(vc, animated: true)
        //finalImage = Image

        
    }
    
    @IBAction func GoToProtectedGallery(_ sender: Any) {
   
    }
}

private func filePath(forKey key: String) -> URL? {
    let fileManager = FileManager.default
    guard let documentURL = fileManager.urls(for: .documentDirectory,
                                            in: FileManager.SearchPathDomainMask.userDomainMask).first else { return nil }
    
    return documentURL.appendingPathComponent(key + ".png")
}
