//
//  CollectionViewController.swift
//  HP
//
//  Created by Артем Черненко on 16.01.2022.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    private var character: [Character] = []
//    private var segueData: Character!
    
    override func viewDidLoad() {
        fetchCharacter()
        }
    
    private func fetchCharacter() {
        NetworkingManager.shared.getCharacterDescription{ character in
            DispatchQueue.main.async {
//                DataManager.share.character = character
                self.character = character
                self.collectionView.reloadData()
            }
            
        }
//        print(DataManager.share.character.count)
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        character.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
    
        cell.collectionViewCellLabel.text = character[indexPath.item].name
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let segueData = character[indexPath.item]
        print(segueData.actor)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "characterDescriptionSegue" {
            let characterDescriptionVC = segue.destination as! CharacterDescriptionViewController
//            print(segueData.actor)
        }
    }

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 80)
    }
}
