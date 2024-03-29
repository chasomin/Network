//
//  LottoAPIManager.swift
//  NetworkApp
//
//  Created by 차소민 on 1/16/24.
//

import Foundation
import Alamofire

struct LottoAPIManager {
    
    func callRequest(number: String, completionHandler: @escaping (Lotto) -> Void ) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        
        AF.request(url, method: .get).responseDecodable(of: Lotto.self) { response in    // method 디폴트 값은 get
            switch response.result {
            case .success(let success):
                
                completionHandler(success)
                
            case .failure(let failure):
                print("오류 발생")
            }
        }
    }

}
