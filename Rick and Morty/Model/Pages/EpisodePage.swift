//

import Foundation

struct EpisodePage: Decodable, Pageable {
    typealias results = [EpisodeModel]
    var results: [EpisodeModel]
    var info: InfoModel
    
    enum CodingKeys: String, CodingKey {
        case info
        case results
    }
}
