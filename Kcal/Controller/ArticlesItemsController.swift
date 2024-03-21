//
//  ArticlesItemsController.swift
//  Kcal
//
//  Created by Dana Sami Abu Eid on 21/03/2024.
//

import UIKit

class ArticlesItemsController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!

    var imageName: String?
    var titleText: String?
    var backgroundColor: String?
    var buttonColor: String?
    var pageIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        imageView.image = UIImage(named: imageName ?? "")
        titleLabel.text = titleText
        view.backgroundColor = UIColor(named: backgroundColor ?? "")
        // actionButton.backgroundColor = UIColor(named: buttonColor ?? "")
        view.layer.cornerRadius = 32
           view.clipsToBounds = true
    }
}
