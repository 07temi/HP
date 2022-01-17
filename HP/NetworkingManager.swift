//
//  NetworkingManager.swift
//  HP
//
//  Created by Артем Черненко on 16.01.2022.
//
import Foundation

class NetworkingManager {
    static var shared = NetworkingManager()
    private init() {}

    func getCharacterDescription(completion: @escaping([Character]) -> Void) {
        guard let url = URL(string: "http://hp-api.herokuapp.com/api/characters") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            do {
              let characters = try JSONDecoder().decode([Character].self, from: data)
                completion(characters)
            } catch {
                print(error.localizedDescription)
            }
        } .resume()
    }
}
