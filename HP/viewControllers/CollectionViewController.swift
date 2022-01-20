//
//  CollectionViewController.swift
//  HP
//
//  Created by Артем Черненко on 16.01.2022.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    private var characters: [Character] = []
    
    override func viewDidLoad() {
        fetchCharacter()
        navigationController?.navigationBar.topItem?.title = "Harry Potter characters"
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
        
        cell.configure(from: characters[indexPath.item])
        return cell
    }
    
    private func fetchCharacter() {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = collectionView.indexPathsForSelectedItems else { return }
        let character = characters[indexPath[0].item]
        print(indexPath[0].item)
        let descriptionVC = segue.destination as! CharacterDescriptionViewController
        descriptionVC.characterDescription = character
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 20, height: 80)
    }
}
