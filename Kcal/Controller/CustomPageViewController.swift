//
//  ViewController.swift
//  Kcal
//
//  Created by Dana Sami Abu Eid on 15/03/2024.
//

import UIKit


class CustomPageViewController: UIPageViewController , UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  
    weak var pageDelegate: CustomPageViewControllerDelegate?
    
    var pages = [UIViewController]()
    var pageContents: [PageContent] = [
        PageContent(imageName: "Eating-healthy-food-cuate", labelTitle:"Eat Healthy" ,labelText: "Maintaining good health should be the primary focus of everyone."),
        PageContent(imageName: "Cooking-cuate", labelTitle:"Healthy Recipes" , labelText: "Browse thousands of healthy recipes from all over the world."),
        PageContent(imageName: "Mobile-cuate", labelTitle:"Track Your Health" , labelText: "With amazing inbuilt tools you can track your progress.")
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
         delegate = self
         setupPages()
         if let firstPage = pages.first {
             setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
         }

    }
    
    private func setupPages() {
           for content in pageContents {
               if let pageItemVC = storyboard?.instantiateViewController(withIdentifier: "GettingStartedPage") as? PageItemViewController {
                   pageItemVC.pageContent = content
                   pages.append(pageItemVC)
               }
           }
       }
       
       func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
           guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
               return nil
           }
           let previousIndex = viewControllerIndex - 1
           guard previousIndex >= 0 else {
               return nil
           }
           return pages[previousIndex]
       }

       func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
           guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
               return nil
           }
           let nextIndex = viewControllerIndex + 1
           guard nextIndex < pages.count else {
               return nil
           }
           return pages[nextIndex]
       }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let viewControllerIndex = viewControllers?.first.flatMap({ pages.firstIndex(of: $0) }) {
            pageDelegate?.didUpdatePageIndex(currentIndex: viewControllerIndex)
        }
    }
    
    
}

protocol CustomPageViewControllerDelegate: AnyObject {
    func didUpdatePageIndex(currentIndex: Int)
}


