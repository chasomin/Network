//
//  BeerTableViewCell.swift
//  NetworkApp
//
//  Created by 차소민 on 1/16/24.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    let manager = BeerAPIManager()

    @IBOutlet var beerImageView: UIImageView!
    @IBOutlet var beerNameLabel: UILabel!
    @IBOutlet var beerAbvLabel: UILabel!
    @IBOutlet var beerTagLineLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    func setUI() {
        selectionStyle = .none
        beerImageView.contentMode = .scaleAspectFit
        
        beerNameLabel.font = .boldSystemFont(ofSize: 15)
        beerNameLabel.textAlignment = .left
        
        beerAbvLabel.font = .systemFont(ofSize: 12)
        beerAbvLabel.textAlignment = .left
        beerAbvLabel.textColor = .lightGray
        
        beerTagLineLabel.font = .systemFont(ofSize: 13)
        beerTagLineLabel.textAlignment = .left
    }
    
}

