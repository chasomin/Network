//
//  LanguageViewController.swift
//  NetworkApp
//
//  Created by 차소민 on 1/17/24.
//

import UIKit

class LanguageViewController: UIViewController {
    var source = ""
    var target = ""

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension

        let xib = UINib(nibName: LanguageTableViewCell.id, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: LanguageTableViewCell.id)

    }
    


}

extension LanguageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Language.language.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LanguageTableViewCell.id, for: indexPath) as! LanguageTableViewCell
        let key: [String] = Array(Language.language.keys)
        cell.languageLabel.text = Language.language[key[indexPath.row]]
        if source == key[indexPath.row] || target == key[indexPath.row] {
            cell.languageLabel.textColor = .systemBlue
        }
        return cell
    }
    
    
}

