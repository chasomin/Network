//
//  BookCollectionViewCell.swift
//  NetworkApp
//
//  Created by 차소민 on 1/17/24.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    func setUI() {
        layer.borderWidth = 3
        layer.borderColor = UIColor(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1), alpha: 1).cgColor
        layer.cornerRadius = 15
        backgroundColor = .systemGray6
        
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 1
        titleLabel.font = .boldSystemFont(ofSize: 15)
        
        authorLabel.textAlignment = .center
        authorLabel.numberOfLines = 1
        authorLabel.font = .systemFont(ofSize: 13)
        
        imageView.contentMode = .scaleAspectFill
        
    }
}
