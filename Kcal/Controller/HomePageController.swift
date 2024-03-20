//
//  HomePageController.swift
//  Kcal
//
//  Created by Dana Sami Abu Eid on 21/03/2024.
//

import UIKit

class HomePageController: UIViewController {

    @IBOutlet weak var FavorCollection: UICollectionView!
    
    
    var mySquares: [Square] = [
        Square(image: "strawberry", label: "Fruits", backgroundColor: "LightPink",FontColor: "DeepRed"),
        Square(image: "brokely", label: "Vegetables", backgroundColor: "GreenWhite",FontColor: "DeepGreen"),
        Square(image: "pizzaSlice", label: "Snacks", backgroundColor: "WhiteYellow",FontColor: "DeepOrange")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FavorCollection.delegate = self
          FavorCollection.dataSource = self
          FavorCollection.reloadData()
    }


}

// MARK: - Collection View
extension HomePageController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return mySquares.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionViewCell else {
                fatalError("Unable to dequeue CustomCollectionViewCell")
            }
            let square = mySquares[indexPath.row]
            cell.configure(with: square)
            return cell
        }
    
    
}
