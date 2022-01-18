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
        CharacterDescriptionLabel.text = """
\(characterDescription.actor)
\(characterDescription.gender)
\(characterDescription.dateOfBirth)
"""
    }
    @IBOutlet weak var CharacterDescriptionLabel: UILabel!
    
}
