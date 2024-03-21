//
//   For example, if you want the imageView also to have rounded corners, do the same:         imageView.layer.cornerRadius = 32         imageView.clipsToBounds = true     } } CustomCollectionViewCell.swift
//  Kcal
//
//  Created by Dana Sami Abu Eid on 20/03/2024.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        
        self.contentView.layer.cornerRadius = 32
        self.contentView.layer.masksToBounds = true
        
    }
    
    func configure(with square: Square) {
            imageView.image = UIImage(named: square.image)
            label.text = square.label
            contentView.backgroundColor = UIColor(named: square.backgroundColor) ?? .gray
        label.textColor = UIColor(named: square.FontColor) ?? .black
          
        }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layer.cornerRadius = 32
        self.contentView.layer.masksToBounds = true
    }

}
