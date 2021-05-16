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

