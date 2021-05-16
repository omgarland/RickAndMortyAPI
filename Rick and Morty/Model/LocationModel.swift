//

import Foundation

struct LocationModel: Decodable, Identifiable {
    let id: String
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "url"
        case name
        case type
        case dimension
        case residents
    }
}

struct LocationPage: Decodable, Pageable  {
    typealias results = [LocationModel]
    var results: [LocationModel]
    var info: InfoModel
    
    enum CodingKeys: String, CodingKey {
        case info
        case results
    }
}
