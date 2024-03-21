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
    // MARK: - Page View



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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 16 // Or whatever padding you want
        let collectionViewSize = collectionView.frame.size.width - padding
        let width = collectionViewSize / 2
        return CGSize(width: width, height: width) // Creates a square cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageViewController = segue.destination as? ArticlesPageViewController {
            pageViewController.articlesDelegate = self
        }
    }

    
    
}

extension HomePageController: ArticlesPageViewControllerDelegate {
    func didUpdatePageIndex(currentIndex: Int) {
        pageControler.currentPage = currentIndex
    }
}

// MARK: - Page View

