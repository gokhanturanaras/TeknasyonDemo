//
//  APIRouter.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration{
    case popular(language:String ,page:Int)
    
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .popular:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .popular:
            return "popular"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .popular(let language, let page):
            return ["language":language, "page": page]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = "\(ApplicationServer.baseUrl)\(path)"
    
        var urlComponents = URLComponents(string: url)!
    
        if method == .get {
            if parameters != nil{
                var queryItems = [URLQueryItem]()
                for (key,value) in parameters!{
                    if "\(value)" != "nil"{
                        queryItems.append(URLQueryItem(name: key, value: "\(value)"))
                    }
                }
                urlComponents.queryItems = queryItems
            }
        }
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.timeoutInterval = 120
        
        if method != .delete {
            urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
            urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        }
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(HTTPHeaderField.authentication.data, forHTTPHeaderField:HTTPHeaderField.authentication.rawValue)
        
        // Parameters
        if method == .post || method == .put || method == .patch {
            if let parameters = parameters {
                do {
                    
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                    
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            }
        }
        
        return urlRequest
    }
    
    
}
