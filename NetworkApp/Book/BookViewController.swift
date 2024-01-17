//
//  BookViewController.swift
//  NetworkApp
//
//  Created by 차소민 on 1/17/24.
//

import UIKit
import Kingfisher

class BookViewController: UIViewController {
    
    let manager = BookAPIManager()

    var size = 0
    
    var data: [Document] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        setUI()
        setCollectionView()
    }
}

extension BookViewController {
    
    func setCollectionView() {
        let xib = UINib(nibName: BookCollectionViewCell.id, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: BookCollectionViewCell.id)

    }
    
    func setUI() {
        let spacing: CGFloat = 10
        let width = (UIScreen.main.bounds.width - (spacing*3)) / 2
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        
        searchBar.placeholder = "책을 검색해보세요"
        
    }
        

}

extension BookViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.id, for: indexPath) as! BookCollectionViewCell
        
        cell.titleLabel.text = data[indexPath.item].title
        cell.authorLabel.text = data[indexPath.item].authors.first
        cell.imageView.kf.setImage(with: URL(string: data[indexPath.item].thumbnail))
        
        return cell
    }
    
    
}

extension BookViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        size = 10
        manager.callRequest(query: searchBar.text!, size: self.size) { data in
            self.data = data.documents
        }
    }
}
