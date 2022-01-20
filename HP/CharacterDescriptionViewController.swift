//
//  CharacterDescriptionViewController.swift
//  HP
//
//  Created by Артем Черненко on 17.01.2022.
//

import UIKit

class CharacterDescriptionViewController: UIViewController {
    
var characterDescription: Character! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CharacterDescriptionLabel.text = "\(characterDescription.description)"
        NetworkingManager.shared.fetchImage(from: characterDescription.image) { result in
            switch result {
            case .success(let imageData):
                self.characterDescriptionImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
                self.characterDescriptionImage.image = .remove
            }
        }
    }

    @IBOutlet weak var CharacterDescriptionLabel: UILabel!
    @IBOutlet weak var characterDescriptionImage: UIImageView!
}
