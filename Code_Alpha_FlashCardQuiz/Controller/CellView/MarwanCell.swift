//
//  MarwanCell.swift
//  Code_Alpha_FlashCardQuiz
//
//  Created by Marwan Mekhamer on 28/04/2025.
//

import UIKit

class MarwanCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImage: UIImageView!
    
    func setup(_ photo: UIImage) {
        photoImage.image = photo
    }
}
