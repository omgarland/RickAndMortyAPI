//

import Foundation

struct LocationPage: Decodable, Pageable  {
    typealias results = [LocationModel]
    var results: [LocationModel]
    var info: InfoModel
    
    enum CodingKeys: String, CodingKey {
        case info
        case results
    }
}
