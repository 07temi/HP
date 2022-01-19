//
//  CollectionViewController.swift
//  HP
//
//  Created by Артем Черненко on 16.01.2022.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    private var characters: [Character] = []
    private var index = 0
    
//    private var segueData: Character!
    
    override func viewDidLoad() {
//        fetchCharacter()
        fetchCharacter2()
        navigationController?.navigationBar.topItem?.title = "Harry Potter characters"
        }
    
//    private func fetchCharacter() {
//        NetworkingManager.shared.getCharacterDescription{ character in
//            DispatchQueue.main.async { //как вернуться в sync чтобы получить доступ к переменной?
//                self.characters = character
//                self.collectionView.reloadData()
//            }
//        }
//    }
    
    private func fetchCharacter2() {
        NetworkingManager.shared.fetchData("http://hp-api.herokuapp.com/api/characters") { result in
            switch result {
            case .success(let characters):
                self.characters = characters
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
    
        cell.collectionViewCellLabel.text = characters[indexPath.item].name
        cell.configure(with: characters[indexPath.item])
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        index = indexPath.item
        performSegue(withIdentifier: "characterDescriptionSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "characterDescriptionSegue" {
            let characterDescriptionVC = segue.destination as! CharacterDescriptionViewController
            
            //characterDescriptionVC.characterDescription = characters[index]
            
        }
    }

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 20, height: 80)
    }
}
