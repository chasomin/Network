//
//  BeerListViewController.swift
//  NetworkApp
//
//  Created by 차소민 on 1/16/24.
//

import UIKit

class BeerListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let manager = BeerAPIManager()
    var list: [Beer] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        let xib = UINib(nibName: BeerTableViewCell.id, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: BeerTableViewCell.id)
        
        manager.callRequestList { list in
            self.list = list
//            self.tableView.reloadData()

        }

    }
    


}

extension BeerListViewController {
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension BeerListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(list.count)
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.id, for: indexPath) as! BeerTableViewCell
        
            cell.beerImageView.kf.setImage(with: URL(string: list[indexPath.row].image_url ?? ""))
            cell.beerNameLabel.text = list[indexPath.row].name
            cell.beerAbvLabel.text = list[indexPath.row].alc
            cell.beerTagLineLabel.text = list[indexPath.row].tagline

        return cell
   
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: BeerViewController.id) as!  BeerViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
