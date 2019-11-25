//
//  ViewController.swift
//  Privacy Project
//
//  Created by Timothy/Ammar/Chandra on 10/17/19.
//  Copyright © 2019 PETS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fileManager = FileManager.default

    }

    @IBAction func onGoToPrivacyProject(_ sender: Any) {
    }
    
}

private func filePath(forKey key: String) -> URL? {
    let fileManager = FileManager.default
    guard let documentURL = fileManager.urls(for: .documentDirectory,
                                            in: FileManager.SearchPathDomainMask.userDomainMask).first else { return nil }
    
    return documentURL.appendingPathComponent(key + ".png")
}

