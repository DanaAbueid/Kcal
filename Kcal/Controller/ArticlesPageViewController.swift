//
//  ArticlesPageViewController.swift
//  Kcal
//
//  Created by Dana Sami Abu Eid on 21/03/2024.
//

import UIKit
class ArticlesPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    weak var articlesDelegate: ArticlesPageViewControllerDelegate?
    
    var articles: [Articles] = [
        Articles(image: "burger-pana", label: "The pros and cons of fast food.", backgroundColor: "PinkWhite"),
        Articles(image: "healthy-food-pana", label: "The Green Salad Pros", backgroundColor: "GreenWhite"),
        Articles(image: "Shawarma-pana", label: "Shawarma Is The Best Food!", backgroundColor: "WhiteYellow")
    ]

    var pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self

        if let firstViewController = viewControllerAtIndex(index: 0) {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }

        configurePageControl()
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return articles.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        // If you want the pageControl to be updated correctly,
        // you might need to keep track of the current index in a variable and return it here
        return 0
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? ArticlesItemsController, let index = viewController.pageIndex, index > 0 else {
            return nil
        }
        return viewControllerAtIndex(index: index - 1)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? ArticlesItemsController, let index = viewController.pageIndex, index < articles.count - 1 else {
            return nil
        }
        return viewControllerAtIndex(index: index + 1)
    }
    
    func viewControllerAtIndex(index: Int) -> ArticlesItemsController? {
        if index >= articles.count {
            return nil
        }
        let vc = ArticlesItemsController(nibName: "ArticlesItemsController", bundle: nil)
        vc.imageName = articles[index].image
        vc.titleText = articles[index].label
        vc.backgroundColor = articles[index].backgroundColor
      //  vc.buttonColor = articles[index].ButtonColor
        vc.pageIndex = index
        return vc
    }

    func configurePageControl() {
        pageControl.frame = CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50)
        pageControl.numberOfPages = articles.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
    }
    
    // Example delegate method call
    // You would call this when you need to update your delegate about the page change.
    // For example, after a swipe is detected and the current page is determined:
    func updateDelegateWithCurrentPageIndex(index: Int) {
        articlesDelegate?.didUpdatePageIndex(currentIndex: index)
    }
}

protocol ArticlesPageViewControllerDelegate: AnyObject {
    func didUpdatePageIndex(currentIndex: Int)
}
