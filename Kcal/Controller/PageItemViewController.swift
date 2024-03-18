//
//  GettingStartedController.swift
//  Kcal
//
//  Created by Dana Sami Abu Eid on 18/03/2024.
//

import UIKit

class PageItemViewController: UIViewController {
    
    @IBOutlet weak var pageImage: UIImageView!
    @IBOutlet weak var pageText: UILabel!
    @IBOutlet weak var pageTitle: UILabel!
    
    var pageContent: PageContent?

        override func viewDidLoad() {
            super.viewDidLoad()
            configurePage()
        }
        
        func configurePage() {
            pageImage.image = UIImage(named: pageContent?.imageName ?? "")
            pageTitle.text = pageContent?.labelTitle
            pageText.text = pageContent?.labelText
        }
    
  
}
