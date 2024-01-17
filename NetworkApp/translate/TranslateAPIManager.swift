//
//  TranslateAPIManager.swift
//  NetworkApp
//
//  Created by 차소민 on 1/17/24.
//

import Foundation
import Alamofire

struct TranslateAPIManager {
    func allRequest(text: String, completionHandler: @escaping (Papago) -> Void) {
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        
        let parameters: Parameters = ["source":"ko",
                                      "target":"en",
                                      "text":text]
        
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
                    completionHandler(success)
                case .failure(let failure):
                    print(failure)
                }
            }
    }
}
