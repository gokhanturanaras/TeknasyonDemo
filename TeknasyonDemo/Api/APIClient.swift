//
//  APIClient.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import Foundation
import Alamofire
import RxSwift

public class APIClient {
    
    static func popular(language: String, page: Int) -> Observable<PopularResponse> {
        return request(APIRouter.popular(language: language, page: page))
    }
    
    private static func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
           //Create an RxSwift observable, which will be the one to call the request when subscribed to
           return Observable<T>.create { observer in
               //Trigger the HttpRequest using AlamoFire (AF)
               let request = AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
                   //Check the result from Alamofire's response and check if it's a success or a failure
                   switch response.result {
                   case .success(let value):
                       //Everything is fine, return the value in onNext
                       observer.onNext(value)
                       observer.onCompleted()
                   case .failure(let error):
                       observer.onError(error)
                   }
               }
               
               //Finally, we return a disposable to stop the request
               return Disposables.create {
                   request.cancel()
               }
           }
       }
}
