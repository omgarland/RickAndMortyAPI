//

import Foundation

struct EpisodeModel: Decodable, Identifiable {
    let id: String
    let name: String
    let episode: String
    let airDate: String
    let characters: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "url"
        case name
        case episode
        case airDate = "air_date"
        case characters
    }
}

struct EpisodePage: Decodable, Pageable {
    typealias results = [EpisodeModel]
    var results: [EpisodeModel]
    var info: InfoModel
    
    enum CodingKeys: String, CodingKey {
        case info
        case results
    }
}
