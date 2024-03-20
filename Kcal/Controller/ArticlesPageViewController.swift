//
//  ArticlesPageViewController.swift
//  Kcal
//
//  Created by Dana Sami Abu Eid on 21/03/2024.
//

import UIKit

class ArticlesPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var articles: [Articles] = [
        Articles(image: "burger-pana", label: "The pros and cons of fast food.", backgroundColor: "Background1", ButtonColor: "DarkPink"),
        Articles(image: "healthy-food-pana", label: "The Green Salad Pros", backgroundColor: "GreenWhite", ButtonColor: "LightGreen"),
        Articles(image: "Shawarma-pana", label: "Shawarma Is The Best Food!", backgroundColor: "WhiteYellow", ButtonColor: "DarkPink")
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
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticlesItemsController") as! ArticlesItemsController
        vc.imageName = articles[index].image
        vc.titleText = articles[index].label
        vc.backgroundColor = articles[index].backgroundColor
        vc.buttonColor = articles[index].ButtonColor
        vc.pageIndex = index
        return vc
    }

    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = articles.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
    }
}
