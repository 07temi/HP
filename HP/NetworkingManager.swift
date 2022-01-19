//
//  NetworkingManager.swift
//  HP
//
//  Created by Артем Черненко on 16.01.2022.
//
import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

//let url = "http://hp-api.herokuapp.com/api/characters"

class NetworkingManager {
    static var shared = NetworkingManager()
    private init() {}
    
//    func getCharacterDescription(completion: @escaping([Character]) -> Void) {
//        guard let url = URL(string: "http://hp-api.herokuapp.com/api/characters") else { return }
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "Unknown error")
//                return
//            }
//            do {
//                let characters = try JSONDecoder().decode([Character].self, from: data)
//                completion(characters)
//            } catch {
//                print(error.localizedDescription)
//            }
//        } .resume()
//    }
    func fetchImage(from url: String?, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    
    func fetchData(_ url: String, completion: @escaping(Result<[Character], NetworkError>) -> Void) {
        AF.request(url).validate().responseJSON { dataResponse in
            switch dataResponse.result {
            case .success(let value):
                let characters = Character.getCharacter(from: value)
                completion(.success(characters))
            case .failure:
                completion(.failure(.decodingError))
            }
        }
    }
    
}
