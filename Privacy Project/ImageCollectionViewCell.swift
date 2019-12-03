//
//  ImageCollectionViewCell.swift
//  Privacy Project
//
//  Created by Timothy Dai on 12/2/19.
//  Copyright © 2019 Capstone. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
        
    }
}
