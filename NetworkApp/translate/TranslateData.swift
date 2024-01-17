//
//  TranslateData.swift
//  NetworkApp
//
//  Created by 차소민 on 1/17/24.
//

import Foundation


struct Papago: Codable {
    let message: Message
}

struct Message: Codable {
    let result: Result
}

struct Result: Codable {
    let srcLangType: String
    let tarLangType: String
    let translatedText: String
}

struct Language {
    static let language = ["ko":"한국어",
                    "en":"영어",
                    "ja":"일본어",
                    "zh-CN":"중국어 간체",
                    "zh-TW":"중국어 번체",
                    "vi":"베트남어",
                    "id":"인도네시아어",
                    "th":"태국어",
                    "de":"독일어",
                    "ru":"러시아어",
                    "es":"스페인어",
                    "it":"이탈리아어",
                    "fr":"프랑스어"
    ]
}
