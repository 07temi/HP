//
//  CollectionViewCell.swift
//  HP
//
//  Created by Артем Черненко on 16.01.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionViewCellImage: UIImageView!
    @IBOutlet weak var collectionViewCellLabel: UILabel!

    func configure(from character: Character) {
        collectionViewCellLabel.text = character.name
        NetworkingManager.shared.fetchImage(from: character.image) { result in
            switch result {
            case .success(let imageData):
                self.collectionViewCellImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
                self.collectionViewCellImage.image = .checkmark
            }
        }
    }
}

