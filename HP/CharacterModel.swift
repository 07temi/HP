//
//  CharacterModel.swift
//  HP
//
//  Created by Артем Черненко on 16.01.2022.
//

struct Character: Decodable {
    let name: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let eyeColour: String?
    let hairColour: String?
    let patronus: String?
    let actor: String?
    let image: String?

    init(name: String, gender: String, house: String, dateOfBirth: String,
         eyeColour: String, hairColour: String, patronus: String, actor: String,
         image: String) {
        self.name = name
        self.gender = gender
        self.house = house
        self.dateOfBirth = dateOfBirth
        self.eyeColour = eyeColour
        self.hairColour = hairColour
        self.patronus = patronus
        self.actor = actor
        self.image = image
    }
    
    init(characterData: [String: Any]) {
        name = characterData["name"] as? String
        gender = characterData["gender"] as? String
        house = characterData["house"] as? String
        dateOfBirth = characterData["dateOfBirth"] as? String
        eyeColour = characterData["eyeColour"] as? String
        hairColour = characterData["hairColour"] as? String
        patronus = characterData["patronus"] as? String
        actor = characterData["actor"] as? String
        image = characterData["image"] as? String
    }
    
    static func getCharacter(from value: Any) -> [Character] {
        guard let characterData = value as? [[String: Any]] else { return [] }
        return characterData.compactMap { Character(characterData: $0)}
    }
}
