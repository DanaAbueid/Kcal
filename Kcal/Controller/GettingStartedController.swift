//
//  PageItemViewController.swift
//  Kcal
//
//  Created by Dana Sami Abu Eid on 18/03/2024.
//

import UIKit

class GettingStartedController: UIViewController, CustomPageViewControllerDelegate {
    
    
    var pageViewController: CustomPageViewController!
    @IBOutlet weak var sharedLabel: UILabel!
       @IBOutlet weak var sharedButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageVC = segue.destination as? CustomPageViewController {
            self.pageViewController = pageVC
            pageViewController.pageDelegate = self
            self.pageControl.numberOfPages = pageViewController.pageContents.count
        }
    }

    @IBAction func LogInPressed(_ sender: UIButton) {

    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        pageControl.currentPage = currentIndex

    }

}
