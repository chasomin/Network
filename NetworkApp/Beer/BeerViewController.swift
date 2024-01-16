//
//  BeerViewController.swift
//  NetworkApp
//
//  Created by 차소민 on 1/16/24.
//

import UIKit
import Kingfisher

class BeerViewController: UIViewController {
    static var id = "BeerViewController"

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var abvLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var foodPairingTitleLabel: UILabel!
    @IBOutlet var pairingLabel: UILabel!
    @IBOutlet var randomButton: UIButton!
    
    let manager = BeerAPIManager()
    let noImage = "https://e-topplus.kr/images/no_img.jpg"
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        manager.callRequest { beer in            
            self.imageView.kf.setImage(with: URL(string: beer.image_url ?? self.noImage))
            self.nameLabel.text = beer.name
            self.abvLabel.text = beer.alc
            self.descriptionLabel.text = beer.description
            self.pairingLabel.text = beer.food
        }
        
    }

    @IBAction func randomButtonTapped(_ sender: UIButton) {
        manager.callRequest { beer in
            self.imageView.kf.setImage(with: URL(string: beer.image_url ?? self.noImage))
            self.nameLabel.text = beer.name
            self.abvLabel.text = beer.alc
            self.descriptionLabel.text = beer.description
            self.pairingLabel.text = beer.food
        }
    }
    
}

extension BeerViewController {
    
    func setUI() {
        titleLabel.text = "오늘은 이 맥주를 추천합니다!"
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        
        imageView.contentMode = .scaleAspectFit
        
        nameLabel.font = .boldSystemFont(ofSize: 17)
        nameLabel.textAlignment = .center
        
        abvLabel.font = .systemFont(ofSize: 10)
        abvLabel.textAlignment = .center
        abvLabel.textColor = .lightGray
        
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        
        foodPairingTitleLabel.text = "Food Pairing"
        foodPairingTitleLabel.font = .boldSystemFont(ofSize: 13)
        foodPairingTitleLabel.textAlignment = .center

        
        pairingLabel.font = .systemFont(ofSize: 12)
        pairingLabel.textAlignment = .center
        pairingLabel.numberOfLines = 0

        
        randomButton.setTitle("다른 맥주 추천받기", for: .normal)
        randomButton.setImage(UIImage(systemName: "character.bubble.he"), for: .normal)
        randomButton.tintColor = .orange
    }
}
