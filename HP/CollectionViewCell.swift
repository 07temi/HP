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

    func configure(with character: Character) {
        collectionViewCellLabel.text = character.name
        //numberOfLessons.text = "Number of lessons: \(course.numberOfLessons ?? 0)"
        //numberOfTests.text = "Number of tests: \(course.numberOfTests ?? 0)"
        NetworkingManager.shared.fetchImage(from: character.image) { result in
            switch result {
            case .success(let imageData):
                self.collectionViewCellImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
                self.collectionViewCellImage.image = .remove
            }
        }
    }
}

