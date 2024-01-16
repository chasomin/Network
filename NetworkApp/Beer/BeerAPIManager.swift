//
//  BeerAPIManager.swift
//  NetworkApp
//
//  Created by 차소민 on 1/16/24.
//

import Foundation
import Alamofire



struct BeerAPIManager {
    
    func callRequest(completionHandler: @escaping (Beer) -> Void) {
        let url = "https://api.punkapi.com/v2/beers/random"
        AF.request(url, method: .get).responseDecodable(of: [Beer].self) { response in
            switch response.result {
            case .success(let success):
//                print(success[0].name)
                completionHandler(success[0])
                
            case .failure(let failure):
                print("오류")
                print(failure)
            }
        }
    }
}



