//
//  HomePageController.swift
//  Kcal
//
//  Created by Dana Sami Abu Eid on 21/03/2024.
//

import UIKit

class HomePageController: UIViewController {

    @IBOutlet weak var FavorCollection: UICollectionView!
    
    @IBOutlet weak var pageControler: UIPageControl!
    
    var mySquares: [Square] = [
        Square(image: "strawberry", label: " Fruits", backgroundColor: "LightPink",FontColor: "DeepRed"),
        Square(image: "brokely", label: "Vegetables", backgroundColor: "GreenWhite",FontColor: "DeepGreen"),
        Square(image: "pizzaSlice", label: "Snacks", backgroundColor: "WhiteYellow",FontColor: "DeepOrange")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FavorCollection.delegate = self
          FavorCollection.dataSource = self
          FavorCollection.reloadData()
    }
    // MARK: - Page View



}

// MARK: - Collection View
extension HomePageController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

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


/*    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16) // Adjust as needed
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16 // Adjust the spacing between rows/items as needed
    }
*/
}

// MARK: - Page View


extension HomePageController: ArticlesPageViewControllerDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageViewController = segue.destination as? ArticlesPageViewController {
            pageViewController.articlesDelegate = self
        }
    }
    
    
    func didUpdatePageIndex(currentIndex: Int) {
        pageControler.currentPage = currentIndex
    }
}


