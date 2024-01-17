//
//  TranslateViewController.swift
//  NetworkApp
//
//  Created by 차소민 on 1/17/24.
//

import UIKit

class TranslateViewController: UIViewController {
    let manager = TranslateAPIManager()
    
    
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
        manager.allRequest(text: textView.text!) { data in
            self.resultLabel.text = data.message.result.translatedText
        }
        view.endEditing(true)

    }

    
    @objc func sourceLanguageButtonTapped() {
        let vc = storyboard?.instantiateViewController(withIdentifier: LanguageViewController.id) as! LanguageViewController
        
        vc.source = "ko"
        vc.target = ""
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func targetLanguageButtonTapped() {
        let vc = storyboard?.instantiateViewController(withIdentifier: LanguageViewController.id) as! LanguageViewController
        vc.target = "en"
        vc.source = ""
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

