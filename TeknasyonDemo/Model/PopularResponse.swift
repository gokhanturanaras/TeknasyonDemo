//
//  PopularResponse.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import Foundation

// MARK: - PopularResponse
public struct PopularResponse: Codable {
    public let page: Int?
    public let results: [Popular]?
    public let totalPages: Int?
    public let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

    public init(page: Int?, results: [Popular]?, totalPages: Int?, totalResults: Int?) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

// MARK: - Result
public struct Popular: Codable {
    public let adult: Bool?
    public let backdropPath: String?
    public let genreids: [Int]?
    public let id: Int?
    public let originCountry: [String]?
    public let originalLanguage: String?
    public let originalName: String?
    public let overview: String?
    public let popularity: Double?
    public let posterPath: String?
    public let firstAirDate: String?
    public let name: String?
    public let voteAverage: Double?
    public let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreids = "genre_ids"
        case id = "id"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case name = "name"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }

    public init(adult: Bool?, backdropPath: String?, genreids: [Int]?, id: Int?, originCountry: [String]?, originalLanguage: String?, originalName: String?, overview: String?, popularity: Double?, posterPath: String?, firstAirDate: String?, name: String?, voteAverage: Double?, voteCount: Int?) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreids = genreids
        self.id = id
        self.originCountry = originCountry
        self.originalLanguage = originalLanguage
        self.originalName = originalName
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.firstAirDate = firstAirDate
        self.name = name
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
