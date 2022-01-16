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
    
    func getCharacterDescription() {
        guard let url = URL(string: "http://hp-api.herokuapp.com/api/characters") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            do {
                _ = try JSONDecoder().decode([Character].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        } .resume()
    }
}


//Что то я окончательно запутался
//не смог вернуть массив структур из функции (на что только не ругался компилятор)
//отсюда и все остальные проблемы в виде как синглтон без инициализации сделать
//плохо дело(
//даже не понимаю в правильном ли направлениии двигаюсь
