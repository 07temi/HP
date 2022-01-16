//
//  CharacterModel.swift
//  HP
//
//  Created by Артем Черненко on 16.01.2022.
//

struct Character: Decodable {
    let name: String
    let gender: String
    let house: String
    let dateOfBirth: String
    let eyeColour: String
    let hairColour: String
    let patronus: String
    let actor: String
    let image: String
}
