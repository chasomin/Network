//
//  BookAPIManager.swift
//  NetworkApp
//
//  Created by 차소민 on 1/17/24.
//

import Foundation
import Alamofire

struct BookAPIManager {
    func callRequest(query: String, size: Int, completionHandler: @escaping (Book) -> Void) {
        let url = "https://dapi.kakao.com/v3/search/book?query=\(query)&size=\(size)"
        let headers: HTTPHeaders = ["Authorization":APIKey.kakaoAuthorization]
        
        AF.request(url, method: .get, headers: headers)
            .responseDecodable(of: Book.self) { response in
                switch response.result {
                case .success(let success):
                    dump(success.documents)
                    completionHandler(success)
                case .failure(let failure):
                    print(failure)
                }
            }
    }
}
