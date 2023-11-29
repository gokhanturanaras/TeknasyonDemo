//
//  APIClient.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import Foundation
import Alamofire

public class APIClient {
    
    static func popular(language: String, page: Int, completion:@escaping (AFResult<PopularResponse>)->Void) {
        AF.request(APIRouter.popular(language: language, page: page))
            .responseDecodable { (response: AFDataResponse<PopularResponse>) in
                completion(response.result)}
    }
}
