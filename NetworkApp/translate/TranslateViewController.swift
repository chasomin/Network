//
//  TranslateViewController.swift
//  NetworkApp
//
//  Created by 차소민 on 1/17/24.
//

import UIKit
import Alamofire

class TranslateViewController: UIViewController {

    @IBOutlet var sourceLanguageButton: UIButton!
    @IBOutlet var targetLanguageButton: UIButton!
    @IBOutlet var changeButton: UIButton!
    
    @IBOutlet var textView: UITextView!
    
    @IBOutlet var translateButton: UIButton!
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        textView.delegate = self
        
        translateButton.addTarget(self, action: #selector(translateButtonTapped), for: .touchUpInside)
        
        sourceLanguageButton.addTarget(self, action: #selector(sourceLanguageButtonTapped), for: .touchUpInside)
        targetLanguageButton.addTarget(self, action: #selector(targetLanguageButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func translateButtonTapped() {
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        
        let parameters: Parameters = ["source":"ko",
                                      "target":"en",
                                      "text":textView.text!]
        
        let headers:HTTPHeaders = ["X-Naver-Client-Id":APIKey.naverClientID,
                                   "X-Naver-Client-Secret":APIKey.naberClientSecret]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   headers: headers)
            .responseDecodable(of: Papago.self) { response in
                switch response.result {
                case .success(let success):
                    dump(success)
                    self.resultLabel.text = success.message.result.translatedText
                case .failure(let failure):
                    print(failure)
                }
            }
    }

    
    @objc func sourceLanguageButtonTapped() {
        let vc = storyboard?.instantiateViewController(withIdentifier: LanguageViewController.id) as! LanguageViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func targetLanguageButtonTapped() {
        let vc = storyboard?.instantiateViewController(withIdentifier: LanguageViewController.id) as! LanguageViewController
        
        navigationController?.pushViewController(vc, animated: true)

    }
}

extension TranslateViewController {
    func setUI() {
        sourceLanguageButton.setTitle("한국어", for: .normal)
        
        targetLanguageButton.setTitle("영어", for: .normal)
        
        changeButton.setTitle("", for: .normal)
        changeButton.setImage(UIImage(systemName: "arrow.right.arrow.left"), for: .normal)
        changeButton.layer.cornerRadius = 17
        changeButton.layer.borderWidth = 1
        changeButton.layer.borderColor = UIColor.gray.cgColor
        changeButton.layer.backgroundColor = UIColor.systemGray4.cgColor
        
        textView.text = "번역할 내용을 입력하세요."
        textView.textColor = .gray
        textView.textAlignment = .center
        
        translateButton.setTitle("번역하기", for: .normal)
        translateButton.tintColor = .white
        translateButton.backgroundColor = .systemBlue
        translateButton.layer.cornerRadius = 17
        
        
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0
        resultLabel.text = ""
    }
}

extension TranslateViewController: UITextViewDelegate {

    func  textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .gray {
            textView.text = nil
            textView.textColor = .label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "메시지를 입력하세요"
            textView.textColor = .gray
        }
    }
 
}

