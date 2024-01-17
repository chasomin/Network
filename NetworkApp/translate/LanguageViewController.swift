//
//  LanguageViewController.swift
//  NetworkApp
//
//  Created by 차소민 on 1/17/24.
//

import UIKit

class LanguageViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

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
        print(key)
        return cell
    }
    
    
}

