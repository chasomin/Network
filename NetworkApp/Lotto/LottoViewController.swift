//
//  LottoViewController.swift
//  NetworkApp
//
//  Created by 차소민 on 1/16/24.
//

import UIKit

class LottoViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var numLabel: UILabel!
    
    var lottoPickerView = UIPickerView()
    
    let numberList: [Int] = Array(1...1102).reversed()
    
    let manager = LottoAPIManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setPickerView()
    }
    
    func setUI() {
        textField.text = "1102회차"
        textField.inputView = lottoPickerView
        textField.textAlignment = .center

        manager.callRequest(number: "1102") { value in
            self.numLabel.text = value
        }
        numLabel.textAlignment = .center
        numLabel.font = .boldSystemFont(ofSize: 24)
    }
    
    func setPickerView() {
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
    }

}


extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        numberList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = "\(numberList[row])회차"
        
        manager.callRequest(number: "\(numberList[row])") { value in
            self.numLabel.text = value
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(numberList[row])회차"
    }
    
    
}
