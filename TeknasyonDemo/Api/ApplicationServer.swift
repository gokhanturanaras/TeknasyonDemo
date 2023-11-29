//
//  ApplicationServer.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import Foundation

struct ApplicationServer {
    static let baseUrl = "https://api.themoviedb.org/3/tv/"
    static let imageUrl = "https://image.tmdb.org/t/p/original"
}


enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    
    var data: String? {
        switch self{
        case .authentication:
            return "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZTdlM2QwNDhhMWQ4ODk0YzIyM2YzMDk5ZjE5MDg2NSIsInN1YiI6IjY1NjVkMmE1YzJiOWRmMDEzYWUzZGRlMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LCcz1BpjFSzh_bsRmjr4ZFym4GJyZ_Z8nSrit8SX9tw"
        default:
            return nil
        }
    }
}

enum ContentType: String {
    case json = "application/json"
}
