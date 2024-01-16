//
//  LottoViewController.swift
//  NetworkApp
//
//  Created by 차소민 on 1/16/24.
//

import UIKit

class LottoViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    @IBOutlet var numImageView: [UIImageView]!
    var lottoPickerView = UIPickerView()
    var num: [Int] = [] {
        didSet {
            setColor()
        }
    }
    
    let numberList: [Int] = Array(1...1102).reversed()
    
    let manager = LottoAPIManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setPickerView()
        setColor()

    }
    
    
    @IBAction func pickerViewDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    

}

extension LottoViewController {
    func setUI() {
        textField.text = "1102회차"
        textField.inputView = lottoPickerView
        textField.textAlignment = .center

        manager.callRequest(number: "1102") { value in
            self.num = [value.drwtNo1,value.drwtNo2,value.drwtNo3,value.drwtNo4,value.drwtNo5,value.drwtNo6,value.bnusNo]
            for i in 0...6 {
                self.numImageView[i].image = UIImage(systemName: "\(self.num[i]).circle.fill")
            }

        }
        
    }
    
    func setPickerView() {
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
    }
    
    func setColor() {
        for i in 0..<num.count {
            switch num[i] {
            case 1...10 :
                numImageView[i].tintColor = .systemYellow
            case 11...20 :
                numImageView[i].tintColor = .systemBlue
            case 21...30 :
                numImageView[i].tintColor = .systemRed
            case 31...40 :
                numImageView[i].tintColor = .systemGray
            case 41...45 :
                numImageView[i].tintColor = .systemGreen
            default:
                break
            }
        }
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
            self.num = [value.drwtNo1,value.drwtNo2,value.drwtNo3,value.drwtNo4,value.drwtNo5,value.drwtNo6,value.bnusNo]

            for i in 0...6 {
                self.numImageView[i].image = UIImage(systemName: "\(self.num[i]).circle.fill")
            }
        }
        

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(numberList[row])회차"
    }
    
    
}
