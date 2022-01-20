//
//  CharacterDescriptionViewController.swift
//  HP
//
//  Created by Артем Черненко on 17.01.2022.
//

import UIKit

class CharacterDescriptionViewController: UIViewController {
    
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    @IBOutlet weak var characterDescriptionImage: UIImageView!
    
    var characterDescription: Character! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterDescriptionLabel.numberOfLines = characterDescription.descriptionLinesCount
        characterDescriptionLabel.text = "\(characterDescription.description)"
        NetworkingManager.shared.fetchImage(from: characterDescription.image) { result in
            switch result {
            case .success(let imageData):
                self.characterDescriptionImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
                self.characterDescriptionImage.image = .checkmark
            }
        }
    }
}
